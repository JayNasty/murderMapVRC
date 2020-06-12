Shader "KriptoFX/ME/UI3D/LightningParticles" {
	Properties {
		[HDR]_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
		_MainTex ("Main Texture", 2D) = "white" {}
		_DistortTex1("Distort Texture1", 2D) = "white" {}
		_DistortTex2("Distort Texture2", 2D) = "white" {}
		_DistortSpeed("Distort Speed Scale (xy/zw)", Vector) = (1,0.1,1,0.1) 
		_Offset("Offset", Float) = 0
		_UseVelocity("UseVelocity", Range(0, 1)) = 0
		/*USE THIS PART TO MAKE CUSTOM UNLIT SHADER WITH UI CULLING*/
		[Space]
		[Toggle(DISABLE_UI_CULLING)] _DisableCulling("Disable culling? (disables UI depth test)", Float) = 0
		[Toggle(CAST_UI_CULLING_TO_SCREEN_SPACE)] _CastUICullingToScreen("Cast UI culling to screen space", Float) = 0
						
		[HideInInspector][Toggle(USE_CLIPPING_MASK)] _UseClippingMask("UseClippingMask?", Float) = 0
		[HideInInspector]_ClippingMaskVal("_ClippingMaskVal", Range(0,1)) = 1
		[HideInInspector][KeywordEnum(Inside, Outside)] ClippingMode ("Clipping mode", Float) = 0
		/*END*/
	}

Category {
	Tags { "Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent" }
	Blend SrcAlpha One
	Cull Off Lighting Off ZWrite Off

	SubShader {
		Pass {
		
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
			sampler2D _DistortTex1;
			sampler2D _DistortTex2;
			half4 _TintColor;
			half _Cutoff;
			float4 _DistortSpeed;
			half _Offset;
			fixed _UseVelocity;
			
			struct appdata_t {
				float4 vertex : POSITION;
				half4 color : COLOR;
				float2 texcoord : TEXCOORD0;
				float3 velocity : TEXCOORD1;
			};

			struct v2f {
				float4 vertex : SV_POSITION;
				half4 color : COLOR;
				float2 uvMain : TEXCOORD0;
				float4 uvDistort : TEXCOORD1;
				half timeLerp : TEXCOORD2;
				float2 depthTexUV : TEXCOORD3;
				float worldZPos : TEXCOORD4;
			};
			
			float4 _MainTex_ST;
			float4 _DistortTex1_ST;
			float4 _DistortTex2_ST;

			v2f vert (appdata_t v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);

				o.color = v.color;
				o.timeLerp = lerp(length(v.velocity), _Time.x, _UseVelocity);

				float3 worlPos = mul(unity_ObjectToWorld, v.vertex);
				o.uvMain.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
				o.uvDistort.xy = TRANSFORM_TEX(worlPos.xy, _DistortTex1);
				o.uvDistort.zw = TRANSFORM_TEX(worlPos.xy, _DistortTex2);

				o.worldZPos = worlPos.z;
				o.depthTexUV = calcUIDepthTexUv(worlPos, svPositionUIToScreenPos(o.vertex));
				return o;
			}
			
			half4 frag (v2f i) : SV_Target
			{
				makeUI3DClipping(i.depthTexUV, i.worldZPos);
				half4 distort1 = tex2D(_DistortTex1, i.uvDistort.xy + _DistortSpeed.x * i.timeLerp) * 2 - 1;
				half4 distort2 = tex2D(_DistortTex1, i.uvDistort.xy - _DistortSpeed.x * i.timeLerp * 1.4 + float2(0.4, 0.6)) * 2 - 1;
				half4 distort3 = tex2D(_DistortTex2, i.uvDistort.zw + _DistortSpeed.z * i.timeLerp) * 2 - 1;
				half4 distort4 = tex2D(_DistortTex2, i.uvDistort.zw - _DistortSpeed.z * i.timeLerp * 1.25 + float2(0.3, 0.7)) * 2 - 1;
				half offset = saturate(tex2D(_MainTex, i.uvMain).g + _Offset);
				
				half tex = tex2D(_MainTex, i.uvMain + (distort1.xy + distort2.xy) * _DistortSpeed.y * offset + (distort3.xy + distort4.xy) * _DistortSpeed.w * offset).r;
				half alpha = tex2D(_MainTex, i.uvMain * 7 + _Time.x * 5).b;
				
				clip(i.color.a - alpha);
				half4 col = 2.0f * _TintColor * tex *  i.color.a;
				
				return col;
			}
			ENDCG 
		}
	}	
}
	CustomEditor "UIUnlitShaderEditor"
}
