Shader "KriptoFX/ME/UI3D/Gold" {
	Properties {
		_MainColor("Color", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Cutoff("Cutoff", Range(0,.9)) = .5 
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0
		_SpeedDistort("Speed(XY) Distort(ZW)", Vector) = (1,0,0,0)
			
		/*USE THIS PART TO MAKE CUSTOM SURFACE SHADER WITH UI CULLING*/
		[Space]
		[Toggle(DISABLE_UI_CULLING)] _DisableCulling("Disable culling? (disables UI depth test)", Float) = 0
		[Toggle(CAST_UI_CULLING_TO_SCREEN_SPACE)] _CastUICullingToScreen("Cast UI culling to screen space", Float) = 0
						
		[HideInInspector][Toggle(USE_CLIPPING_MASK)] _UseClippingMask("UseClippingMask?", Float) = 0
		[HideInInspector]_ClippingMaskVal("_ClippingMaskVal", Range(0,1)) = 1
		[HideInInspector][KeywordEnum(Inside, Outside)] ClippingMode ("Clipping mode", Float) = 0
		/*END*/
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		//AlphaTest Greater [_Cutoff]
		Cull Off
		LOD 200
		
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard fullforwardshadows 

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0
			
		/*USE THIS PART TO MAKE CUSTOM SURFACE SHADER WITH UI CULLING*/
		#pragma shader_feature _ DISABLE_UI_CULLING
		#pragma shader_feature _ USE_CLIPPING_MASK
		#pragma shader_feature _ CAST_UI_CULLING_TO_SCREEN_SPACE
		#pragma shader_feature CLIPPINGMODE_INSIDE CLIPPINGMODE_OUTSIDE

		#define IS_UI_3D_RENDERER
		
		#include "UnityCG.cginc"
		#include "Assets/Plugins/UI3DSystem/Shaders/UIDepthLib.cginc"
		/*END*/

		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
			/*USE THIS PART TO MAKE CUSTOM SURFACE SHADER WITH UI CULLING*/
			float3 worldPos;
			float4 screenPos;
			/*END*/
		};

		half _Cutoff;
		half _Glossiness;
		half _Metallic;
		fixed4 _MainColor;
		half4 _SpeedDistort;

		void surf (Input IN, inout SurfaceOutputStandard o) {
			/*USE THIS PART TO MAKE CUSTOM SURFACE SHADER WITH UI CULLING*/
			makeUI3DClippingOnWorldPos(IN.worldPos, IN.screenPos.xy / IN.screenPos.w);
			/*END*/
			fixed4 mask = tex2D (_MainTex, IN.uv_MainTex + _Time.x * _SpeedDistort.xy);
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex + mask * _SpeedDistort.zw -  _Time.x * _SpeedDistort.xy  * 1.4);
			if(c.r > _MainColor.a - (1-_Cutoff)) discard;
			o.Albedo = _MainColor;
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
			o.Alpha = c.a;
		}
		ENDCG
	}
	Fallback "Transparent/Cutout/Diffuse"
	CustomEditor "UIUnlitShaderEditor"
}