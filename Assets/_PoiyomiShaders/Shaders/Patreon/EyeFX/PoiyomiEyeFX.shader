Shader ".poiyomi/Patreon/EyeFx"
{
    Properties 
  { 
      [HideInInspector] shader_is_using_thry_editor("", Float)=0
        _MainTex ("Background", 2D) = "white" { }

        _GradientFront ("Gradient Front", 2D) = "black" { }
        _GradientBack ("Gradient Back", 2D) = "black" { }
        _LineworkMask ("Linework Mask", 2D) = "black" { }
        _HighlightMask ("Highlight Mask", 2D) = "black" { }
        _FrontTexture ("Front Texture", 2D) = "white" { }
        _BackTexture ("Back Texture", 2D) = "white" { }

        _NoiseFront ("Noise Front Gradient", 2D) = "black" { }
        _NoiseBack ("Noise Back Gradient", 2D) = "black" { }

        _FrontTexturePan ("Front Texture Pan", Vector) = (0, 0, 0, 0)
        _BackTexturePan ("Back Texture Pan", Vector) = (0, 0, 0, 0)
        _NoiseFrontPanSpeed ("Noise Front Pan Speed", Vector) = (0, 0, 0, 0)
        _NoiseBackPanSpeed ("Noise Back Pan Speed", Vector) = (0, 0, 0, 0)

        [Space(20)]
        _FrontGradientMod ("Front Grad Mod", Range(-1,1)) = 0
        _BackGradientMod ("Back Grad Mod", Range(-1,1)) = 0
        [Space(20)]
        _GradientFrontColor ("Front Color", Color) = (1, 1, 1, 1)
        _FrontEmission ("Front Emission", Float) = 0
        _GradientBackColor ("Back Color", Color) = (1, 1, 1, 1)
        _BackEmission ("Back Emission", Float) = 0
        _Color ("BackgroundColor", Color) = (1, 1, 1, 1)
        _BackgroundEmission ("Background Emission", Float) = 0
        _LineworkColor ("Linework Color", Color) = (1, 1, 1, 1)
        _LineworkEmission ("Linework Emission", Float) = 0
        _HighlightColor ("Highlight Color", Color) = (1, 1, 1, 1)
        _HighlightEmission ("Highlight Emission", Float) = 0
        [Space(20)]
        
        _BlendFront ("Front Soft-Hard", Range(0, 1)) = 1
        _BlendBack ("Back Soft-Hard", Range(0, 1)) = 1

        [Enum(Unlit, 0, Lit, 1)] _Lit ("Lighting", Int) = 0
    }
    
    SubShader 
  {
        LOD 100
        CGINCLUDE
        #pragma target 5.0
        ENDCG
        
        Cull Back
        ColorMask RGBA
        ZWrite On
        ZTest LEqual
        Offset 0, 0

        Pass
        {
            Tags { "LightMode" = "ForwardBase" }
            CGPROGRAM
            
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityPBSLighting.cginc"
            #include "UnityCG.cginc"
            

            struct appdata
            {
                float4 vertex: POSITION;
                float2 texcoord: TEXCOORD0;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };
            
            struct v2f
            {
                float4 pos: SV_POSITION;
                float2 uv: TEXCOORD0;
                
                UNITY_VERTEX_OUTPUT_STEREO
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            sampler2D _MainTex; float4 _MainTex_ST;
            sampler2D _GradientFront; float4 _GradientFront_ST;
            sampler2D _GradientBack; float4 _GradientBack_ST;
            sampler2D _LineworkMask; float4 _LineworkMask_ST;
            sampler2D _HighlightMask; float4 _HighlightMask_ST;
            sampler2D _NoiseFront; float4 _NoiseFront_ST;
            sampler2D _NoiseBack; float4 _NoiseBack_ST;
            sampler2D _FrontTexture; float4 _FrontTexture_ST;
            sampler2D _BackTexture; float4 _BackTexture_ST;
            float4 _FrontTexturePan;
            float4 _BackTexturePan;
            int _Lit;
            // Colors
            float4 _Color;
            float4 _GradientFrontColor, _GradientBackColor, _LineworkColor, _HighlightColor;
            float _BackgroundEmission, _FrontEmission, _BackEmission, _LineworkEmission, _HighlightEmission;
            float _FrontGradientMod;
            float _BackGradientMod;
            // Blending
            float _BlendBack, _BlendFront;
            // Motion
            float4 _NoiseFrontPanSpeed, _NoiseBackPanSpeed;

            v2f vert(appdata v)
            {
                v2f o;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
                UNITY_TRANSFER_INSTANCE_ID(v, o);

                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = float4(v.texcoord.xy, 0, 0);
                return o;
            }
            
            fixed4 frag(v2f i): SV_Target
            {
                UNITY_SETUP_INSTANCE_ID(i);
                _FrontGradientMod = 1 - _FrontGradientMod;
                _BackGradientMod = 1 - _BackGradientMod;
                float4 background = tex2D(_MainTex, TRANSFORM_TEX(i.uv, _MainTex));
                float gradientFront = tex2D(_GradientFront, TRANSFORM_TEX(i.uv, _GradientFront));
                float gradientBack = tex2D(_GradientBack, TRANSFORM_TEX(i.uv, _GradientBack));
                float lineworkMask = tex2D(_LineworkMask, TRANSFORM_TEX(i.uv, _LineworkMask));
                float highlightMask = tex2D(_HighlightMask, TRANSFORM_TEX(i.uv, _HighlightMask));
                float4 frontTexture = tex2D(_FrontTexture, TRANSFORM_TEX(i.uv, _FrontTexture) + _FrontTexturePan * _Time.y);
                float4 backTexture = tex2D(_BackTexture, TRANSFORM_TEX(i.uv, _BackTexture) + _BackTexturePan * _Time.y);
                float noiseFront = tex2D(_NoiseFront, TRANSFORM_TEX(i.uv, _NoiseFront) + _Time.y * _NoiseFrontPanSpeed);
                float noiseBack = tex2D(_NoiseBack, TRANSFORM_TEX(i.uv, _NoiseBack) + _Time.y * _NoiseBackPanSpeed);
                
                float frontAlpha = gradientFront - (gradientFront * lerp(lerp(_FrontGradientMod - noiseFront, 0, gradientFront), (1 - step(_FrontGradientMod - gradientFront, noiseFront)), _BlendFront));
                float backAlpha = gradientBack - (gradientBack * lerp(lerp(_BackGradientMod - noiseBack, 0, gradientBack), (1 - step(_BackGradientMod - gradientBack, noiseBack)), _BlendBack));


                // Ambient Lighting
                float3 poiLighting = clamp(ShadeSH9(float4(0, 0, 0, 1)) + _LightColor0.rgb, 0, _LightColor0.a);
                
                fixed4 finalColor = float4(background.rgb * _Color, 1);
                finalColor = lerp(finalColor, _GradientBackColor * backTexture, backAlpha);
                finalColor = lerp(finalColor, _GradientFrontColor * frontTexture, frontAlpha);
                finalColor = lerp(finalColor, _LineworkColor, lineworkMask);
                finalColor = lerp(finalColor, _HighlightColor, highlightMask);
                
                finalColor.rgb *= lerp(1, poiLighting, _Lit);
                
                fixed4 emissionColor = float4(background.rgb * _Color * _BackgroundEmission, 1);
                emissionColor = lerp(emissionColor, _GradientBackColor * backTexture * _BackEmission, backAlpha);
                emissionColor = lerp(emissionColor, _GradientFrontColor * frontTexture * _FrontEmission, frontAlpha);
                emissionColor = lerp(emissionColor, _LineworkColor * _LineworkEmission, lineworkMask);
                emissionColor = lerp(emissionColor, _HighlightColor * _HighlightEmission, highlightMask);

                return finalColor + emissionColor;
            }
            ENDCG
            
        }
    }
}