Shader ".NEK0/AVA/Epic Eye Shader"
{
	Properties
	{
		[Header(________Discord NEK0#001_______)]
		[Space(10)]

		[Header(________Main Lense_______)]
		_MainlenseOffset("Main lense Offset", Vector) = (-0.5,-0.5,0,0)
		_MainLenseSize("Main Lense Size ", Vector) = (7,2.6,0,0)
		_MainLenseSmooth("Main Lense Smooth", Float) = 1
		_lerpLense("lerp Lense", Range( 0 , 1)) = 0.5
		[Space(5)]

		[Toggle]_PawToggle("Paw Toggle", Float) = 0
		[Space(10)]


		[Header(________Outer Lense_______)]
		_OuterLenseSize("Outer Lense Size", Vector) = (2,2,0,0)
		_SmoothOuterLense("Smooth Outer Lense", Float) = 0.15
		[Space(10)]


		[Header(________BackGround_______)]
		_BackGround("BackGround", 2D) = "white" {}
		_BGOffset("BG Offset", Vector) = (0,0,0,0)
		_BGTiling("BG Tiling", Vector) = (1,1,0,0)
		[Space(10)]


		[Header(________Gif Sheet_______)]
		_GifSheet("Gif Sheet", 2D) = "white" {}
		_DownCount("DownCount", Float) = 0
		_RightCount("Right Count", Float) = 0
		_FPS("FPS", Float) = 9
		_GifTiling("Gif Tiling", Vector) = (3,3,0,0)
		_GifOffset("Gif Offset", Vector) = (-1.5,-1.5,0,0)
		[HDR]_GifColor("Gif Color ", Color) = (1,1,1,0)
		_GifLerp("Gif Lerp", Range( -1 , 1)) = -1
		[Space(25)]


		[Header(next part converted from ShaderToy)]
		[Space(10)]


		[Header(________Snow_______)]
		_Snow("Snow Layers", Float) = 0
		_Sspeed("Fall Speed", Float) = 0
		_WIDTH("WIDTH", Float) = 0
		_DEPTH("DEPTH", Float) = 0
		[Space(10)]


		[Header(________Fire_______)]
		[HDR]_col("Fire = white", Color) = (0,0,0,0)
		[Space(10)]


		[Header(________Falling Hearts_______)]
		NUM_HEARTS("Heart Amount", Float) = 0
		_hfall("Heart fallspeed", Float) = 0.1
		[HDR]_colh("heart Color", Color) = (1,1,1,1)
		[Space(10)]


		[Header(________fractal_______)]
		[HDR]_colf("Frac Color", Color) = (0,0,0,0)
		_BGOffsetf("Frac Offset", Vector) = (10,10,0,0)
		[Space(10)]


		[Header(________Parallax_______)]
		[Header(Use the Offset to fix position )]
		[Header(Snow Fire Hearts Fractal use BG Scale)]
		_MainLenseScale("Main Lense Scale", Float) = 0
		_BGScale("BG Scale", Float) = 0
		_BGHight("BG Hight", Float) = 0
		_GifScale("Gif Scale", Float) = 0

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Opaque" }
		LOD 100
		
		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend Off
		Cull Back
		ColorMask RGBA
		ZWrite On
		ZTest LEqual
		Offset 0 , 0
		
		
		
		Pass
		{
			Name "Unlit"
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#include "UnityShaderVariables.cginc"


			struct appdata
			{
				float4 vertex : POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 ase_texcoord : TEXCOORD0;
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_OUTPUT_STEREO
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			uniform float2 _GifTiling;
			uniform float2 _GifOffset;
			uniform float _GifScale;
			uniform sampler2D _GifSheet;
			uniform float _RightCount;
			uniform float _DownCount;
			uniform float _FPS;
			uniform float _GifLerp;
			uniform float4 _GifColor;
			uniform float _PawToggle;
			uniform float _Snow;
			uniform float _WIDTH;
			uniform float _hfall;

			uniform float  NUM_HEARTS;

			uniform float _Fire;
			uniform float _DEPTH;
			uniform float _Sspeed;
			uniform float _MainLenseSmooth;
			uniform float2 _MainlenseOffset;
			uniform float _MainLenseScale;
			uniform float3 _MainLenseSize;
			uniform float _lerpLense;
			uniform sampler2D _BackGround;
			uniform float2 _BGTiling;
			uniform float2 _BGOffset;
			uniform float2 _BGOffsetf;
			uniform float _BGHight;
			uniform float4 _col;
			uniform float4 _colh;
			uniform float4 _colf;
			uniform float _BGScale;
			uniform float _SmoothOuterLense;
			uniform float3 _OuterLenseSize;
			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float3 ase_worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				o.ase_texcoord1.xyz = ase_worldPos;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;
				float3 vertexValue =  float3(0,0,0) ;
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);
				return o;
			}








			float3 rgb2hsv(float3 c)
{
    float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    float4 p = lerp(float4(c.bg, K.wz), float4(c.gb, K.xy), step(c.b, c.g));
    float4 q = lerp(float4(p.xyw, c.r), float4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return float3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

float3 hsv2rgb(float3 c)
{
    float4 K = float4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    float3 p = abs(frac(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * lerp(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

float rand(float2 n) {
    return frac(sin(cos(dot(n, float2(12.9898,12.1414)))) * 83758.5453);
}

float noise(float2 n) {
    const float2 d = float2(0.0, 1.0);
    float2 b = floor(n), f = smoothstep((0.0),(1.0), frac(n));
    return lerp(lerp(rand(b), rand(b + d.yx), f.x), lerp(rand(b + d.xy), rand(b + d.yy), f.x), f.y);
}

float fbm(float2 n) {
    float total = 0.0, amplitude = 1.0;
    for (int i = 0; i <5; i++) {
        total += noise(n) * amplitude;
        n += n*1.7;
        amplitude *= 0.47;
    }
    return total;
}







#define S(a, b, t) smoothstep(a, b, t)
#define sat(x) clamp(x, 0., 1.)
#define HEARTCOL float3(1, 1, 1)
#define LIGHT_DIR float3(0, 0, 0)

// Polynomial smooth max from IQ
float smax( float a, float b, float k ) {
	float h = sat( .5 + .5*(b-a)/k );
	return lerp( a, b, h ) + k*h*(1.-h);
}

// Quaternion rotation functions from Ollj
float4 qmulq(float4 q1, float4 q2){return float4(q1.xyz*q2.w+q2.xyz*q1.w+cross(q1.xyz,q2.xyz),(q1.w*q2.w)-dot(q1.xyz,q2.xyz));}
float4 aa2q(float3 axis, float angle){return float4(normalize(axis)*sin(angle*0.5),cos(angle*0.5));}
float4 qinv(float4 q){return float4(-q.xyz,q.w)/dot(q,q);}
float3 qmulv(float4 q, float3 p){return qmulq(q,qmulq(float4(p,.0),qinv(q))).xyz;}

float2 RaySphere(float3 rd, float3 p) {
    float l = dot(rd, p);
    float det = l*l - dot(p, p) + 1.;
    if (det < 0.) return (-1);

    float sd = sqrt(det);
    return float2(l - sd, l+sd);
}

struct sphereInfo {
	float3 p1, p2, n1, n2;
    float2 uv1, uv2;
};

sphereInfo GetSphereUvs(float3 rd, float2 i, float2 rot, float3 s) {
	sphereInfo res;
    rot *= 3.5;
    float4 q = aa2q(float3(cos(rot.x),sin(rot.x),0), rot.y);
    float3 o = qmulv(q, -s)+s;
    float3 d = qmulv(q, rd);
    
    res.p1 = rd*i.x;
    float3 p = o+d*i.x-s;
    res.uv1 = float2(atan2(p.x,p.z), p.y);
    res.n1 = res.p1-s;
 
    res.p2 = rd*i.y;
    p = o+d*i.y-s;
    res.uv2 = float2(atan2(p.x,p.z), p.y);
    res.n2 = s-res.p2;
        
    return res;
}

float Heart(float2 uv, float b) {
	uv.x*=.5;
    float shape = smax(sqrt(abs(uv.x)), b, .3*b)*.5;
    uv.y -= shape*(1.-b);

    return S(b, -b, length(uv)-.5);
}

float4 HeartBall(float3 rd, float3 p, float2 rot, float t, float blur) {
    float2 d = RaySphere(rd, p);
    
   	float4 col = (0);
    if(d.x>0.) {
    	sphereInfo info = GetSphereUvs(rd, d, rot, p);
    	
        float sd = length(cross(p, rd));
        float edge =  S(1., lerp(1., 0.1, blur), sd);
        
        float backMask = Heart(info.uv2, blur)*edge; 
        float frontMask = Heart(info.uv1, blur)*edge; 
        float frontLight = sat(dot(LIGHT_DIR, info.n1)*.8+.2);
        float backLight = sat(dot(LIGHT_DIR, info.n2)*.8+.2)*.9;

        col = lerp(float4(backLight*HEARTCOL, backMask), 
                  float4(frontLight*HEARTCOL, frontMask), 
                  frontMask);
    }
    return col;
}









			float3 look(float2 xy, float3 origin, float3 target)
{
	float3 up=normalize(float3(0.,1.,0.));
    float3 fwd=normalize(target-origin);
    float3 right=normalize(cross(fwd,up));
    up=normalize(cross(fwd,right));
    return normalize(fwd+right*xy.x+up*xy.y);
}
float map(float3 p)
{
    for(int i=0;i<6;i++)
    {
        p-=0.33;
        float d=atan2(p.x,p.y);
        float m=length(p.yx);
        d+=0.6;
        p.y=sin(d)*m;
        p.x=cos(d)*m;
        d=atan2(p.x,p.z);
        m=length(p.zx);
        d+=0.7;
        p.z=sin(d)*m;
        p.x=cos(d)*m;
        p=abs(p);
    }
    return length(p)-.2;
}
#define MAX_DISTANCE 6.
float march(float3 origin, float3 ray)
{
    float t=.2;
    for(int i=0;i<17; i++)
    {
		float d=map(origin+ray*t);
        if(d<0.001||d>=MAX_DISTANCE) break;
        t+=d;
    }
    return min(t,MAX_DISTANCE);
}












#define mod(x,y)(x-y*floor(x/y))

// Copyright (c) 2013 Andrew Baldwin (twitter: baldand, www: http://thndl.com)
// License = Attribution-NonCommercial-ShareAlike (http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US)

// "Just snow"
// Simple (but not cheap) snow made from multiple parallax layers with randomly positioned 
// flakes and directions. Also includes a DoF effect. Pan around with mouse.


			fixed4 frag (v2f i ) : SV_Target
			{


				UNITY_SETUP_INSTANCE_ID(i);
				fixed4 finalColor;
				float2 uv237 = i.ase_texcoord.xy * _GifTiling + _GifOffset;
				float3 ase_worldPos = i.ase_texcoord1.xyz;
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(ase_worldPos);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float2 Offset317 = ( ( 0.0 - 1 ) * ase_worldViewDir.xy * _GifScale ) + uv237;
				float2 break319 = Offset317;
				float temp_output_278_0 = ( ( 1.0 - 0.0 ) * 99.0 );
				float lerpResult281 = lerp( 0.0 , break319.x , temp_output_278_0);
				float lerpResult282 = lerp( 0.0 , break319.y , temp_output_278_0);
				float temp_output_4_0_g1 = _RightCount;
				float temp_output_5_0_g1 = _DownCount;
				float2 appendResult7_g1 = (float2(temp_output_4_0_g1 , temp_output_5_0_g1));
				float totalFrames39_g1 = ( temp_output_4_0_g1 * temp_output_5_0_g1 );
				float2 appendResult8_g1 = (float2(totalFrames39_g1 , temp_output_5_0_g1));
				float mulTime301 = _Time.y * _FPS;
				float clampResult42_g1 = clamp( 0.0 , 0.0001 , ( totalFrames39_g1 - 1.0 ) );
				float temp_output_35_0_g1 = frac( ( ( mulTime301 + clampResult42_g1 ) / totalFrames39_g1 ) );
				float2 appendResult29_g1 = (float2(temp_output_35_0_g1 , ( 1.0 - temp_output_35_0_g1 )));
				float2 temp_output_15_0_g1 = ( ( Offset317 / appendResult7_g1 ) + ( floor( ( appendResult8_g1 * appendResult29_g1 ) ) / appendResult7_g1 ) );
				float4 tex2DNode228 = tex2D( _GifSheet, temp_output_15_0_g1 );
				float4 lerpResult295 = lerp( ( sqrt( log2( log10( ( lerpResult281 * ( 1.0 - break319.x ) ) ) ) ) * sqrt( log2( log10( ( lerpResult282 * ( 1.0 - break319.y ) ) ) ) ) * tex2DNode228 ) , tex2DNode228 , _GifLerp);
				float4 clampResult300 = clamp( lerpResult295 , float4( 0,0,0,0 ) , float4( 0.5808823,0.5808823,0.5808823,0 ) );
				float2 uv139 = i.ase_texcoord.xy * float2( 1,1 ) + _MainlenseOffset;
				float2 Offset195 = ( ( 0.0 - 1 ) * ase_worldViewDir.xy * _MainLenseScale ) + uv139;
				float smoothstepResult142 = smoothstep( 0.0 , _MainLenseSmooth , length( ( float3( Offset195 ,  0.0 ) * _MainLenseSize ) ));
				float temp_output_143_0 = log( smoothstepResult142 );
				float lerpResult206 = lerp( ceil( temp_output_143_0 ) , temp_output_143_0 , _lerpLense);
				float2 uv212 = i.ase_texcoord.xy * float2( 1,1 ) + float2( -0.5,-0.41 );
				float2 Offset213 = ( ( 0.0 - 1 ) * ase_worldViewDir.xy * -0.15 ) + uv212;
				float smoothstepResult216 = smoothstep( 0.0 , 0.025 , length( ( float3( Offset213 ,  0.0 ) * float3(-0.09,0.13,0) ) ));
				float2 uv132 = i.ase_texcoord.xy * float2( 1,1 ) + float2( -0.66,-0.5 );
				float2 Offset196 = ( ( 0.0 - 1 ) * ase_worldViewDir.xy * -0.15 ) + uv132;
				float3 _PawSize = float3(-0.22,0.24,0);
				float smoothstepResult135 = smoothstep( 0.0 , 0.0184 , length( ( float3( Offset196 ,  0.0 ) * _PawSize ) ));
				float2 uv122 = i.ase_texcoord.xy * float2( 1,1 ) + float2( -0.55,-0.56 );
				float2 Offset197 = ( ( 0.0 - 1 ) * ase_worldViewDir.xy * -0.15 ) + uv122;
				float smoothstepResult127 = smoothstep( 0.0 , 0.0184 , length( ( float3( Offset197 ,  0.0 ) * _PawSize ) ));
				float2 uv164 = i.ase_texcoord.xy * float2( 1,1 ) + float2( -0.45,-0.56 );
				float2 Offset199 = ( ( 0.0 - 1 ) * ase_worldViewDir.xy * -0.15 ) + uv164;
				float smoothstepResult167 = smoothstep( 0.0 , 0.0184 , length( ( float3( Offset199 ,  0.0 ) * _PawSize ) ));
				float2 uv50 = i.ase_texcoord.xy * float2( 1,1 ) + float2( -0.34,-0.5 );
				float2 Offset198 = ( ( 0.0 - 1 ) * ase_worldViewDir.xy * -0.15 ) + uv50;
				float smoothstepResult59 = smoothstep( 0.0 , 0.0184 , length( ( float3( Offset198 ,  0.0 ) * _PawSize ) ));
				float temp_output_137_0 = ( log( smoothstepResult216 ) + log( smoothstepResult135 ) + log( smoothstepResult127 ) + log( smoothstepResult167 ) + log( smoothstepResult59 ) );
				float lerpResult176 = lerp( ceil( temp_output_137_0 ) , temp_output_137_0 , _lerpLense);
				float2 uv96 = i.ase_texcoord.xy * _BGTiling + _BGOffset;
				float2 Offset88 = ( ( _BGHight - 1 ) * ase_worldViewDir.xy * _BGScale ) + uv96;
				float2 uv77 = i.ase_texcoord.xy * float2( 1,1 ) + float2( -0.5,-0.5 );
				float smoothstepResult82 = smoothstep( 0.0 , _SmoothOuterLense , ( 1.0 - length( ( float3( uv77 ,  0.0 ) * _OuterLenseSize ) ) ));
				

	const float3x3 t = float3x3(13.323122,23.5112,21.71123,21.1212,28.7312,11.9312,21.8112,14.7212,61.3934);
	float2 uv = uv132;

	float3 acc = (0.0);
	float dof = 5.*sin(_Time.y*.1);
	for (int i=0;i<_Snow;i++) {
		float fi = float(i);
		float2 q = uv*(1.+fi*_DEPTH);
		q += float2(q.y*(_WIDTH*mod(fi*7.238917,1.)-_WIDTH*.5),_Sspeed*_Time.y/(1.+fi*_DEPTH*.03));
		float3 n = float3(floor(q),31.189+fi);
		float3 m = floor(n)*.00001 + frac(n);
		float3 mp = (31415.9+m);
		float3 r = frac(mp);
		float2 s = abs(mod(q,1.)-.5+.9*r.xy-.45);
		s += .01*abs(2.*frac(10.*q.yx)-1.); 
		float d = .6*max(s.x-s.y,s.x+s.y)+max(s.x,s.y)-.01;
		float edge = .005+.05*min(.5*abs(fi-5.-dof),1.);
		acc += (smoothstep(edge,-edge,d)*(r.x/(1.+.02*fi*_DEPTH)));
			}
		float4 Snow = float4(float3(acc),1.0);










	// sample the texture


    const float3 c1 = (0.5, 0.0, 0.1);
    const float3 c2 = (0.9, 0.1, 0.0);
    const float3 c3 = (0.2, 0.1, 0.7);
    const float3 c4 = (1.0, 0.9, 0.1);
    const float3 c5 = (0.1);
    const float3 c6 = (0.9);

    float2 speed = float2(0,0);
    float shift = 0+sin(_Time.y);

    
    //change the constant term for all kinds of cool distance versions,
    //make plus/minus to switch between 
    //ground fire and fire rain!
	float dist = 0-sin(_Time.y);
    
    float2 p = Offset88;
    p.x -= _Time.y;

    float q = fbm(p - _Time.y * 0.01+1.0*sin(_Time.y)/10.0);
    float qb = fbm(p - _Time.y * 0.002+0.1*cos(_Time.y)/5.0);
    float q2 = fbm(p - _Time.y * 0.44 - 5.0*cos(_Time.y)/7.0) - 6.0;
    float q3 = fbm(p - _Time.y * 0.9 - 10.0*cos(_Time.y)/30.0)-4.0;
    float q4 = fbm(p - _Time.y * 2.0 - 20.0*sin(_Time.y)/20.0)+2.0;

    q = (q + qb - .4 * q2 -2.0*q3  + .6*q4)/3.8;
    float2 r = float2(fbm(p + q /2.0 + _Time.y  - p.x - p.y), fbm(p + q - _Time.y ));
    float3 c = lerp(c1, c2, fbm(p + r)) + lerp(c3, c4, r.x) - lerp(c5, c6, r.y);
    float3 color = (c * cos(Offset88.y));
    color += .05;
    color.r *= 1.8;


     float3 hsv = rgb2hsv(color);
    hsv.y *= hsv.z  * 1.1;
    hsv.z *= hsv.y * 1.13;
    hsv.y = (2.2-hsv.z*.9)*1.20;
    color = hsv2rgb(hsv);

    float4 Fire = float4(color.x, color.y, color.z, 0)*_col;















    float ti = _Time.y*_hfall;
    float3 rd = normalize(float3(Offset88, 1));
    float2 rot = ti*float2(.12, .18);
    float4 col = (0);




        
    for(float i=0.; i<1.; i+=(1./NUM_HEARTS)) {
        float x = (frac(cos(i*536.3)*7464.4)-.5)*15.;
        float y = (frac(-ti*.2+i*7.64)-.5)*15.;
        float z = lerp(10., 2., i);
        
        float blur = lerp(.001, .001, S(.0, .4, abs(uv.y-i)));
        
        rot += (frac(sin(i*float2(536.3, 23.4))*float2(764.4, 987.3))-.5);
        float4 heart = HeartBall(rd, float3(x, y, z), rot, ti, blur);
        
        col = lerp(col, heart, heart.a);
    }



    float2 uv1 = Offset88*20;

    uv1.x -= _BGOffsetf.x;
   	uv1.y -= _BGOffsetf.y;
	  
    float3 camera=float3(sin(1),sin(_Time.x*2),cos(1))*2.;
	float shade=1.-march(camera,look(uv1,camera,(1.)))/MAX_DISTANCE;
    shade=pow(shade,3.);
  


				finalColor = saturate( ( ( clampResult300 * _GifColor ) + lerp(lerpResult206,lerpResult176,_PawToggle ) + tex2D( _BackGround, Offset88 ) + log( smoothstepResult82 ) ) );
				return  shade*2*_colf +Snow + Fire +col*_colh + finalColor ;
			}
			ENDCG
		}
	}
}