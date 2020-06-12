Shader "KriptoFX/ME/UI3D/GlowCutoutGradient" {
	Properties{
		[HDR]_TintColor("Tint Color", Color) = (0.5,0.5,0.5,1)
		_GradientStrength("Gradient Strength", Float) = 0.5
		_TimeScale("Time Scale", Vector) = (1,1,1,1)
		_MainTex("Noise Texture", 2D) = "white" {}
		_BorderScale("Border Scale (XY) Offset (Z)", Vector) = (0.5,0.05,1,1)
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

		Tags { "Queue" = "Transparent+10" "IgnoreProjector" = "True" "RenderType" = "Transparent" }
						
		SubShader{
			Pass {
				Blend DstColor Zero
				Cull Off
				Lighting Off
				ZWrite Off
				Offset -1, -1

				CGPROGRAM
				#pragma vertex vert
				#pragma fragment frag
				#pragma shader_feature _ DISABLE_UI_CULLING
				#pragma shader_feature _ USE_CLIPPING_MASK
				#pragma shader_feature _ CAST_UI_CULLING_TO_SCREEN_SPACE
				#pragma shader_feature CLIPPINGMODE_INSIDE CLIPPINGMODE_OUTSIDE

				#define IS_UI_3D_RENDERER
				#include "UnityCG.cginc"
				#include "Assets/Plugins/UI3DSystem/Shaders/UIDepthLib.cginc"

				float4 _TintColor;
				float _GradientStrength;

				struct appdata_t {
					float4 vertex : POSITION;
				};

				struct v2f {
					float4 vertex : POSITION;
					float2 depthTexUV : TEXCOORD2;
					float worldZPos : TEXCOORD3;
				};

				v2f vert(appdata_t v)
				{
					v2f o;
					o.vertex = UnityObjectToClipPos(v.vertex);
					float3 wPos = mul(unity_ObjectToWorld, v.vertex).xyz;
					o.worldZPos = wPos.z;
					o.depthTexUV = calcUIDepthTexUv(wPos, svPositionUIToScreenPos(o.vertex));
					return o;
				}
		

				half4 frag(v2f i) : COLOR
				{
					makeUI3DClipping(i.depthTexUV, i.worldZPos);
					return lerp(1, _GradientStrength, _TintColor.a);
				}
				ENDCG
			}

			Pass {
				Tags { "Queue" = "Transparent+10" "IgnoreProjector" = "True" "RenderType" = "Transparent" }
				Blend SrcAlpha One
				Cull Off
				Lighting Off
				ZWrite Off
				Offset -1, -1

				CGPROGRAM
				#pragma vertex vert
				#pragma fragment frag
					
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
				float4 _TintColor;
				float4 _TimeScale;
				float4 _BorderScale;

				struct appdata_t {
					float4 vertex : POSITION;
					fixed4 color : COLOR;
					float2 texcoord : TEXCOORD0;
					float3 normal : NORMAL;
				};

				struct v2f {
					float4 vertex : POSITION;
					fixed4 color : COLOR;
					float2 texcoord : TEXCOORD0;
					float4 worldPosScaled : TEXCOORD1;
					float3 normal : NORMAL;

					float2 depthTexUV : TEXCOORD2;
					float worldZPos : TEXCOORD3;
					
				};

				float4 _MainTex_ST;

				v2f vert(appdata_t v)
				{
					v2f o;
					//v.vertex.xyz += v.normal / 100 * _BorderScale.z;
					o.vertex = UnityObjectToClipPos(v.vertex);
					o.color = v.color;
					o.texcoord = TRANSFORM_TEX(v.texcoord,_MainTex);
					float3 worldPos = v.vertex * float3(length(unity_ObjectToWorld[0].xyz), length(unity_ObjectToWorld[1].xyz), length(unity_ObjectToWorld[2].xyz));
					o.worldPosScaled.x = worldPos.x *  _MainTex_ST.x;
					o.worldPosScaled.y = worldPos.y *  _MainTex_ST.y;
					o.worldPosScaled.z = worldPos.z *  _MainTex_ST.x;
					o.worldPosScaled.w = worldPos.z *  _MainTex_ST.y;
					o.normal = abs (v.normal);

					worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;//true world pos matters
					o.worldZPos = worldPos.z;
					o.depthTexUV = calcUIDepthTexUv(worldPos, svPositionUIToScreenPos(o.vertex));
					return o;
				}

				sampler2D _CameraDepthTexture;

				half tex2DTriplanar(sampler2D tex, float2 offset, float4 worldPos, float3 normal)
				{
					half3 texColor;
					texColor.x = tex2D(tex, worldPos.zy + offset);
					texColor.y = tex2D(tex, worldPos.xw + offset);
					texColor.z = tex2D(tex, worldPos.xy + offset);
					normal = normal / (normal.x + normal.y + normal.z);
					return dot(texColor, normal);
				}

				half4 frag(v2f i) : COLOR
				{ 
					makeUI3DClipping(i.depthTexUV, i.worldZPos);

					half mask = tex2DTriplanar(_MainTex, _Time.x * _TimeScale.xy, i.worldPosScaled, i.normal);
					half tex = tex2DTriplanar(_MainTex, _Time.x * _TimeScale.zw + mask * _BorderScale.x, i.worldPosScaled, i.normal);
					half alphaMask = tex2DTriplanar(_MainTex, 0.3 + mask * _BorderScale.y, i.worldPosScaled, i.normal);
					float4 res;
					res = tex * mask * i.color * _TintColor;
					res = lerp(0, res, alphaMask);
					res.rgb = pow(res.rgb, _BorderScale.w);
					res.a = saturate(res.a * 4);
					return  res;
				}
				ENDCG
			}
		}

		}
	CustomEditor "UIUnlitShaderEditor"
}