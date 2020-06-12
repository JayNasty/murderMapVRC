Shader "Unlit/someOtherShader"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Zoom    ("Zoom", Range(1.0, 32.0)) = 8
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" }
		LOD 100

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			// make fog work
			#pragma multi_compile_fog
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				UNITY_FOG_COORDS(1)
				float4 vertex : SV_POSITION;
			};

			sampler2D _MainTex;
			float _Zoom;
			float4 _MainTex_ST;
			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				UNITY_TRANSFER_FOG(o,o.vertex);
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				
				float zoom = _Zoom;
				float2 coord = i.uv -0.5+1/(2*zoom);
				float3 color = 0;


				float2 gcoord = frac(coord*zoom)-0.5;
				float2 id     = floor(coord*zoom);

				float t = _Time.y;
				
				

				float m = 0.0;

				for(float y = -1.0; y <= 1.0; y++){
					for(float x = -1.0; x <= 1.0; x++){
						float2 offset = float2(x,y);

						float d = length(gcoord-offset);
						float dist = length(id+offset)*0.30;

						float r = lerp(0.3,1.5,sin(dist-t)*0.5+0.5);

						m+=smoothstep(r, r*0.99, d);
					}
				}

				//color.rg = gcoord;
				color += m % 2;
				float4 col = float4(color,1.0f);
				return col;
			}
			ENDCG
		}
	}
}
