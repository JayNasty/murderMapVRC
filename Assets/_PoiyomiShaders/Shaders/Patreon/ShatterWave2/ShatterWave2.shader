Shader ".poiyomi/Patreon/ShatterWave2"
{
    Properties 
  { 
      [HideInInspector] shader_is_using_thry_editor("", Float)=0

		[HideInInspector] shader_master_label("<color=#008080>❤ Poiyomi Shatter Wave V2.0 ❤</color>", Float) = 0
		[HideInInspector] shader_presets("poiToonPresets", Float) = 0
        

        [HideInInspector] footer_youtube ("youtube footer button", Float) = 0
        [HideInInspector] footer_twitter ("twitter footer button", Float) = 0
        [HideInInspector] footer_patreon ("patreon footer button", Float) = 0
        [HideInInspector] footer_discord ("discord footer button", Float) = 0
        [HideInInspector] footer_github ("github footer button", Float) = 0

        [HideInInspector] m_mainOptions ("Main", Float) = 0
        _Color ("Color", Color) = (1, 1, 1, 1)
        _Desaturation ("Desaturation", Range(-1, 1)) = 0
        _MainTex ("Texture", 2D) = "white" { }
        [Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _MainTextureUV ("Tex UV#", Int) = 0
        [Normal]_BumpMap ("Normal Map", 2D) = "bump" { }
        _BumpScale ("Normal Intensity", Range(0, 10)) = 1
        _Clip ("Alpha Cuttoff", Range(0, 1.001)) = 0.5
        [HideInInspector] m_start_mainAdvanced ("Advanced", Float) = 0
        [Normal]_DetailNormalMap ("Detail Map", 2D) = "bump" { }
        _DetailNormalMapScale ("Detail Intensity", Range(0, 10)) = 1
        [HideInInspector] m_end_mainAdvanced ("Advanced", Float) = 0

        [HideInInspector] m_shatterWave ("Shatter Wave", Float) = 0
        [Toggle(_)]_ShowUnderWave ("Show Under Wave?", Range(0, 1)) = 1
        _WaveColor ("Wave Color", Color) = (1,1,1,1)
        _WaveTexture ("Wave Texture", 2D) = "white" {}
        _WaveEmission ("Wave Emission", Range(0, 10)) = 2
        _underWaveColor ("Under Wave Color", Color) = (1,1,1,1)
        _UnderWaveTexture ("Under Wave Texture", 2D) = "white" {}
        _UnderWaveEmission ("Under Wave Emission", Range(0, 10)) = 2
        _WaveSpeed ("Wave Speed X Y Z", Vector) = (.5,.6,.7,0)
        _WaveSlope ("Wave Slope X Y Z", Vector) = (2,2,2,0)
        _WaveDensity ("Wave Density X Y Z", Vector) = (10,8,9,0)
        _HeightThreshold ("WaveWidth", Range(0, 1)) = .98
        _WaveHeight ("Wave Height", Range(0,50)) = .01

        [HideInInspector] m_metallicOptions ("Metallic", Float) = 0
        _CubeMap ("Baked CubeMap", Cube) = "" { }
        [Toggle(_)]_SampleWorld ("Force Baked Cubemap", Range(0, 1)) = 0
        _AdditiveClearCoat ("Additive Clear Coat", Range(0, 1)) = 0
        _PurelyAdditive ("Purely Additive", Range(0, 1)) = 0
        _MetallicMap ("Metallic Map", 2D) = "white" { }
        _Metallic ("Metallic", Range(0, 1)) = 0
        _RoughnessMap ("Roughness Map", 2D) = "white" { }
        _Roughness ("Smoothness", Range(0, 1)) = 0
        
        [HideInInspector] m_matcapOptions ("Matcap / Sphere Textures", Float) = 0
        _Matcap ("Matcap", 2D) = "white" { }
        _MatcapMap ("Matcap Map", 2D) = "white" { }
        _MatcapColor ("Matcap Color", Color) = (1, 1, 1, 1)
        _MatcapStrength ("Matcap Strength", Range(0, 20)) = 1
        _ReplaceWithMatcap ("Replace With Matcap", Range(0, 1)) = 0
        _MultiplyMatcap ("Multiply Matcap", Range(0, 1)) = 0
        _AddMatcap ("Add Matcap", Range(0, 1)) = 0
        
        [HideInInspector] m_emissionOptions ("Emission", Float) = 0
        [HDR]_EmissionColor ("Emission Color", Color) = (1, 1, 1, 1)
        _EmissionMap ("Emission Map", 2D) = "white" { }
        _EmissionMask ("Emission Mask", 2D) = "white" { }
        _EmissionScrollSpeed ("Emission Scroll Speed", Vector) = (0, 0, 0, 0)
        _EmissionStrength ("Emission Strength", Range(0, 20)) = 0
        
        [HideInInspector] m_start_blinkingEmissionOptions ("Blinking Emission", Float) = 0
        _EmissiveBlink_Min ("Emissive Blink Min", Float) = 1
        _EmissiveBlink_Max ("Emissive Blink Max", Float) = 1
        _EmissiveBlink_Velocity ("Emissive Blink Velocity", Float) = 4
        [HideInInspector] m_end_blinkingEmissionOptions ("Blinking Emission", Float) = 0
        
        [HideInInspector] m_start_scrollingEmissionOptions ("Scrolling Emission", Float) = 0
        [Toggle(_)] _ScrollingEmission ("Enable Scrolling Emission", Float) = 0
        _EmissiveScroll_Direction ("Emissive Scroll Direction", Vector) = (0, -10, 0, 0)
        _EmissiveScroll_Width ("Emissive Scroll Width", Float) = 10
        _EmissiveScroll_Velocity ("Emissive Scroll Velocity", Float) = 10
        _EmissiveScroll_Interval ("Emissive Scroll Interval", Float) = 20
        [HideInInspector] m_end_scrollingEmissionOptions ("Scrolling Emission", Float) = 0
        
        [HideInInspector] m_fakeLightingOptions ("Lighting", Float) = 0
        [NoScaleOffset]_Ramp ("Lighting Ramp", 2D) = "white" { }
        _ShadowStrength ("Shadow Strength", Range(0, 1)) = 1
        _ShadowOffset ("Shadow Offset", Range(-1, 1)) = 0
        [Toggle(_)] _ForceLightDirection ("Force Light Direction", Range(0, 1)) = 0
        [Toggle(_)] _ForceShadowStrength ("Force Shadow Strength", Range(0, 1)) = 0
        _LightDirection ("Fake Light Direction", Vector) = (0, 1, 0, 0)
        _MinBrightness ("Min Brightness", Range(0, 1)) = 0
        _MaxDirectionalIntensity ("Max Directional Intensity", Float) = 1
        [NoScaleOffset]_AdditiveRamp ("Additive Ramp", 2D) = "white" { }
        _FlatOrFullAmbientLighting ("Flat or Full Ambient Lighting", Range(0, 1)) = 0
        
        [HideInInspector] m_specularHighlightsOptions ("Specular Highlights", Float) = 0
        _SpecularMap ("Specular Map", 2D) = "white" { }
        _Gloss ("Glossiness", Range(0, 1)) = 0
        _SpecularColor ("Specular Color", Color) = (1, 1, 1, 1)
        _SpecularBias ("Specular Color Bias", Range(0, 1)) = 0
        _SpecularStrength ("Specular Strength", Range(0, 5)) = 0
        [Toggle(_)]_HardSpecular ("Enable Hard Specular", Float) = 0
        _SpecularSize ("Hard Specular Size", Range(0, 1)) = .005
        
        [HideInInspector] m_rimLightOptions ("Rim Lighting", Float) = 0
        _RimLightColor ("Rim Color", Color) = (1, 1, 1, 1)
        _RimWidth ("Rim Width", Range(0, 1)) = 0.8
        _RimStrength ("Rim Emission", Range(0, 20)) = 0
        _RimSharpness ("Rim Sharpness", Range(0, 1)) = .25
        _RimLightColorBias ("Rim Color Bias", Range(0, 1)) = 0
        _RimTex ("Rim Texture", 2D) = "white" { }
        _RimTexPanSpeed ("Rim Texture Pan Speed", Vector) = (0, 0, 0, 0)
        
        [HideInInspector] m_StencilPassOptions ("Stencil", Float) = 0
        [IntRange] _StencilRef ("Stencil Reference Value", Range(0, 255)) = 0
        [IntRange] _StencilReadMaskRef ("Stencil ReadMask Value", Range(0, 255)) = 0
        [IntRange] _StencilWriteMaskRef ("Stencil WriteMask Value", Range(0, 255)) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _StencilPassOp ("Stencil Pass Op", Float) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _StencilFailOp ("Stencil Fail Op", Float) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _StencilZFailOp ("Stencil ZFail Op", Float) = 0
        [Enum(UnityEngine.Rendering.CompareFunction)] _StencilCompareFunction ("Stencil Compare Function", Float) = 8
        
        [HideInInspector] m_start_OutlineStencil ("Outline Stencil", Float) = 0
        [IntRange] _OutlineStencilRef ("Stencil Reference Value", Range(0, 255)) = 0
        [IntRange] _OutlineStencilReadMaskRef ("Stencil ReadMask Value", Range(0, 255)) = 0
        [IntRange] _OutlineStencilWriteMaskRef ("Stencil WriteMask Value", Range(0, 255)) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _OutlineStencilPassOp ("Stencil Pass Op", Float) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _OutlineStencilFailOp ("Stencil Fail Op", Float) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _OutlineStencilZFailOp ("Stencil ZFail Op", Float) = 0
        [Enum(UnityEngine.Rendering.CompareFunction)] _OutlineStencilCompareFunction ("Stencil Compare Function", Float) = 8
        [HideInInspector] m_end_OutlineStencil ("Outline Stencil", Float) = 0
        
        [HideInInspector] m_miscOptions ("Misc", Float) = 0
        [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 2
        [Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("ZTest", Float) = 4
        [Enum(UnityEngine.Rendering.BlendMode)] _SourceBlend ("Source Blend", Float) = 5
        [Enum(UnityEngine.Rendering.BlendMode)] _DestinationBlend ("Destination Blend", Float) = 10
    }
    
    //originalEditorCustomEditor "PoiShatter"
CustomEditor "ThryEditor"
    SubShader
    {
        Tags { "RenderType" = "TransparentCutout" "Queue" = "AlphaTest" }
        
        
        Pass
        {
            Name "MainPass"
            Tags { "LightMode" = "ForwardBase" }
            Stencil
            {
                Ref [_StencilRef]
                ReadMask [_StencilReadMaskRef]
                WriteMask [_StencilWriteMaskRef]
                Ref [_StencilRef]
                Comp [_StencilCompareFunction]
                Pass [_StencilPassOp]
                Fail [_StencilFailOp]
                ZFail [_StencilZFailOp]
            }
            Cull [_Cull]
            ZTest [_ZTest]
            CGPROGRAM
            
            #pragma target 5.0
            #pragma vertex vert
            #pragma fragment frag
            #pragma geometry geom
            #define FORWARD_BASE_PASS
            #include "ShatterPass.cginc"
            ENDCG
            
        }
        
        Pass
        {
            Tags { "LightMode" = "ForwardAdd" }
            Stencil
            {
                Ref [_StencilRef]
                ReadMask [_StencilReadMaskRef]
                WriteMask [_StencilWriteMaskRef]
                Ref [_StencilRef]
                Comp [_StencilCompareFunction]
                Pass [_StencilPassOp]
                Fail [_StencilFailOp]
                ZFail [_StencilZFailOp]
            }
            ZWrite Off Blend One One
            Cull [_Cull]
            ZTest [_ZTest]
            CGPROGRAM
            
            #pragma target 5.0
            #pragma multi_compile DIRECTIONAL POINT SPOT
            #pragma vertex vert
            #pragma fragment frag
            #include "ShatterPass.cginc"
            ENDCG
            
        }
        Pass
        {
            Tags { "LightMode" = "ShadowCaster" }
            Stencil
            {
                Ref [_StencilRef]
                ReadMask [_StencilReadMaskRef]
                WriteMask [_StencilWriteMaskRef]
                Ref [_StencilRef]
                Comp [_StencilCompareFunction]
                Pass [_StencilPassOp]
                Fail [_StencilFailOp]
                ZFail [_StencilZFailOp]
            }
            CGPROGRAM
            
            #pragma target 5.0
            #pragma multi_compile_shadowcaster
            #pragma vertex MyShadowVertexProgram
            #pragma fragment MyShadowFragmentProgram
            #include "UnityCG.cginc"

            struct VertexData {
                float4 position : POSITION;
                float3 normal : NORMAL;
            };

            #if defined(SHADOWS_CUBE)
                struct Interpolators {
                    float4 position : SV_POSITION;
                    float3 lightVec : TEXCOORD0;
                };

                Interpolators MyShadowVertexProgram (VertexData v) {
                    Interpolators i;
                    i.position = UnityObjectToClipPos(v.position);
                    i.lightVec =
                        mul(unity_ObjectToWorld, v.position).xyz - _LightPositionRange.xyz;
                    return i;
                }

                float4 MyShadowFragmentProgram (Interpolators i) : SV_TARGET {
                    float depth = length(i.lightVec) + unity_LightShadowBias.x;
                    depth *= _LightPositionRange.w;
                    return UnityEncodeCubeShadowDepth(depth);
                }
            #else
                float4 MyShadowVertexProgram (VertexData v) : SV_POSITION {
                    float4 position =
                        UnityClipSpaceShadowCasterPos(v.position.xyz, v.normal);
                    return UnityApplyLinearShadowBias(position);
                }

                half4 MyShadowFragmentProgram () : SV_TARGET {
                    return 0;
                }
            #endif
            ENDCG
            
        }
    }
}