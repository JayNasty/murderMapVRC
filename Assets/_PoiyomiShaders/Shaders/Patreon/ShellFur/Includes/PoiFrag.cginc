#ifndef POIFRAG
    #define POIFRAG
    
    float4 frag(v2f i, float facing: VFACE): SV_Target
    {
        #ifdef BASICS
            calculateBasics(i);
        #endif
        
        #ifdef FUR
            calculateFur(i.furAlpha, i.uv);
        #endif

        #ifdef LIGHTING
            calculateLighting(i);
        #endif
        
        #ifdef DND_LIGHTING
            calculateDNDLighting(i);
        #endif
        
        #ifdef FORWARD_BASE_PASS
            #ifdef REFRACTION
                calculateRefraction(i);
            #endif
        #endif
        
        #ifdef METAL
            calculateReflections(i.uv, i.normal, viewDirection);
        #endif
        
        #ifdef TEXTURE_BLENDING
            calculateTextureBlending(blendAlpha, mainTexture, albedo, i.uv);
        #endif
        
        clip(mainTexture.a * alphaMask - _Clip);
        
        #ifdef MATCAP
            calculateMatcap(viewDirection, i.normal, i.uv);
        #endif
        
        #ifdef FLIPBOOK
            calculateFlipbook(i.uv);
        #endif
        
        #ifdef LIGHTING
            #ifdef SUBSURFACE
                calculateSubsurfaceScattering(i, viewDirection);
            #endif
        #endif
        
        #ifdef RIM_LIGHTING
            calculateRimLighting(i.uv, viewDotNormal);
        #endif
        
        #ifdef PANOSPHERE
            calculatePanosphere(i.worldPos, i.uv);
        #endif
        
        #ifdef SCROLLING_LAYERS
            calculateScrollingLayers(i.uv);
        #endif
        
        #ifdef EMISSION
            calculateEmission(i.uv, i.localPos);
        #endif
        
        float4 finalColor = albedo;
        
        #ifdef RIM_LIGHTING
            applyRimColor(finalColor);
        #endif
        
        #ifdef MATCAP
            applyMatcap(finalColor);
        #endif
        
        #ifdef PANOSPHERE
            applyPanosphereColor(finalColor);
        #endif
        
        #ifdef FLIPBOOK
            applyFlipbook(finalColor);
        #endif
        
        #ifdef FORWARD_BASE_PASS
            #ifdef REFRACTION
                applyRefraction(finalColor);
            #endif
        #endif

        float aoAlpha = smoothstep(_FurMinDistance,_FurMaxDistance, distance(i.worldPos, getCameraPosition()));
        half aotest = lerp(1,lerp(smoothstep(_AoRampMin - (1-furMask), _AoRampMax, i.furAlpha), 1, aoAlpha),_FurAO);
        aotest = lerp(1,aotest,furMask);
        finalColor.rgb = lerp(finalColor.rgb, finalColor.rgb * aotest, ceil(i.furAlpha));

        float4 finalColorBeforeLighting = finalColor;
        
        #ifdef LIGHTING
            applyLighting(finalColor);
        #endif
        
        #ifdef DND_LIGHTING
            applyDNDLighting(finalColor);
        #endif
        
        #ifdef METAL
            applyReflections(finalColor, finalColorBeforeLighting);
        #endif
        
        #ifdef SPECULAR
            calculateSpecular(i.normal, albedo, viewDirection, i.uv);
        #endif
        
        #ifdef FORWARD_BASE_PASS
            #ifdef LIGHTING
                #ifdef SPECULAR
                    //applyLightingToSpecular();
                    applySpecular(finalColor);
                #endif
            #endif
            
            #ifdef PANOSPHERE
                applyPanosphereEmission(finalColor);
            #endif
            
            #ifdef EMISSION
                applyEmission(finalColor);
            #endif
            
            #ifdef RIM_LIGHTING
                ApplyRimEmission(finalColor);
            #endif
        #endif
        
        #ifdef LIGHTING
            #if (defined(POINT) || defined(SPOT))
                #ifdef METAL
                    applyAdditiveReflectiveLighting(finalColor);
                #endif
                #ifdef TRANSPARENT
                    finalColor.rgb *= finalColor.a;
                #endif
                
                #ifdef SPECULAR
                    applySpecular(finalColor);
                #endif
            #endif
        #endif
        
        #ifdef LIGHTING
            #ifdef SUBSURFACE
                applySubsurfaceScattering(finalColor);
            #endif
        #endif
        
        #ifdef FLIPBOOK
            applyFlipbookEmission(finalColor);
        #endif
        
        #ifdef FORWARD_BASE_PASS
            UNITY_APPLY_FOG(i.fogCoord, finalColor);
        #endif
        
        if(furHeightMap > 0.99 && _FurDebug == 1)
        {
            return float4(2,0,0,1);
        }

        return finalColor;
    }
#endif