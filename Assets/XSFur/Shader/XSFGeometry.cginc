float rand(float2 co){
    return frac(sin(dot(co.xy ,float2(12.9898,78.233))) * 43758.5453);
}

[maxvertexcount(36)]
void geom(triangle VertexOutput v[3], uint pid : SV_PrimitiveID, inout TriangleStream<g2f> tristream)
{
    g2f o = (g2f)0;
    float3 edgeA = v[1].vertex - v[0].vertex;
    float3 edgeB = v[2].vertex - v[0].vertex;
    float3 faceNormal = normalize(cross(edgeB, edgeA));
    float3 averagedPos = normalize((v[0].vertex + v[1].vertex + v[2].vertex) / 3);
    float3 vCrossN = cross(averagedPos, faceNormal);

    float3 cameraPos = getStereoCamPos();

    float3 viewDir = (vCrossN - mul(unity_WorldToObject, float4(cameraPos, 1)));

    float3 dist = distance( mul(unity_ObjectToWorld, float4(0,0,0,1)).xyz, 
                                            cameraPos);
    half falloff = saturate((dist - 5) / (8 - 5)) * _layers;

    float2 averageUV = (v[0].uv + v[1].uv + v[2].uv) / 3;
    float4 lengthMask = tex2Dlod(_lengthMask, float4(averageUV, 0, 0));

    //These Values will get scaled with Distance for lodding.
        float layers = _layers;
            //#if defined(LIGHTMAP_OFF)
            // if(_UseLightmap == 0)
            // {
            //     layers = clamp((_layers - falloff), 2, _layers);
            // }
            //#endif
            //after scaling layers with distance, we also use the length mask to get rid of unneed layers
            layers = clamp(layers*lengthMask.r, 1, _layers);		
    //-------
        
    float offset = -_offset;
    float4 uv = float4(_CutoutMap_ST);
    float2 uvLayerOffset = float2(0,0); 
    float cutout = 0;
    float brightness = 0;
    float vertexColorR = v[0].color.r;

    float3 gravityDir = mul(unity_WorldToObject,float4(0,-.9,0,0)) * _gravity * _offset;

    for (int l = 0; l < layers; l++)
    {
        offset += _offset;
        float x = saturate(float(l)/ float(_layers * 2));
        cutout += _Cutout * (l/layers) * 4;

        brightness = (l/layers);
        brightness = lerp(1, brightness, _furOcclusionStrength);
        uvLayerOffset += float2(_x/16,_y/16);

        //For some reason, an if statement inside of a for loop is more performant.
        if (l == 0)
        {
            for (int i = 0; i < 3; i++)
            {
                o.pos = UnityObjectToClipPos(v[i].vertex);
                o.worldPos = v[i].worldPos;
                o.uv = v[i].uv;
                o.uv1 =  v[i].uv1;
                o.furUV = v[i].uv;
                o.normal = v[i].normal;
                o.multiOutput = float4(0, 1, lengthMask.r, 0);
                UNITY_TRANSFER_SHADOW(o, o.uv);
                
                tristream.Append(o);	
            }
            tristream.RestartStrip();
        }
        else
        {//Do fur layers
            for (int i = 0; i < 3; i++)
            {
                float4 layerPos = float4(v[i].vertex + normalize(v[i].normal) * offset + l * gravityDir, 1);
                o.pos = UnityObjectToClipPos(layerPos);
                o.worldPos = v[i].worldPos;
                o.uv = v[i].uv;
                o.uv1 = v[i].uv1;
                o.furUV = lerp(v[i].uv, v[i].uv1, _UVSet) * float2(_density.xx) + uvLayerOffset;
                o.normal = v[i].normal;
                o.multiOutput = float4(cutout, brightness, vertexColorR, 1);
                UNITY_TRANSFER_SHADOW(o, o.uv);

                tristream.Append(o);	
            }
            tristream.RestartStrip();
        }
    }
}