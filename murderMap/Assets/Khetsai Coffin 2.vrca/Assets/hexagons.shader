Shader "Hidden/hexagons"
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
    float3 tot = float3(0.0);
    
    #if AA>1
    for( int mm=0; mm<AA; mm++ )
    for( int nn=0; nn<AA; nn++ )
    {
        float2 off = float2(mm,nn)/float(AA);
        float2 uv = (fragCoord+off)/iResolution.xy;
        float2 pos = (-iResolution.xy + 2.0*(fragCoord+off))/iResolution.y;
    #else    
    {
        float2 uv = fragCoord/iResolution.xy;
        float2 pos = (-iResolution.xy + 2.0*fragCoord)/iResolution.y;
    #endif

        // distort
        pos mul(1.0 + 0.3*length(pos));

        // gray
        float4 h = hexagon(8.0*pos + 0.5*iTime);
        float n = noise( float3(0.3*h.xy+iTime*0.1,iTime) );
        float3 col = 0.15 + 0.15*hash1(h.xy+1.2)*float3(1.0);
        col mul(smoothstep( 0.10, 0.11, h.z ));
        col mul(smoothstep( 0.10, 0.11, h.w ));
        col mul(1.0 + 0.15*sin(40.0*h.z));
        col mul(0.75 + 0.5*h.z*n);


        // red
        h = hexagon(6.0*pos + 0.6*iTime);
        n = noise( float3(0.3*h.xy+iTime*0.1,iTime) );
        float3 colb = 0.9 + 0.8*sin( hash1(h.xy)*1.5 + 2.0 + float3(0.0,1.0,1.0) );
        colb mul(smoothstep( 0.10, 0.11, h.z ));
        colb mul(1.0 + 0.15*sin(40.0*h.z));
        colb mul(0.75 + 0.5*h.z*n);

        h = hexagon(6.0*(pos+0.1*float2(-1.3,1.0)) + 0.6*iTime);
        col mul(1.0-0.8*smoothstep(0.45,0.451,noise( float3(0.3*h.xy+iTime*0.1,iTime) )));

        col = lerp( col, colb, smoothstep(0.45,0.451,n) );

        col mul(pow( 16.0*uv.x*(1.0-uv.x)*uv.y*(1.0-uv.y), 0.1 ));

        tot += col;
	}	
 	#if AA>1
    tot /= float(AA*AA);
    #endif
        
	fragColor = float4( tot, 1.0 );

#define AA 2

// { 2d cell id, distance to border, distnace to center )
float4 hexagon( float2 p ) 
{
	float2 q = float2( p.x*2.0*0.5773503, p.y + p.x*0.5773503 );
	
	float2 pi = floor(q);
	float2 pf = fract(q);

	float v = mod(pi.x + pi.y, 3.0);

	float ca = step(1.0,v);
	float cb = step(2.0,v);
	float2  ma = step(pf.xy,pf.yx);
	
    // distance to borders
	float e = dot( ma, 1.0-pf.yx + ca*(pf.x+pf.y-1.0) + cb*(pf.yx-2.0*pf.xy) );

	// distance to center	
	p = float2( q.x + floor(0.5+p.y/1.5), 4.0*p.y/3.0 )*0.5 + 0.5;
	float f = length( (fract(p) - 0.5)*float2(1.0,0.85) );		
	
	return float4( pi + ca - cb*ma, e, f );
}

float hash1( float2  p ) { float n = dot(p,float2(127.1,311.7) ); return fract(sin(n)*43758.5453); }

float noise( in float3 x )
{
    float3 p = floor(x);
    float3 f = fract(x);
	f = f*f*(3.0-2.0*f);
	float2 uv = (p.xy+float2(37.0,17.0)*p.z) + f.xy;
	float2 rg = textureLod( iChannel0, (uv+0.5)/256.0, 0.0 ).yx;
	return lerp( rg.x, rg.y, f.z );
}

			}
			ENDCG
		}
	}
}
