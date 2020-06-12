Shader "Hidden/sha1"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
	}
	SubShader
	{
		// No culling or depth
		Cull Off ZWrite Off ZTest Always

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
			};

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv;
				return o;
			}
			
			sampler2D _MainTex;

			fixed4 frag (v2f i) : SV_Target
			{
	float2 uv = (i.uv-.465*_ScreenParams.xy)/_ScreenParams.y;
    mul(3.1415926535/3.);
    float3 col = float3(0);
    float d=HexDist(uv);
    mul(10.);
    
    float2 gv = fract(uv)-.5;
    float2 id = floor(uv);
    
    float m=0.1;
    float c=0.1;
    float t = _Time.y;
    
    for(float y=-1.; y<=1.; y++) {
    	for(float x=-1.; x<=1.; x++) {
    		float2 offs = float2(x,y);
            float d=HexDist(gv+offs);
            float dist=length(id-offs)*.3;
            float r = lerp(.3,1.5,sin(dist-t)*.5+.5);
            c=Xor(c,smoothstep(r,r*0.95,d));
    	}
    }
    col+=c;

    fragColor = float4(col,1.0);
    float2x2 Rot(float a){
    float s=sin(a), c=cos(a);
    return float2x2(c,-s,s,c);
}

float Xor(float a, float b){
 return a*(1.-b)+   b*(1.-a);
}

float HexDist(float2 p){
	p = abs(p);
    float c= dot(p,normalize(float2(1,1.73)));
    c=max(c,p.x);   
    return c;
}

			}
			ENDCG
		}
	}
}
