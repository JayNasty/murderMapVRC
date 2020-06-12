Shader "Custom/3DTextTest" {
	Properties {
		_MainTex ("Font Texture", 2D) = "white" {}
		_Color ("Text Color", Color) = (1,1,1,1)
		_EmissionIntensity("Emission Intensity",Range(0,10)) = 1
	}
 
	SubShader {
		Tags { "Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent" }
		Lighting On Cull Back ZWrite On Fog { Mode Off }
		LOD 200
		
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Lambert alpha

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		sampler2D _MainTex;


		struct Input {
			float2 uv_MainTex;
		};

		fixed4 _Color;
		half _EmissionIntensity;

		void surf (Input IN, inout SurfaceOutput o) {
			float4 Tex2D1 = (tex2D(_MainTex,(IN.uv_MainTex)))*_Color;
			o.Albedo = Tex2D1.rgb;
			o.Emission = Tex2D1*_EmissionIntensity;
			o.Alpha = Tex2D1.a;
		}
		ENDCG
	}
	FallBack "Transparent/VertexLit"
}