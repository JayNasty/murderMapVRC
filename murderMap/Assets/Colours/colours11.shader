//Original: https://www.shadertoy.com/view/MtcXDr#

Shader "Shadertoy/Colours"
{
	Subshader
	{
	Tags 
     { 
     	"Queue"="Transparent+5000" "IgnoreProjector"="True" "RenderType"="opaque"
		/*MAX RENDER*/
     }
		Pass
		{
			CGPROGRAM
			#pragma vertex vertex_shader
			#pragma fragment pixel_shader
			#pragma target 4.0

			struct custom_type
			{
				float4 vertex : SV_POSITION;
				float2 uv : TEXCOORD0;
			};

			float noise (float3 n) 
			{ 
				return frac(sin(dot(n, float3(95.43583, 93.323197, 94.993431))) * 65536.32);
			}

			float perlin_a (float3 n)
			{
				float3 base = floor(n * 64.0) * 0.015625;
				float3 dd = float3(0.015625, 0.0, 0.0);
				float a = noise(base);
				float b = noise(base + dd.xyy);
				float c = noise(base + dd.yxy);
				float d = noise(base + dd.xxy);
				float3 p = (n - base) * 64.0;
				float t = lerp(a, b, p.x);
				float tt = lerp(c, d, p.x);
				return lerp(t, tt, p.y);
			}

			float perlin_b (float3 n)
			{
				float3 base = float3(n.x, n.y, floor(n.z * 64.0) * 0.015625);
				float3 dd = float3(0.015625, 0.0, 0.0);
				float3 p = (n - base) *  64.0;
				float front = perlin_a(base + dd.yyy);
				float back = perlin_a(base + dd.yyx);
				return lerp(front, back, p.z);
			}

			float fbm(float3 n)
			{
				float total = 0.0;
				float m1 = 1.0;
				float m2 = 0.1;
				for (int i = 0; i < 5; i++)
				{
					total += perlin_b(n * m1) * m2;
					m2 *= 2.0;
					m1 *= 0.5;
				}
				return total;
			}

			float A (float3 n)
			{
				return fbm(n + fbm(n * 2.9 - 1000.0) * 0.05);
			}

			float B (float3 n)
			{ 
				return fbm(n + fbm(n + fbm(n * 1.3 + 115.0) * 0.35) * 0.17);
			}

			float C (float3 n)
			{
				return fbm(n + fbm(n * 3.0) * 0.15);   
			}

			float3 ABC (float3 n)
			{
				return float3(A(5.0 * n),0,0)  + float3(0.0, B(4.0 * n) ,0.0 )  + float3 (0,0,C(6.0 * n) );
			}

			custom_type vertex_shader (float4 vertex : POSITION, float2 uv : TEXCOORD0)
			{
				custom_type vs;
				vs.vertex = UnityObjectToClipPos (vertex);
				vs.uv=uv;
				return vs;
			}

			float4 pixel_shader (custom_type ps) : SV_TARGET
			{
				return float4(float3((ABC(float3(ps.uv.xy*5.1,_Time.g*0.1)*0.1)-1.0)),1.0);
			}
			    //float ca = cloudAtmosphere(uv) * 0.5;
    //fragColor = vec4(ca, ca, ca, 1.0);
    
    /*
    vec3 ro = vec3(cos(iTime), 0.0, iTime * 10.0);
    ro.y = altitude(ro) + 30.0;
    //vec3 fwd = normalize(-ro);
    //vec3 ro = vec3(0.0, 10.0, 0.0);
    vec3 fwd = normalize(vec3(0.0, -10.0, 50.0));
    vec3 up = vec3(0.0, 1.0, 0.0);
    vec3 left = normalize(cross(fwd, up));
    vec3 rd = rayDir.x * left + rayDir.y * up + rayDir.z * fwd;
    
    fragColor = vec4(0.0, 0.0, 0.0, 1.0);
    vec3 pos = ro;
    float stepSize = 1.1;
    for (int i = 1; i < 50; i++)
    {
        //stepSize += stepSize * 0.1;
        float dist = map(pos, rd);
        pos += rd * max(dist, 0.0);
        if (dist < 0.01)
        {
            fragColor = vec4(calcNormal(pos) * 0.5 + 0.5, 1.0);
            break;
        }
        pos += rd * max(dist * float(i) / 30.0, 0.0);
    }
	*/
    //fragColor = vec4(color, 1.0);
			ENDCG
		}
	}
}