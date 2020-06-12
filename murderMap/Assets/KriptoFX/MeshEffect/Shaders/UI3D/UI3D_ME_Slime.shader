// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "KriptoFX/ME/UI3D/Slime" {
	Properties{
		_TintColor("Main Color", Color) = (1,1,1,1)
		_MainTex("Base (RGB) Emission Tex (A)", 2D) = "white" {}
		_CutOut("CutOut (A)", 2D) = "white" {}
		_BumpMap("Normalmap", 2D) = "bump" {}
		_BumpAmt("Distortion", Float) = 10
		/*USE THIS PART TO MAKE CUSTOM UNLIT SHADER WITH UI CULLING*/
		[Space]
		[Toggle(DISABLE_UI_CULLING)] _DisableCulling("Disable culling? (disables UI depth test)", Float) = 0
		[Toggle(CAST_UI_CULLING_TO_SCREEN_SPACE)] _CastUICullingToScreen("Cast UI culling to screen space", Float) = 0
						
		[HideInInspector][Toggle(USE_CLIPPING_MASK)] _UseClippingMask("UseClippingMask?", Float) = 0
		[HideInInspector]_ClippingMaskVal("_ClippingMaskVal", Range(0,1)) = 1
		[HideInInspector][KeywordEnum(Inside, Outside)] ClippingMode ("Clipping mode", Float) = 0
		/*END*/
	}
		Category{

			Tags { "Queue" = "Transparent" "IgnoreProjector" = "True" "RenderType" = "Transparent" }
						Blend SrcAlpha OneMinusSrcAlpha
						ZWrite Off
						Offset -1,-1
						Cull Off
						Fog { Mode Off}

			SubShader {
				GrabPass {
					"_GrabTexture"
				}
				Pass {
					CGPROGRAM
					#pragma vertex vert
					#pragma fragment frag
					#pragma target 3.0
					
					/*USE THIS PART TO MAKE CUSTOM UNLIT SHADER WITH UI CULLING*/
					#pragma shader_feature _ DISABLE_UI_CULLING
					#pragma shader_feature _ USE_CLIPPING_MASK
					#pragma shader_feature _ CAST_UI_CULLING_TO_SCREEN_SPACE
					#pragma shader_feature CLIPPINGMODE_INSIDE CLIPPINGMODE_OUTSIDE

					#define IS_UI_3D_RENDERER
					#include "UnityCG.cginc"
					#include "Assets/Plugins/UI3DSystem/Shaders/UIDepthLib.cginc"
					/*END*/

					sampler2D _MainTex;
					sampler2D _BumpMap;
					sampler2D _CutOut;
					samplerCUBE _Cube;

					float _BumpAmt;
					sampler2D _GrabTexture;
					float4 _GrabTexture_TexelSize;

					float4 _TintColor;
					float _FPOW;
					float _R0;

					struct appdata_t {
						float4 vertex : POSITION;
						float3 normal : NORMAL;
						fixed4 color : COLOR;
						float2 texcoord : TEXCOORD0;
					};

					struct v2f {
						half4 vertex : POSITION;
						half2 uv_MainTex: TEXCOORD0;
						half2 uv_BumpMap : TEXCOORD1;
						half2 uv_CutOut : TEXCOORD2;
						half4 grab : TEXCOORD3;
						fixed4 color : COLOR;
						float2 depthTexUV : TEXCOORD5;
						float worldZPos : TEXCOORD6;
					};

					float4 _MainTex_ST;
					float4 _BumpMap_ST;
					float4 _CutOut_ST;

					v2f vert(appdata_full v)
					{
						v2f o;

						o.uv_MainTex = TRANSFORM_TEX(v.texcoord, _MainTex);
						o.uv_BumpMap = TRANSFORM_TEX(v.texcoord, _BumpMap);
						o.uv_CutOut = TRANSFORM_TEX(v.texcoord, _CutOut);

						o.vertex = UnityObjectToClipPos(v.vertex);
						#if UNITY_UV_STARTS_AT_TOP
						half scale = -1.0;
						#else
						half scale = 1.0;
						#endif
						o.grab.xy = (half2(o.vertex.x, o.vertex.y*scale) + o.vertex.w) * 0.5;
						o.grab.zw = o.vertex.w;
		#if UNITY_SINGLE_PASS_STEREO
						o.grab.xy = TransformStereoScreenSpaceTex(o.grab.xy, o.grab.w);
		#endif

						o.color = v.color;
						
						float3 wPos = mul(unity_ObjectToWorld, v.vertex).xyz;
						o.worldZPos = wPos.z;
						o.depthTexUV = calcUIDepthTexUv(wPos, svPositionUIToScreenPos(o.vertex));
						return o;
					}

					fixed4 frag(v2f i) : COLOR
					{
						makeUI3DClipping(i.depthTexUV, i.worldZPos);

						half4 tex = tex2D(_MainTex, i.uv_MainTex);
						half4 c = tex * _TintColor;
						half4 cut = tex2D(_CutOut, i.uv_CutOut);

						half3 normal = UnpackNormal(tex2D(_BumpMap, i.uv_BumpMap));

						half2 offset = normal.rg * _BumpAmt * _GrabTexture_TexelSize.xy * i.color.a;
						i.grab.xy = offset * i.grab.z + i.grab.xy;
						half4 col = tex2Dproj(_GrabTexture, UNITY_PROJ_COORD(i.grab));

						fixed gray = col.r * 0.3 + col.g * 0.59 + col.b * 0.11;
						half3 emission = col.rgb*_TintColor.rgb;

						return fixed4(emission, cut.a * _TintColor.a * i.color.r * i.color.a);
					}
					ENDCG
				}
			}
			}
	CustomEditor "UIUnlitShaderEditor"
}