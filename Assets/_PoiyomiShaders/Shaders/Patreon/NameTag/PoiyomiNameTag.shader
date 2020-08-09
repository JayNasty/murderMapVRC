Shader ".poiyomi/Patreon/NameTag"
{
    Properties 
  { 
      [HideInInspector] shader_is_using_thry_editor("", Float)=0
        _NameTexture ("Name Texture", 2D) = "black" { }
        _NamePan ("Name Pan", Vector) = (.1, 0, 0, 0)
        _NoiseTexture ("Noise Texture", 2D) = "white" { }
        _NoisePan ("Noise Pan", Vector) = (0, .3, 0, 0)

        _ForegroundColor ("Foreground Color", Color) = (1, 1, 1, 1)
        _BackgroundColor ("Background Color", Color) = (1, .1, .1, 1)
        _NameColor ("Name Color", Color) = (0, 0, 0, 0)

        _ForegroundGradientMin ("Foreground Gradient Min", Range(0, 1)) = .2
        _ForegroundGradientMax ("Foreground Gradient Max", Range(0, 1)) = .25
        _BackgroundGradientMin ("Background Gradient Min", Range(0, 1)) = .25
        _BackgroundGradientMax ("Background Gradient Max", Range(0, 1)) = .4

        _EmissionStrength ("Emission Strength", Float) = 1
    }
    
    CustomEditor "ThryEditor" 
    SubShader 
  {
        Blend SrcAlpha OneMinusSrcAlpha
        Tags { "RenderType" = "Transparent" "Queue" = "Transparent" }
        LOD 100
        CGINCLUDE
        #pragma target 5.0
        ENDCG
        
        ColorMask RGBA
        Offset 0, 0
        
        Pass
        {
            Cull Front
            Name "Back"
            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            
            sampler2D _NameTexture; float4 _NameTexture_ST;
            sampler2D _NoiseTexture; float4 _NoiseTexture_ST;
            float4 	_ForegroundColor, _BackgroundColor, _NameColor, _NoisePan, _NamePan;
            float _ForegroundGradientMin, _ForegroundGradientMax, _BackgroundGradientMin, _BackgroundGradientMax, _EmissionStrength;

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

            v2f vert(appdata v)
            {
                v2f o;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
                UNITY_TRANSFER_INSTANCE_ID(v, o);
                o.uv = float4(v.texcoord.xy, 0, 0);
                o.pos = UnityObjectToClipPos(v.vertex);
                return o;
            }
            
            fixed4 frag(v2f i): SV_Target
            {
                UNITY_SETUP_INSTANCE_ID(i);

                float distanceFromCenter = distance(0.5, i.uv.y);
                float nameTexture = tex2D(_NameTexture, TRANSFORM_TEX(i.uv, _NameTexture) + (_Time.y * _NamePan.xy));
                float noiseTexture = 1 - tex2D(_NoiseTexture, TRANSFORM_TEX(i.uv, _NoiseTexture) + (_Time.y * _NoisePan.xy));
                
                float foregroundGradient = (1 - smoothstep(_ForegroundGradientMin, _ForegroundGradientMax, distanceFromCenter));
                float backgroundGradient = (1 - smoothstep(_BackgroundGradientMin, _BackgroundGradientMax, distanceFromCenter));

                float foregroundColorMask = saturate(foregroundGradient - noiseTexture * (1 - foregroundGradient));
                float backgroundColorMask = saturate(backgroundGradient - noiseTexture * (1 - backgroundGradient));

                float4 foregroundColor = float4(_ForegroundColor.rgb, foregroundColorMask);
                float4 backgroundColor = float4(_BackgroundColor.rgb, backgroundColorMask);
                
                fixed4 finalColor = float4(_BackgroundColor.rgb, 0);
                
                finalColor = lerp(finalColor, _BackgroundColor, backgroundColorMask);
                finalColor = lerp(finalColor, _ForegroundColor, foregroundColorMask);
                finalColor = lerp(finalColor, _NameColor, nameTexture);
                finalColor.rgb *= _EmissionStrength;
                return finalColor;
            }
            ENDCG
            
        }

        Pass
        {
            Cull Back
            
            Name "Front"
            CGPROGRAM
            
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            
            sampler2D _NameTexture; float4 _NameTexture_ST;
            sampler2D _NoiseTexture; float4 _NoiseTexture_ST;
            float4 	_ForegroundColor, _BackgroundColor, _NameColor, _NoisePan, _NamePan;
            float _ForegroundGradientMin, _ForegroundGradientMax, _BackgroundGradientMin, _BackgroundGradientMax, _EmissionStrength;

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

            v2f vert(appdata v)
            {
                v2f o;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
                UNITY_TRANSFER_INSTANCE_ID(v, o);
                o.uv = float4(v.texcoord.xy, 0, 0);
                o.pos = UnityObjectToClipPos(v.vertex);
                return o;
            }
            
            fixed4 frag(v2f i): SV_Target
            {
                UNITY_SETUP_INSTANCE_ID(i);

                float distanceFromCenter = distance(0.5, i.uv.y);
                float nameTexture = tex2D(_NameTexture, TRANSFORM_TEX(i.uv, _NameTexture) + (_Time.y * _NamePan.xy));
                float noiseTexture = 1 - tex2D(_NoiseTexture, TRANSFORM_TEX(i.uv, _NoiseTexture) + (_Time.y * _NoisePan.xy));
                
                float foregroundGradient = (1 - smoothstep(_ForegroundGradientMin, _ForegroundGradientMax, distanceFromCenter));
                float backgroundGradient = (1 - smoothstep(_BackgroundGradientMin, _BackgroundGradientMax, distanceFromCenter));

                float foregroundColorMask = saturate(foregroundGradient - noiseTexture * (1 - foregroundGradient));
                float backgroundColorMask = saturate(backgroundGradient - noiseTexture * (1 - backgroundGradient));

                float4 foregroundColor = float4(_ForegroundColor.rgb, foregroundColorMask);
                float4 backgroundColor = float4(_BackgroundColor.rgb, backgroundColorMask);
                
                fixed4 finalColor = float4(_BackgroundColor.rgb, 0);
                
                finalColor = lerp(finalColor, _BackgroundColor, backgroundColorMask);
                finalColor = lerp(finalColor, _ForegroundColor, foregroundColorMask);
                finalColor = lerp(finalColor, _NameColor, nameTexture);
                finalColor.rgb *= _EmissionStrength;
                return finalColor;
            }
            ENDCG
            
        }
    }
}