// Get the most intense light Dir from probes OR from a light source. Method developed by Xiexe / Merlin
half3 calcLightDir(float3 worldPos)
{   
    half3 lightDir = UnityWorldSpaceLightDir(worldPos);

    half3 probeLightDir = unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz;
    lightDir = (lightDir + probeLightDir); //Make light dir the average of the probe direction and the light source direction.

    #if !defined(POINT) && !defined(SPOT) && !defined(VERTEXLIGHT_ON) // if the average length of the light probes is null, and we don't have a directional light in the scene, fall back to our fallback lightDir
        if(length(unity_SHAr.xyz*unity_SHAr.w + unity_SHAg.xyz*unity_SHAg.w + unity_SHAb.xyz*unity_SHAb.w) == 0 && length(lightDir) < 0.1)
        {
            lightDir = half4(1, 1, 1, 0);
        }
    #endif

    return normalize(lightDir);
}

void calcLightCol(bool lightEnv, inout half3 indirectDiffuse, inout half4 lightColor)
{
    //If we're in an environment with a realtime light, then we should use the light color, and indirect color raw.
    //Otherwise, we can use the raw indirect color as the light color, and halve if for the indirect color. 
    //This produces a result that looks very similar to realtime lighting.
    if(lightEnv)
    {
        lightColor = _LightColor0;
        indirectDiffuse = indirectDiffuse;
    }
    else
    {
        lightColor = indirectDiffuse.xyzz;
        indirectDiffuse = indirectDiffuse * 0.5;
    }
}

half4 calcRamp(sampler2D tex, float2 rampUV)
{
    half4 ramp = tex2D(tex, rampUV);
    return ramp;
}

half3 calcIndirectDiffuse()
{// We don't care about anything other than the color from probes for toon lighting.
    half3 indirectDiffuse = half3(unity_SHAr.w, unity_SHAg.w, unity_SHAb.w);
    return indirectDiffuse;
}

half4 calcDiffuse(float attenuation, float4 albedo, half3 indirectDiffuse, half4 lightCol, half4 ramp) 
{
    half4 diffuse; 
    half4 indirect = indirectDiffuse.xyzz;
    diffuse = ramp * attenuation * lightCol + indirect;
    diffuse = albedo * diffuse;
    return diffuse;
}

half4 getRimSS(float vdn, float4 lightCol, float attenuation, float ndl, float4 indirectDiffuse)
{
    half rimIntensity = saturate(pow(1-vdn, 6)) * saturate(ndl * 0.5 + 0.3);
    half4 rim = rimIntensity * (lightCol + indirectDiffuse) * 2;
    
    rim *= attenuation + indirectDiffuse;
    return rim;
}

float3 CustomLightingFunction(struct g2f i, float3 viewDir, float3 worldNormal, sampler2D rampSkin, sampler2D rampFur, float layerType)
{
        UNITY_LIGHT_ATTENUATION(attenuation, i, i.worldPos.xyz);
    //Do direct and indirect lighting
        bool light_Env = float(any(_WorldSpaceLightPos0.xyz));        
        float3 lightDir = calcLightDir(i.worldPos.xyz);

        float ndl = lerp(dot(lightDir, worldNormal), dot(normalize(_fakeLightDir), worldNormal), _fakeLight);
        float vdn = abs(dot(viewDir, worldNormal));
        float2 rampUV = ndl * 0.5 + 0.5;	

        float3 indirectDiffuse = calcIndirectDiffuse();

        float4 skinRamp = calcRamp(_RampSkin, rampUV);
        float4 furRamp = calcRamp(_RampFur, rampUV);
        float4 ramp = lerp(skinRamp, furRamp, saturate(layerType)); 

        float4 skinAlbedo = tex2D(_MainTex, i.uv);
        float4 furAlbedo = tex2D(_furTex, lerp(i.uv, i.uv1, _UVSet));
        float4 albedo = lerp(skinAlbedo, furAlbedo, saturate(layerType));

        float4 lightCol;
        float3 lighting;

        calcLightCol(light_Env, indirectDiffuse, lightCol);
        float4 diffuse = calcDiffuse(attenuation, albedo, indirectDiffuse, lightCol, ramp);

        //Do indirect specular
        float roughness = 1-_smoothness;
        float3 reflectedDir = reflect(-viewDir, worldNormal);
        float4 indirectSpecular = (UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, reflectedDir, roughness * UNITY_SPECCUBE_LOD_STEPS));
        float3 specular = DecodeHDR(indirectSpecular, unity_SpecCube0_HDR)* _Reflectance;
        
        //Emission 
        //skin  
            float3 skinEmiss = lerp(tex2D(_Emission, i.uv * _Emission_ST.xy + _Emission_ST.zw) * _EmissionColor, 0, layerType);
        //fur
            float3 furEmiss = lerp(tex2D(_Emission2, i.uv * _Emission2_ST.xy + _Emission2_ST.zw) * _EmissionColor2, 0, 1-layerType);
                    
        float3 emission = skinEmiss + furEmiss;

        float4 rim = getRimSS(vdn, lightCol, attenuation, ndl, indirectDiffuse.xyzz);

        return diffuse + lerp(0, specular, layerType) + emission + rim;
}