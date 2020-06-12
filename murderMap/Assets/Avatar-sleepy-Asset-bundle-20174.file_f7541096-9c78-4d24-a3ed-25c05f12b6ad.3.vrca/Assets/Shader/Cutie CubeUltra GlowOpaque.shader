Shader "Cutie Cube/Ultra Glow/Opaque" {
	Properties {
		_MainColor ("Main Color", Vector) = (1,1,1,1)
		_MainTex ("Texture", 2D) = "white" {}
		_BumpMap ("Bumpmap", 2D) = "bump" {}
		_GlowColor ("Glow Color", Vector) = (1,0.58,0,1)
		_GlowPower ("Glow Power", Range(10, 0.5)) = 10
		_Albedo ("Albedo", Range(0, 1)) = 0
		_Emission ("Emission", Range(1, 2)) = 1.3
		_OcclusionPower ("Occlusion power", Range(0, 3)) = 0.4
		_Occlusion ("Occlusion", 2D) = "white" {}
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Name "FORWARD"
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
			GpuProgramID 811
			Program "vp" {
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.w = u_xlat0.x;
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat2.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
					    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    vs_TEXCOORD2.y = u_xlat3.x;
					    vs_TEXCOORD2.x = u_xlat2.z;
					    vs_TEXCOORD2.z = u_xlat1.y;
					    vs_TEXCOORD3.x = u_xlat2.x;
					    vs_TEXCOORD4.x = u_xlat2.y;
					    vs_TEXCOORD3.z = u_xlat1.z;
					    vs_TEXCOORD4.z = u_xlat1.x;
					    vs_TEXCOORD3.w = u_xlat0.y;
					    vs_TEXCOORD4.w = u_xlat0.z;
					    vs_TEXCOORD3.y = u_xlat3.y;
					    vs_TEXCOORD4.y = u_xlat3.z;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[40];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					int u_xlati12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlati12 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati12 + 1) / 4][(u_xlati12 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati12 / 4][u_xlati12 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati12 + 2) / 4][(u_xlati12 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati12 + 3) / 4][(u_xlati12 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.w = u_xlat0.x;
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat2.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
					    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    vs_TEXCOORD2.y = u_xlat3.x;
					    vs_TEXCOORD2.x = u_xlat2.z;
					    vs_TEXCOORD2.z = u_xlat1.y;
					    vs_TEXCOORD3.x = u_xlat2.x;
					    vs_TEXCOORD4.x = u_xlat2.y;
					    vs_TEXCOORD3.z = u_xlat1.z;
					    vs_TEXCOORD4.z = u_xlat1.x;
					    vs_TEXCOORD3.w = u_xlat0.y;
					    vs_TEXCOORD4.w = u_xlat0.z;
					    vs_TEXCOORD3.y = u_xlat3.y;
					    vs_TEXCOORD4.y = u_xlat3.z;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0[39];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_8[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.w = u_xlat0.x;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    vs_TEXCOORD2.x = u_xlat1.z;
					    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
					    u_xlat3.xyz = u_xlat2.yzx * u_xlat1.yzx + (-u_xlat3.xyz);
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    vs_TEXCOORD2.y = u_xlat3.x;
					    vs_TEXCOORD2.z = u_xlat2.x;
					    vs_TEXCOORD3.x = u_xlat1.x;
					    vs_TEXCOORD4.x = u_xlat1.y;
					    vs_TEXCOORD3.w = u_xlat0.y;
					    vs_TEXCOORD4.w = u_xlat0.z;
					    vs_TEXCOORD3.y = u_xlat3.y;
					    vs_TEXCOORD4.y = u_xlat3.z;
					    vs_TEXCOORD3.z = u_xlat2.y;
					    vs_TEXCOORD4.z = u_xlat2.z;
					    u_xlat0.x = u_xlat2.y * u_xlat2.y;
					    u_xlat0.x = u_xlat2.x * u_xlat2.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat1);
					    u_xlat3.y = dot(unity_SHBg, u_xlat1);
					    u_xlat3.z = dot(unity_SHBb, u_xlat1);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat3.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat2);
					    u_xlat1.y = dot(unity_SHAg, u_xlat2);
					    u_xlat1.z = dot(unity_SHAb, u_xlat2);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    vs_TEXCOORD5.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0[39];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_8[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_2[40];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat12;
					int u_xlati12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlati12 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati12 + 1) / 4][(u_xlati12 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati12 / 4][u_xlati12 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati12 + 2) / 4][(u_xlati12 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati12 + 3) / 4][(u_xlati12 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.w = u_xlat0.x;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    vs_TEXCOORD2.x = u_xlat1.z;
					    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
					    u_xlat3.xyz = u_xlat2.yzx * u_xlat1.yzx + (-u_xlat3.xyz);
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    vs_TEXCOORD2.y = u_xlat3.x;
					    vs_TEXCOORD2.z = u_xlat2.x;
					    vs_TEXCOORD3.x = u_xlat1.x;
					    vs_TEXCOORD4.x = u_xlat1.y;
					    vs_TEXCOORD3.w = u_xlat0.y;
					    vs_TEXCOORD4.w = u_xlat0.z;
					    vs_TEXCOORD3.y = u_xlat3.y;
					    vs_TEXCOORD4.y = u_xlat3.z;
					    vs_TEXCOORD3.z = u_xlat2.y;
					    vs_TEXCOORD4.z = u_xlat2.z;
					    u_xlat0.x = u_xlat2.y * u_xlat2.y;
					    u_xlat0.x = u_xlat2.x * u_xlat2.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat1);
					    u_xlat3.y = dot(unity_SHBg, u_xlat1);
					    u_xlat3.z = dot(unity_SHBb, u_xlat1);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat3.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat2);
					    u_xlat1.y = dot(unity_SHAg, u_xlat2);
					    u_xlat1.z = dot(unity_SHAb, u_xlat2);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    vs_TEXCOORD5.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD6;
					out vec4 vs_TEXCOORD8;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.w = u_xlat0.x;
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat3.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat3.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx + (-u_xlat4.xyz);
					    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat4.xyz = u_xlat0.xxx * u_xlat4.xyz;
					    vs_TEXCOORD2.y = u_xlat4.x;
					    vs_TEXCOORD2.x = u_xlat3.z;
					    vs_TEXCOORD2.z = u_xlat2.y;
					    vs_TEXCOORD3.x = u_xlat3.x;
					    vs_TEXCOORD4.x = u_xlat3.y;
					    vs_TEXCOORD3.z = u_xlat2.z;
					    vs_TEXCOORD4.z = u_xlat2.x;
					    vs_TEXCOORD3.w = u_xlat0.y;
					    vs_TEXCOORD4.w = u_xlat0.z;
					    vs_TEXCOORD3.y = u_xlat4.y;
					    vs_TEXCOORD4.y = u_xlat4.z;
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat0.x * 0.5;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD6.zw = u_xlat1.zw;
					    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
					    vs_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_2[38];
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_3_4;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD6;
					out vec4 vs_TEXCOORD8;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					int u_xlati10;
					int u_xlati15;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlati15 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati15 + 1) / 4][(u_xlati15 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati15 / 4][u_xlati15 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati15 + 2) / 4][(u_xlati15 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_StereoMatrixVP[(u_xlati15 + 3) / 4][(u_xlati15 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.w = u_xlat0.x;
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat3.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat3.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx + (-u_xlat4.xyz);
					    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat4.xyz = u_xlat0.xxx * u_xlat4.xyz;
					    vs_TEXCOORD2.y = u_xlat4.x;
					    vs_TEXCOORD2.x = u_xlat3.z;
					    vs_TEXCOORD2.z = u_xlat2.y;
					    vs_TEXCOORD3.x = u_xlat3.x;
					    vs_TEXCOORD4.x = u_xlat3.y;
					    vs_TEXCOORD3.z = u_xlat2.z;
					    vs_TEXCOORD4.z = u_xlat2.x;
					    vs_TEXCOORD3.w = u_xlat0.y;
					    vs_TEXCOORD4.w = u_xlat0.z;
					    vs_TEXCOORD3.y = u_xlat4.y;
					    vs_TEXCOORD4.y = u_xlat4.z;
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat0.x * 0.5;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.zz + u_xlat0.xw;
					    u_xlati10 = unity_StereoEyeIndex;
					    u_xlat1.xy = u_xlat1.ww * unity_StereoScaleOffset[u_xlati10].zw;
					    vs_TEXCOORD6.xy = u_xlat0.xy * unity_StereoScaleOffset[u_xlati10].xy + u_xlat1.xy;
					    vs_TEXCOORD6.zw = u_xlat1.zw;
					    vs_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0[42];
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_5[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD6;
					out vec4 vs_TEXCOORD8;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.w = u_xlat0.x;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat2.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    vs_TEXCOORD2.x = u_xlat2.z;
					    u_xlat3.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat3.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat3 = u_xlat0.xxxx * u_xlat3.xyzz;
					    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.wxy;
					    u_xlat4.xyz = u_xlat3.ywx * u_xlat2.yzx + (-u_xlat4.xyz);
					    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat4.xyz = u_xlat0.xxx * u_xlat4.xyz;
					    vs_TEXCOORD2.y = u_xlat4.x;
					    vs_TEXCOORD2.z = u_xlat3.x;
					    vs_TEXCOORD3.x = u_xlat2.x;
					    vs_TEXCOORD4.x = u_xlat2.y;
					    vs_TEXCOORD3.w = u_xlat0.y;
					    vs_TEXCOORD4.w = u_xlat0.z;
					    vs_TEXCOORD3.y = u_xlat4.y;
					    vs_TEXCOORD4.y = u_xlat4.z;
					    vs_TEXCOORD3.z = u_xlat3.y;
					    vs_TEXCOORD4.z = u_xlat3.w;
					    u_xlat0.x = u_xlat3.y * u_xlat3.y;
					    u_xlat0.x = u_xlat3.x * u_xlat3.x + (-u_xlat0.x);
					    u_xlat2 = u_xlat3.ywzx * u_xlat3;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    vs_TEXCOORD5.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat3.xyz;
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat0.x * 0.5;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD6.zw = u_xlat1.zw;
					    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
					    vs_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0[42];
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_5[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_4_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_4_2[38];
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_4_4;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD6;
					out vec4 vs_TEXCOORD8;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					int u_xlati10;
					int u_xlati15;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlati15 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati15 + 1) / 4][(u_xlati15 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati15 / 4][u_xlati15 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati15 + 2) / 4][(u_xlati15 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_StereoMatrixVP[(u_xlati15 + 3) / 4][(u_xlati15 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.w = u_xlat0.x;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat2.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    vs_TEXCOORD2.x = u_xlat2.z;
					    u_xlat3.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat3.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat3 = u_xlat0.xxxx * u_xlat3.xyzz;
					    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.wxy;
					    u_xlat4.xyz = u_xlat3.ywx * u_xlat2.yzx + (-u_xlat4.xyz);
					    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat4.xyz = u_xlat0.xxx * u_xlat4.xyz;
					    vs_TEXCOORD2.y = u_xlat4.x;
					    vs_TEXCOORD2.z = u_xlat3.x;
					    vs_TEXCOORD3.x = u_xlat2.x;
					    vs_TEXCOORD4.x = u_xlat2.y;
					    vs_TEXCOORD3.w = u_xlat0.y;
					    vs_TEXCOORD4.w = u_xlat0.z;
					    vs_TEXCOORD3.y = u_xlat4.y;
					    vs_TEXCOORD4.y = u_xlat4.z;
					    vs_TEXCOORD3.z = u_xlat3.y;
					    vs_TEXCOORD4.z = u_xlat3.w;
					    u_xlat0.x = u_xlat3.y * u_xlat3.y;
					    u_xlat0.x = u_xlat3.x * u_xlat3.x + (-u_xlat0.x);
					    u_xlat2 = u_xlat3.ywzx * u_xlat3;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    vs_TEXCOORD5.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat3.xyz;
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat0.x * 0.5;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.zz + u_xlat0.xw;
					    u_xlati10 = unity_StereoEyeIndex;
					    u_xlat1.xy = u_xlat1.ww * unity_StereoScaleOffset[u_xlati10].zw;
					    vs_TEXCOORD6.xy = u_xlat0.xy * unity_StereoScaleOffset[u_xlati10].xy + u_xlat1.xy;
					    vs_TEXCOORD6.zw = u_xlat1.zw;
					    vs_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.w = u_xlat0.x;
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat2.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
					    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    vs_TEXCOORD2.y = u_xlat3.x;
					    vs_TEXCOORD2.x = u_xlat2.z;
					    vs_TEXCOORD2.z = u_xlat1.y;
					    vs_TEXCOORD3.x = u_xlat2.x;
					    vs_TEXCOORD4.x = u_xlat2.y;
					    vs_TEXCOORD3.z = u_xlat1.z;
					    vs_TEXCOORD4.z = u_xlat1.x;
					    vs_TEXCOORD3.w = u_xlat0.y;
					    vs_TEXCOORD4.w = u_xlat0.z;
					    vs_TEXCOORD3.y = u_xlat3.y;
					    vs_TEXCOORD4.y = u_xlat3.z;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[40];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					int u_xlati12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlati12 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati12 + 1) / 4][(u_xlati12 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati12 / 4][u_xlati12 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati12 + 2) / 4][(u_xlati12 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati12 + 3) / 4][(u_xlati12 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.w = u_xlat0.x;
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat2.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
					    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    vs_TEXCOORD2.y = u_xlat3.x;
					    vs_TEXCOORD2.x = u_xlat2.z;
					    vs_TEXCOORD2.z = u_xlat1.y;
					    vs_TEXCOORD3.x = u_xlat2.x;
					    vs_TEXCOORD4.x = u_xlat2.y;
					    vs_TEXCOORD3.z = u_xlat1.z;
					    vs_TEXCOORD4.z = u_xlat1.x;
					    vs_TEXCOORD3.w = u_xlat0.y;
					    vs_TEXCOORD4.w = u_xlat0.z;
					    vs_TEXCOORD3.y = u_xlat3.y;
					    vs_TEXCOORD4.y = u_xlat3.z;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0[3];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_1_6[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_14[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					float u_xlat18;
					float u_xlat19;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
					    vs_TEXCOORD2.x = u_xlat1.z;
					    vs_TEXCOORD2.w = u_xlat0.x;
					    u_xlat18 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
					    u_xlat3.xyz = u_xlat2.yzx * u_xlat1.yzx + (-u_xlat3.xyz);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    vs_TEXCOORD2.y = u_xlat3.x;
					    vs_TEXCOORD2.z = u_xlat2.x;
					    vs_TEXCOORD3.x = u_xlat1.x;
					    vs_TEXCOORD4.x = u_xlat1.y;
					    vs_TEXCOORD3.w = u_xlat0.y;
					    vs_TEXCOORD3.y = u_xlat3.y;
					    vs_TEXCOORD4.y = u_xlat3.z;
					    vs_TEXCOORD3.z = u_xlat2.y;
					    vs_TEXCOORD4.w = u_xlat0.z;
					    vs_TEXCOORD4.z = u_xlat2.z;
					    u_xlat18 = u_xlat2.y * u_xlat2.y;
					    u_xlat18 = u_xlat2.x * u_xlat2.x + (-u_xlat18);
					    u_xlat1 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat1);
					    u_xlat3.y = dot(unity_SHBg, u_xlat1);
					    u_xlat3.z = dot(unity_SHBb, u_xlat1);
					    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat3.x = dot(unity_SHAr, u_xlat2);
					    u_xlat3.y = dot(unity_SHAg, u_xlat2);
					    u_xlat3.z = dot(unity_SHAb, u_xlat2);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
					    u_xlat4 = u_xlat2.yyyy * u_xlat3;
					    u_xlat3 = u_xlat3 * u_xlat3;
					    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
					    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
					    u_xlat4 = u_xlat5 * u_xlat2.xxxx + u_xlat4;
					    u_xlat2 = u_xlat0 * u_xlat2.zzzz + u_xlat4;
					    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
					    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
					    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat3 = inversesqrt(u_xlat0);
					    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    vs_TEXCOORD5.xyz = u_xlat1.xyz + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0[3];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_1_6[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_14[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_2[40];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					float u_xlat18;
					int u_xlati18;
					float u_xlat19;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlati18 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati18 + 1) / 4][(u_xlati18 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati18 / 4][u_xlati18 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati18 + 2) / 4][(u_xlati18 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati18 + 3) / 4][(u_xlati18 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
					    vs_TEXCOORD2.x = u_xlat1.z;
					    vs_TEXCOORD2.w = u_xlat0.x;
					    u_xlat18 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
					    u_xlat3.xyz = u_xlat2.yzx * u_xlat1.yzx + (-u_xlat3.xyz);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    vs_TEXCOORD2.y = u_xlat3.x;
					    vs_TEXCOORD2.z = u_xlat2.x;
					    vs_TEXCOORD3.x = u_xlat1.x;
					    vs_TEXCOORD4.x = u_xlat1.y;
					    vs_TEXCOORD3.w = u_xlat0.y;
					    vs_TEXCOORD3.y = u_xlat3.y;
					    vs_TEXCOORD4.y = u_xlat3.z;
					    vs_TEXCOORD3.z = u_xlat2.y;
					    vs_TEXCOORD4.w = u_xlat0.z;
					    vs_TEXCOORD4.z = u_xlat2.z;
					    u_xlat18 = u_xlat2.y * u_xlat2.y;
					    u_xlat18 = u_xlat2.x * u_xlat2.x + (-u_xlat18);
					    u_xlat1 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat1);
					    u_xlat3.y = dot(unity_SHBg, u_xlat1);
					    u_xlat3.z = dot(unity_SHBb, u_xlat1);
					    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat3.x = dot(unity_SHAr, u_xlat2);
					    u_xlat3.y = dot(unity_SHAg, u_xlat2);
					    u_xlat3.z = dot(unity_SHAb, u_xlat2);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
					    u_xlat4 = u_xlat2.yyyy * u_xlat3;
					    u_xlat3 = u_xlat3 * u_xlat3;
					    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
					    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
					    u_xlat4 = u_xlat5 * u_xlat2.xxxx + u_xlat4;
					    u_xlat2 = u_xlat0 * u_xlat2.zzzz + u_xlat4;
					    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
					    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
					    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat3 = inversesqrt(u_xlat0);
					    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    vs_TEXCOORD5.xyz = u_xlat1.xyz + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD6;
					out vec4 vs_TEXCOORD8;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.w = u_xlat0.x;
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat3.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat3.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx + (-u_xlat4.xyz);
					    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat4.xyz = u_xlat0.xxx * u_xlat4.xyz;
					    vs_TEXCOORD2.y = u_xlat4.x;
					    vs_TEXCOORD2.x = u_xlat3.z;
					    vs_TEXCOORD2.z = u_xlat2.y;
					    vs_TEXCOORD3.x = u_xlat3.x;
					    vs_TEXCOORD4.x = u_xlat3.y;
					    vs_TEXCOORD3.z = u_xlat2.z;
					    vs_TEXCOORD4.z = u_xlat2.x;
					    vs_TEXCOORD3.w = u_xlat0.y;
					    vs_TEXCOORD4.w = u_xlat0.z;
					    vs_TEXCOORD3.y = u_xlat4.y;
					    vs_TEXCOORD4.y = u_xlat4.z;
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat0.x * 0.5;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD6.zw = u_xlat1.zw;
					    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
					    vs_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_2[38];
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_3_4;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD6;
					out vec4 vs_TEXCOORD8;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					int u_xlati10;
					int u_xlati15;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlati15 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati15 + 1) / 4][(u_xlati15 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati15 / 4][u_xlati15 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati15 + 2) / 4][(u_xlati15 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_StereoMatrixVP[(u_xlati15 + 3) / 4][(u_xlati15 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.w = u_xlat0.x;
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat3.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat3.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx + (-u_xlat4.xyz);
					    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat4.xyz = u_xlat0.xxx * u_xlat4.xyz;
					    vs_TEXCOORD2.y = u_xlat4.x;
					    vs_TEXCOORD2.x = u_xlat3.z;
					    vs_TEXCOORD2.z = u_xlat2.y;
					    vs_TEXCOORD3.x = u_xlat3.x;
					    vs_TEXCOORD4.x = u_xlat3.y;
					    vs_TEXCOORD3.z = u_xlat2.z;
					    vs_TEXCOORD4.z = u_xlat2.x;
					    vs_TEXCOORD3.w = u_xlat0.y;
					    vs_TEXCOORD4.w = u_xlat0.z;
					    vs_TEXCOORD3.y = u_xlat4.y;
					    vs_TEXCOORD4.y = u_xlat4.z;
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat0.x * 0.5;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.zz + u_xlat0.xw;
					    u_xlati10 = unity_StereoEyeIndex;
					    u_xlat1.xy = u_xlat1.ww * unity_StereoScaleOffset[u_xlati10].zw;
					    vs_TEXCOORD6.xy = u_xlat0.xy * unity_StereoScaleOffset[u_xlati10].xy + u_xlat1.xy;
					    vs_TEXCOORD6.zw = u_xlat1.zw;
					    vs_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0[3];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_6[34];
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_11[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD6;
					out vec4 vs_TEXCOORD8;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					float u_xlat18;
					float u_xlat20;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat2.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
					    vs_TEXCOORD2.x = u_xlat2.z;
					    u_xlat18 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat3.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat3.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat20 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat20 = inversesqrt(u_xlat20);
					    u_xlat3 = vec4(u_xlat20) * u_xlat3.xyzz;
					    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.wxy;
					    u_xlat4.xyz = u_xlat3.ywx * u_xlat2.yzx + (-u_xlat4.xyz);
					    u_xlat4.xyz = vec3(u_xlat18) * u_xlat4.xyz;
					    vs_TEXCOORD2.y = u_xlat4.x;
					    vs_TEXCOORD2.w = u_xlat0.x;
					    vs_TEXCOORD2.z = u_xlat3.x;
					    vs_TEXCOORD3.x = u_xlat2.x;
					    vs_TEXCOORD4.x = u_xlat2.y;
					    vs_TEXCOORD3.y = u_xlat4.y;
					    vs_TEXCOORD4.y = u_xlat4.z;
					    vs_TEXCOORD3.w = u_xlat0.y;
					    vs_TEXCOORD3.z = u_xlat3.y;
					    vs_TEXCOORD4.w = u_xlat0.z;
					    vs_TEXCOORD4.z = u_xlat3.w;
					    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
					    u_xlat4 = (-u_xlat0.yyyy) + unity_4LightPosY0;
					    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
					    u_xlat5 = u_xlat3.yyyy * u_xlat4;
					    u_xlat4 = u_xlat4 * u_xlat4;
					    u_xlat4 = u_xlat2 * u_xlat2 + u_xlat4;
					    u_xlat2 = u_xlat2 * u_xlat3.xxxx + u_xlat5;
					    u_xlat2 = u_xlat0 * u_xlat3.wwzw + u_xlat2;
					    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat4;
					    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat4 = inversesqrt(u_xlat0);
					    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
					    u_xlat2 = u_xlat2 * u_xlat4;
					    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat18 = u_xlat3.y * u_xlat3.y;
					    u_xlat18 = u_xlat3.x * u_xlat3.x + (-u_xlat18);
					    u_xlat2 = u_xlat3.ywzx * u_xlat3;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat3.xyz;
					    vs_TEXCOORD5.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat0.x * 0.5;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD6.zw = u_xlat1.zw;
					    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
					    vs_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0[3];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_6[34];
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_11[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_4_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_4_2[38];
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_4_4;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD6;
					out vec4 vs_TEXCOORD8;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					int u_xlati12;
					float u_xlat18;
					int u_xlati18;
					float u_xlat20;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlati18 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati18 + 1) / 4][(u_xlati18 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati18 / 4][u_xlati18 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati18 + 2) / 4][(u_xlati18 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_StereoMatrixVP[(u_xlati18 + 3) / 4][(u_xlati18 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat2.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
					    vs_TEXCOORD2.x = u_xlat2.z;
					    u_xlat18 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat3.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat3.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat20 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat20 = inversesqrt(u_xlat20);
					    u_xlat3 = vec4(u_xlat20) * u_xlat3.xyzz;
					    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.wxy;
					    u_xlat4.xyz = u_xlat3.ywx * u_xlat2.yzx + (-u_xlat4.xyz);
					    u_xlat4.xyz = vec3(u_xlat18) * u_xlat4.xyz;
					    vs_TEXCOORD2.y = u_xlat4.x;
					    vs_TEXCOORD2.w = u_xlat0.x;
					    vs_TEXCOORD2.z = u_xlat3.x;
					    vs_TEXCOORD3.x = u_xlat2.x;
					    vs_TEXCOORD4.x = u_xlat2.y;
					    vs_TEXCOORD3.y = u_xlat4.y;
					    vs_TEXCOORD4.y = u_xlat4.z;
					    vs_TEXCOORD3.w = u_xlat0.y;
					    vs_TEXCOORD3.z = u_xlat3.y;
					    vs_TEXCOORD4.w = u_xlat0.z;
					    vs_TEXCOORD4.z = u_xlat3.w;
					    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
					    u_xlat4 = (-u_xlat0.yyyy) + unity_4LightPosY0;
					    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
					    u_xlat5 = u_xlat3.yyyy * u_xlat4;
					    u_xlat4 = u_xlat4 * u_xlat4;
					    u_xlat4 = u_xlat2 * u_xlat2 + u_xlat4;
					    u_xlat2 = u_xlat2 * u_xlat3.xxxx + u_xlat5;
					    u_xlat2 = u_xlat0 * u_xlat3.wwzw + u_xlat2;
					    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat4;
					    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat4 = inversesqrt(u_xlat0);
					    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
					    u_xlat2 = u_xlat2 * u_xlat4;
					    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat18 = u_xlat3.y * u_xlat3.y;
					    u_xlat18 = u_xlat3.x * u_xlat3.x + (-u_xlat18);
					    u_xlat2 = u_xlat3.ywzx * u_xlat3;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat3.xyz;
					    vs_TEXCOORD5.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat0.x * 0.5;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.zz + u_xlat0.xw;
					    u_xlati12 = unity_StereoEyeIndex;
					    u_xlat1.xy = u_xlat1.ww * unity_StereoScaleOffset[u_xlati12].zw;
					    vs_TEXCOORD6.xy = u_xlat0.xy * unity_StereoScaleOffset[u_xlati12].xy + u_xlat1.xy;
					    vs_TEXCOORD6.zw = u_xlat1.zw;
					    vs_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainColor;
						float _Albedo;
						float _Emission;
						vec4 _GlowColor;
						float _GlowPower;
						float _OcclusionPower;
						vec4 unused_0_9[3];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_2_3;
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat16;
					void main()
					{
					    u_xlat5.x = vs_TEXCOORD2.w;
					    u_xlat5.y = vs_TEXCOORD3.w;
					    u_xlat5.z = vs_TEXCOORD4.w;
					    u_xlat1.xyz = (-u_xlat5.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat1.yyy * vs_TEXCOORD3.xyz;
					    u_xlat1.xyw = vs_TEXCOORD2.xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = vs_TEXCOORD4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat10_2 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.xyz = u_xlat10_3.xyz * _MainColor.xyz;
					    u_xlat3.xyz = u_xlat10_3.xyz * vec3(_Albedo) + u_xlat4.xyz;
					    u_xlat2.xyz = u_xlat3.xyz * u_xlat10_2.xyz + (-u_xlat3.xyz);
					    u_xlat2.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat2.xyz + u_xlat3.xyz;
					    u_xlat3 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat3.x = u_xlat3.w * u_xlat3.x;
					    u_xlat3.xy = u_xlat3.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.x = dot(u_xlat3.xy, u_xlat3.xy);
					    u_xlat0.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat3.z = sqrt(u_xlat0.x);
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + _Emission;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _GlowPower;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * _GlowColor.xyz;
					    u_xlatb0 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb0){
					        u_xlatb0 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat4.xyz = vs_TEXCOORD3.www * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat4.xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat4.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat4.xyz : u_xlat5.xyz;
					        u_xlat0.xyz = u_xlat0.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat0.yzw = u_xlat0.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat5.x = u_xlat0.y * 0.25 + 0.75;
					        u_xlat16 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat0.x = max(u_xlat5.x, u_xlat16);
					        u_xlat0 = texture(unity_ProbeVolumeSH, u_xlat0.xzw);
					    } else {
					        u_xlat0.x = float(1.0);
					        u_xlat0.y = float(1.0);
					        u_xlat0.z = float(1.0);
					        u_xlat0.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat0.x = dot(u_xlat0, unity_OcclusionMaskSelector);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4.x = dot(vs_TEXCOORD2.xyz, u_xlat3.xyz);
					    u_xlat4.y = dot(vs_TEXCOORD3.xyz, u_xlat3.xyz);
					    u_xlat4.z = dot(vs_TEXCOORD4.xyz, u_xlat3.xyz);
					    u_xlat5.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat5.x = inversesqrt(u_xlat5.x);
					    u_xlat5.xyz = u_xlat5.xxx * u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat0.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat5.xyz = u_xlat2.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = u_xlat5.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainColor;
						float _Albedo;
						float _Emission;
						vec4 _GlowColor;
						float _GlowPower;
						float _OcclusionPower;
						vec4 unused_0_9[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_1_3;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					int u_xlati0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat16;
					void main()
					{
					    u_xlat5.x = vs_TEXCOORD2.w;
					    u_xlat5.y = vs_TEXCOORD3.w;
					    u_xlat5.z = vs_TEXCOORD4.w;
					    u_xlati0 = unity_StereoEyeIndex;
					    u_xlat1.xyz = (-u_xlat5.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati0].xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat1.yyy * vs_TEXCOORD3.xyz;
					    u_xlat1.xyw = vs_TEXCOORD2.xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = vs_TEXCOORD4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat10_2 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.xyz = u_xlat10_3.xyz * _MainColor.xyz;
					    u_xlat3.xyz = u_xlat10_3.xyz * vec3(_Albedo) + u_xlat4.xyz;
					    u_xlat2.xyz = u_xlat3.xyz * u_xlat10_2.xyz + (-u_xlat3.xyz);
					    u_xlat2.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat2.xyz + u_xlat3.xyz;
					    u_xlat3 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat3.x = u_xlat3.w * u_xlat3.x;
					    u_xlat3.xy = u_xlat3.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.x = dot(u_xlat3.xy, u_xlat3.xy);
					    u_xlat0.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat3.z = sqrt(u_xlat0.x);
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + _Emission;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _GlowPower;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * _GlowColor.xyz;
					    u_xlatb0 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb0){
					        u_xlatb0 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat4.xyz = vs_TEXCOORD3.www * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat4.xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat4.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat4.xyz : u_xlat5.xyz;
					        u_xlat0.xyz = u_xlat0.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat0.yzw = u_xlat0.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat5.x = u_xlat0.y * 0.25 + 0.75;
					        u_xlat16 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat0.x = max(u_xlat5.x, u_xlat16);
					        u_xlat0 = texture(unity_ProbeVolumeSH, u_xlat0.xzw);
					    } else {
					        u_xlat0.x = float(1.0);
					        u_xlat0.y = float(1.0);
					        u_xlat0.z = float(1.0);
					        u_xlat0.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat0.x = dot(u_xlat0, unity_OcclusionMaskSelector);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4.x = dot(vs_TEXCOORD2.xyz, u_xlat3.xyz);
					    u_xlat4.y = dot(vs_TEXCOORD3.xyz, u_xlat3.xyz);
					    u_xlat4.z = dot(vs_TEXCOORD4.xyz, u_xlat3.xyz);
					    u_xlat5.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat5.x = inversesqrt(u_xlat5.x);
					    u_xlat5.xyz = u_xlat5.xxx * u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat0.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat5.xyz = u_xlat2.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = u_xlat5.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainColor;
						float _Albedo;
						float _Emission;
						vec4 _GlowColor;
						float _GlowPower;
						float _OcclusionPower;
						vec4 unused_0_9[3];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_2_3;
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat1;
					bool u_xlatb1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat10;
					void main()
					{
					    u_xlat5.x = vs_TEXCOORD2.w;
					    u_xlat5.y = vs_TEXCOORD3.w;
					    u_xlat5.z = vs_TEXCOORD4.w;
					    u_xlat1.xyz = (-u_xlat5.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    u_xlat1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat1.yyy * vs_TEXCOORD3.xyz;
					    u_xlat1.xyw = vs_TEXCOORD2.xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = vs_TEXCOORD4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat10_2 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.xyz = u_xlat10_3.xyz * _MainColor.xyz;
					    u_xlat3.xyz = u_xlat10_3.xyz * vec3(_Albedo) + u_xlat4.xyz;
					    u_xlat2.xyz = u_xlat3.xyz * u_xlat10_2.xyz + (-u_xlat3.xyz);
					    u_xlat2.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat2.xyz + u_xlat3.xyz;
					    u_xlat3 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat3.x = u_xlat3.w * u_xlat3.x;
					    u_xlat3.xy = u_xlat3.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0 = dot(u_xlat3.xy, u_xlat3.xy);
					    u_xlat0 = min(u_xlat0, 1.0);
					    u_xlat0 = (-u_xlat0) + 1.0;
					    u_xlat3.z = sqrt(u_xlat0);
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    u_xlat1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat0 = (-u_xlat0) + _Emission;
					    u_xlat0 = log2(u_xlat0);
					    u_xlat0 = u_xlat0 * _GlowPower;
					    u_xlat0 = exp2(u_xlat0);
					    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb1){
					        u_xlatb1 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat6.xyz = vs_TEXCOORD3.www * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat6.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat6.xyz;
					        u_xlat6.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat6.xyz;
					        u_xlat6.xyz = u_xlat6.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat5.xyz = (bool(u_xlatb1)) ? u_xlat6.xyz : u_xlat5.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat1.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat5.x = u_xlat1.y * 0.25 + 0.75;
					        u_xlat10 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat1.x = max(u_xlat10, u_xlat5.x);
					        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
					    } else {
					        u_xlat1.x = float(1.0);
					        u_xlat1.y = float(1.0);
					        u_xlat1.z = float(1.0);
					        u_xlat1.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat5.x = dot(u_xlat1, unity_OcclusionMaskSelector);
					    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, u_xlat3.xyz);
					    u_xlat1.y = dot(vs_TEXCOORD3.xyz, u_xlat3.xyz);
					    u_xlat1.z = dot(vs_TEXCOORD4.xyz, u_xlat3.xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat5.xyz = u_xlat5.xxx * _LightColor0.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = u_xlat5.xyz * u_xlat2.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * vs_TEXCOORD5.xyz;
					    u_xlat5.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat6.xyz;
					    SV_Target0.xyz = _GlowColor.xyz * vec3(u_xlat0) + u_xlat5.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainColor;
						float _Albedo;
						float _Emission;
						vec4 _GlowColor;
						float _GlowPower;
						float _OcclusionPower;
						vec4 unused_0_9[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_1_3;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					bool u_xlatb1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat10;
					void main()
					{
					    u_xlat5.x = vs_TEXCOORD2.w;
					    u_xlat5.y = vs_TEXCOORD3.w;
					    u_xlat5.z = vs_TEXCOORD4.w;
					    u_xlati0 = unity_StereoEyeIndex;
					    u_xlat1.xyz = (-u_xlat5.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati0].xyz;
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    u_xlat1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat1.yyy * vs_TEXCOORD3.xyz;
					    u_xlat1.xyw = vs_TEXCOORD2.xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = vs_TEXCOORD4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat10_2 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.xyz = u_xlat10_3.xyz * _MainColor.xyz;
					    u_xlat3.xyz = u_xlat10_3.xyz * vec3(_Albedo) + u_xlat4.xyz;
					    u_xlat2.xyz = u_xlat3.xyz * u_xlat10_2.xyz + (-u_xlat3.xyz);
					    u_xlat2.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat2.xyz + u_xlat3.xyz;
					    u_xlat3 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat3.x = u_xlat3.w * u_xlat3.x;
					    u_xlat3.xy = u_xlat3.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0 = dot(u_xlat3.xy, u_xlat3.xy);
					    u_xlat0 = min(u_xlat0, 1.0);
					    u_xlat0 = (-u_xlat0) + 1.0;
					    u_xlat3.z = sqrt(u_xlat0);
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    u_xlat1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat0 = (-u_xlat0) + _Emission;
					    u_xlat0 = log2(u_xlat0);
					    u_xlat0 = u_xlat0 * _GlowPower;
					    u_xlat0 = exp2(u_xlat0);
					    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb1){
					        u_xlatb1 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat6.xyz = vs_TEXCOORD3.www * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat6.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat6.xyz;
					        u_xlat6.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat6.xyz;
					        u_xlat6.xyz = u_xlat6.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat5.xyz = (bool(u_xlatb1)) ? u_xlat6.xyz : u_xlat5.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat1.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat5.x = u_xlat1.y * 0.25 + 0.75;
					        u_xlat10 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat1.x = max(u_xlat10, u_xlat5.x);
					        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
					    } else {
					        u_xlat1.x = float(1.0);
					        u_xlat1.y = float(1.0);
					        u_xlat1.z = float(1.0);
					        u_xlat1.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat5.x = dot(u_xlat1, unity_OcclusionMaskSelector);
					    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, u_xlat3.xyz);
					    u_xlat1.y = dot(vs_TEXCOORD3.xyz, u_xlat3.xyz);
					    u_xlat1.z = dot(vs_TEXCOORD4.xyz, u_xlat3.xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat5.xyz = u_xlat5.xxx * _LightColor0.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = u_xlat5.xyz * u_xlat2.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * vs_TEXCOORD5.xyz;
					    u_xlat5.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat6.xyz;
					    SV_Target0.xyz = _GlowColor.xyz * vec3(u_xlat0) + u_xlat5.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainColor;
						float _Albedo;
						float _Emission;
						vec4 _GlowColor;
						float _GlowPower;
						float _OcclusionPower;
						vec4 unused_0_9[3];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_2_3;
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unity_ShadowFadeCenterAndType;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[9];
						mat4x4 unity_MatrixV;
						vec4 unused_4_2[10];
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec3 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat10_5;
					vec3 u_xlat6;
					bool u_xlatb7;
					vec2 u_xlat12;
					void main()
					{
					    u_xlat6.x = vs_TEXCOORD2.w;
					    u_xlat6.y = vs_TEXCOORD3.w;
					    u_xlat6.z = vs_TEXCOORD4.w;
					    u_xlat1.xyz = (-u_xlat6.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    u_xlat2.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat2.yyy * vs_TEXCOORD3.xyz;
					    u_xlat2.xyw = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat3.xyz;
					    u_xlat2.xyz = vs_TEXCOORD4.xyz * u_xlat2.zzz + u_xlat2.xyw;
					    u_xlat10_3 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat5.xyz = u_xlat10_4.xyz * _MainColor.xyz;
					    u_xlat4.xyz = u_xlat10_4.xyz * vec3(_Albedo) + u_xlat5.xyz;
					    u_xlat3.xyz = u_xlat4.xyz * u_xlat10_3.xyz + (-u_xlat4.xyz);
					    u_xlat3.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat3.xyz + u_xlat4.xyz;
					    u_xlat4 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat4.x = u_xlat4.w * u_xlat4.x;
					    u_xlat4.xy = u_xlat4.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0 = dot(u_xlat4.xy, u_xlat4.xy);
					    u_xlat0 = min(u_xlat0, 1.0);
					    u_xlat0 = (-u_xlat0) + 1.0;
					    u_xlat4.z = sqrt(u_xlat0);
					    u_xlat0 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    u_xlat2.xyz = vec3(u_xlat0) * u_xlat2.xyz;
					    u_xlat0 = dot(u_xlat2.xyz, u_xlat4.xyz);
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat0 = (-u_xlat0) + _Emission;
					    u_xlat0 = log2(u_xlat0);
					    u_xlat0 = u_xlat0 * _GlowPower;
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat2.xyz = vec3(u_xlat0) * _GlowColor.xyz;
					    u_xlat5.x = unity_MatrixV[0].z;
					    u_xlat5.y = unity_MatrixV[1].z;
					    u_xlat5.z = unity_MatrixV[2].z;
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat5.xyz);
					    u_xlat1.xyz = u_xlat6.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = (-u_xlat0) + u_xlat1.x;
					    u_xlat0 = unity_ShadowFadeCenterAndType.w * u_xlat1.x + u_xlat0;
					    u_xlat0 = u_xlat0 * _LightShadowData.z + _LightShadowData.w;
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb1){
					        u_xlatb7 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat5.xyz = vs_TEXCOORD3.www * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat5.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat5.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat6.xyz = (bool(u_xlatb7)) ? u_xlat5.xyz : u_xlat6.xyz;
					        u_xlat6.xyz = u_xlat6.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat5.yzw = u_xlat6.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat6.x = u_xlat5.y * 0.25 + 0.75;
					        u_xlat12.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat5.x = max(u_xlat12.x, u_xlat6.x);
					        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
					    } else {
					        u_xlat5.x = float(1.0);
					        u_xlat5.y = float(1.0);
					        u_xlat5.z = float(1.0);
					        u_xlat5.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat6.x = dot(u_xlat5, unity_OcclusionMaskSelector);
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					    u_xlat12.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
					    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat12.xy);
					    u_xlat0 = u_xlat0 + u_xlat10_5.x;
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat6.x = min(u_xlat0, u_xlat6.x);
					    u_xlat0 = (u_xlatb1) ? u_xlat6.x : u_xlat0;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, u_xlat4.xyz);
					    u_xlat1.y = dot(vs_TEXCOORD3.xyz, u_xlat4.xyz);
					    u_xlat1.z = dot(vs_TEXCOORD4.xyz, u_xlat4.xyz);
					    u_xlat6.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat6.x = inversesqrt(u_xlat6.x);
					    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
					    u_xlat1.xyz = vec3(u_xlat0) * _LightColor0.xyz;
					    u_xlat0 = dot(u_xlat6.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat0 = max(u_xlat0, 0.0);
					    u_xlat6.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = u_xlat6.xyz * vec3(u_xlat0) + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainColor;
						float _Albedo;
						float _Emission;
						vec4 _GlowColor;
						float _GlowPower;
						float _OcclusionPower;
						vec4 unused_0_9[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_1_3;
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_2_0[24];
						vec4 _LightShadowData;
						vec4 unity_ShadowFadeCenterAndType;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[8];
						mat4x4 unity_StereoMatrixV[2];
						vec4 unused_3_2[52];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_4[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					int u_xlati0;
					vec3 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat10_5;
					vec3 u_xlat6;
					bool u_xlatb7;
					vec2 u_xlat12;
					void main()
					{
					    u_xlat6.x = vs_TEXCOORD2.w;
					    u_xlat6.y = vs_TEXCOORD3.w;
					    u_xlat6.z = vs_TEXCOORD4.w;
					    u_xlati0 = unity_StereoEyeIndex;
					    u_xlat1.xyz = (-u_xlat6.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati0].xyz;
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    u_xlat2.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat2.yyy * vs_TEXCOORD3.xyz;
					    u_xlat2.xyw = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat3.xyz;
					    u_xlat2.xyz = vs_TEXCOORD4.xyz * u_xlat2.zzz + u_xlat2.xyw;
					    u_xlat10_3 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat5.xyz = u_xlat10_4.xyz * _MainColor.xyz;
					    u_xlat4.xyz = u_xlat10_4.xyz * vec3(_Albedo) + u_xlat5.xyz;
					    u_xlat3.xyz = u_xlat4.xyz * u_xlat10_3.xyz + (-u_xlat4.xyz);
					    u_xlat3.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat3.xyz + u_xlat4.xyz;
					    u_xlat4 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat4.x = u_xlat4.w * u_xlat4.x;
					    u_xlat4.xy = u_xlat4.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0 = dot(u_xlat4.xy, u_xlat4.xy);
					    u_xlat0 = min(u_xlat0, 1.0);
					    u_xlat0 = (-u_xlat0) + 1.0;
					    u_xlat4.z = sqrt(u_xlat0);
					    u_xlat0 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    u_xlat2.xyz = vec3(u_xlat0) * u_xlat2.xyz;
					    u_xlat0 = dot(u_xlat2.xyz, u_xlat4.xyz);
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat0 = (-u_xlat0) + _Emission;
					    u_xlat0 = log2(u_xlat0);
					    u_xlat0 = u_xlat0 * _GlowPower;
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat2.xyz = vec3(u_xlat0) * _GlowColor.xyz;
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat5.x = unity_StereoMatrixV[u_xlati0 / 4][u_xlati0 % 4].z;
					    u_xlat5.y = unity_StereoMatrixV[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4].z;
					    u_xlat5.z = unity_StereoMatrixV[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4].z;
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat5.xyz);
					    u_xlat1.xyz = u_xlat6.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = (-u_xlat0) + u_xlat1.x;
					    u_xlat0 = unity_ShadowFadeCenterAndType.w * u_xlat1.x + u_xlat0;
					    u_xlat0 = u_xlat0 * _LightShadowData.z + _LightShadowData.w;
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb1){
					        u_xlatb7 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat5.xyz = vs_TEXCOORD3.www * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat5.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat5.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat6.xyz = (bool(u_xlatb7)) ? u_xlat5.xyz : u_xlat6.xyz;
					        u_xlat6.xyz = u_xlat6.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat5.yzw = u_xlat6.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat6.x = u_xlat5.y * 0.25 + 0.75;
					        u_xlat12.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat5.x = max(u_xlat12.x, u_xlat6.x);
					        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
					    } else {
					        u_xlat5.x = float(1.0);
					        u_xlat5.y = float(1.0);
					        u_xlat5.z = float(1.0);
					        u_xlat5.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat6.x = dot(u_xlat5, unity_OcclusionMaskSelector);
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					    u_xlat12.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
					    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat12.xy);
					    u_xlat0 = u_xlat0 + u_xlat10_5.x;
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat6.x = min(u_xlat0, u_xlat6.x);
					    u_xlat0 = (u_xlatb1) ? u_xlat6.x : u_xlat0;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, u_xlat4.xyz);
					    u_xlat1.y = dot(vs_TEXCOORD3.xyz, u_xlat4.xyz);
					    u_xlat1.z = dot(vs_TEXCOORD4.xyz, u_xlat4.xyz);
					    u_xlat6.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat6.x = inversesqrt(u_xlat6.x);
					    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz;
					    u_xlat1.xyz = vec3(u_xlat0) * _LightColor0.xyz;
					    u_xlat0 = dot(u_xlat6.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat0 = max(u_xlat0, 0.0);
					    u_xlat6.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = u_xlat6.xyz * vec3(u_xlat0) + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainColor;
						float _Albedo;
						float _Emission;
						vec4 _GlowColor;
						float _GlowPower;
						float _OcclusionPower;
						vec4 unused_0_9[3];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unused_2_5[4];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_2_7;
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unity_ShadowFadeCenterAndType;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[9];
						mat4x4 unity_MatrixV;
						vec4 unused_4_2[10];
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec4 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					vec4 u_xlat10_5;
					vec4 u_xlat10_6;
					vec3 u_xlat7;
					vec3 u_xlat8;
					bool u_xlatb8;
					float u_xlat14;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat21;
					float u_xlat22;
					void main()
					{
					    u_xlat7.x = vs_TEXCOORD2.w;
					    u_xlat7.y = vs_TEXCOORD3.w;
					    u_xlat7.z = vs_TEXCOORD4.w;
					    u_xlat1.xyz = (-u_xlat7.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    u_xlat2.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat2.yyy * vs_TEXCOORD3.xyz;
					    u_xlat2.xyw = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat3.xyz;
					    u_xlat2.xyz = vs_TEXCOORD4.xyz * u_xlat2.zzz + u_xlat2.xyw;
					    u_xlat10_3 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat5.xyz = u_xlat10_4.xyz * _MainColor.xyz;
					    u_xlat4.xyz = u_xlat10_4.xyz * vec3(_Albedo) + u_xlat5.xyz;
					    u_xlat3.xyz = u_xlat4.xyz * u_xlat10_3.xyz + (-u_xlat4.xyz);
					    u_xlat3.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat3.xyz + u_xlat4.xyz;
					    u_xlat4 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat4.x = u_xlat4.w * u_xlat4.x;
					    u_xlat4.xy = u_xlat4.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0 = dot(u_xlat4.xy, u_xlat4.xy);
					    u_xlat0 = min(u_xlat0, 1.0);
					    u_xlat0 = (-u_xlat0) + 1.0;
					    u_xlat4.z = sqrt(u_xlat0);
					    u_xlat0 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    u_xlat2.xyz = vec3(u_xlat0) * u_xlat2.xyz;
					    u_xlat0 = dot(u_xlat2.xyz, u_xlat4.xyz);
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat0 = (-u_xlat0) + _Emission;
					    u_xlat0 = log2(u_xlat0);
					    u_xlat0 = u_xlat0 * _GlowPower;
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat2.x = unity_MatrixV[0].z;
					    u_xlat2.y = unity_MatrixV[1].z;
					    u_xlat2.z = unity_MatrixV[2].z;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat8.xyz = u_xlat7.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat8.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat8.x = sqrt(u_xlat8.x);
					    u_xlat8.x = (-u_xlat1.x) + u_xlat8.x;
					    u_xlat1.x = unity_ShadowFadeCenterAndType.w * u_xlat8.x + u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * _LightShadowData.z + _LightShadowData.w;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlatb8 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb8){
					        u_xlatb15 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat2.xyz = vs_TEXCOORD3.www * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat2.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat2.xyz;
					        u_xlat2.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat2.xyz;
					        u_xlat2.xyz = u_xlat2.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat2.xyz = (bool(u_xlatb15)) ? u_xlat2.xyz : u_xlat7.xyz;
					        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat15 = u_xlat2.y * 0.25 + 0.75;
					        u_xlat22 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat2.x = max(u_xlat22, u_xlat15);
					        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
					    } else {
					        u_xlat2.x = float(1.0);
					        u_xlat2.y = float(1.0);
					        u_xlat2.z = float(1.0);
					        u_xlat2.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat15 = dot(u_xlat2, unity_OcclusionMaskSelector);
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat2.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
					    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat2.xy);
					    u_xlat1.x = u_xlat1.x + u_xlat10_2.x;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat15 = min(u_xlat1.x, u_xlat15);
					    u_xlat1.x = (u_xlatb8) ? u_xlat15 : u_xlat1.x;
					    u_xlat2.x = dot(vs_TEXCOORD2.xyz, u_xlat4.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD3.xyz, u_xlat4.xyz);
					    u_xlat2.z = dot(vs_TEXCOORD4.xyz, u_xlat4.xyz);
					    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
					    u_xlat1.xzw = u_xlat1.xxx * _LightColor0.xyz;
					    if(u_xlatb8){
					        u_xlatb8 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat4.xyz = vs_TEXCOORD3.www * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat4.xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat4.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat7.xyz = (bool(u_xlatb8)) ? u_xlat4.xyz : u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat4.yzw = u_xlat7.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat7.x = u_xlat4.y * 0.25;
					        u_xlat14 = unity_ProbeVolumeParams.z * 0.5;
					        u_xlat21 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
					        u_xlat7.x = max(u_xlat14, u_xlat7.x);
					        u_xlat4.x = min(u_xlat21, u_xlat7.x);
					        u_xlat10_5 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
					        u_xlat7.xyz = u_xlat4.xzw + vec3(0.25, 0.0, 0.0);
					        u_xlat10_6 = texture(unity_ProbeVolumeSH, u_xlat7.xyz);
					        u_xlat7.xyz = u_xlat4.xzw + vec3(0.5, 0.0, 0.0);
					        u_xlat10_4 = texture(unity_ProbeVolumeSH, u_xlat7.xyz);
					        u_xlat2.w = 1.0;
					        u_xlat5.x = dot(u_xlat10_5, u_xlat2);
					        u_xlat5.y = dot(u_xlat10_6, u_xlat2);
					        u_xlat5.z = dot(u_xlat10_4, u_xlat2);
					    } else {
					        u_xlat2.w = 1.0;
					        u_xlat5.x = dot(unity_SHAr, u_xlat2);
					        u_xlat5.y = dot(unity_SHAg, u_xlat2);
					        u_xlat5.z = dot(unity_SHAb, u_xlat2);
					    //ENDIF
					    }
					    u_xlat7.xyz = u_xlat5.xyz + vs_TEXCOORD5.xyz;
					    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat8.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat1.xzw = u_xlat1.xzw * u_xlat3.xyz;
					    u_xlat7.xyz = u_xlat7.xyz * u_xlat3.xyz;
					    u_xlat7.xyz = u_xlat1.xzw * u_xlat8.xxx + u_xlat7.xyz;
					    SV_Target0.xyz = _GlowColor.xyz * vec3(u_xlat0) + u_xlat7.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainColor;
						float _Albedo;
						float _Emission;
						vec4 _GlowColor;
						float _GlowPower;
						float _OcclusionPower;
						vec4 unused_0_9[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unused_1_5[4];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_1_7;
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_2_0[24];
						vec4 _LightShadowData;
						vec4 unity_ShadowFadeCenterAndType;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[8];
						mat4x4 unity_StereoMatrixV[2];
						vec4 unused_3_2[52];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_4[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec4 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					vec4 u_xlat10_5;
					vec4 u_xlat10_6;
					vec3 u_xlat7;
					vec3 u_xlat8;
					bool u_xlatb8;
					float u_xlat14;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat21;
					float u_xlat22;
					int u_xlati22;
					void main()
					{
					    u_xlat7.x = vs_TEXCOORD2.w;
					    u_xlat7.y = vs_TEXCOORD3.w;
					    u_xlat7.z = vs_TEXCOORD4.w;
					    u_xlati0 = unity_StereoEyeIndex;
					    u_xlat1.xyz = (-u_xlat7.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati0].xyz;
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    u_xlat2.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat2.yyy * vs_TEXCOORD3.xyz;
					    u_xlat2.xyw = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat3.xyz;
					    u_xlat2.xyz = vs_TEXCOORD4.xyz * u_xlat2.zzz + u_xlat2.xyw;
					    u_xlat10_3 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat5.xyz = u_xlat10_4.xyz * _MainColor.xyz;
					    u_xlat4.xyz = u_xlat10_4.xyz * vec3(_Albedo) + u_xlat5.xyz;
					    u_xlat3.xyz = u_xlat4.xyz * u_xlat10_3.xyz + (-u_xlat4.xyz);
					    u_xlat3.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat3.xyz + u_xlat4.xyz;
					    u_xlat4 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat4.x = u_xlat4.w * u_xlat4.x;
					    u_xlat4.xy = u_xlat4.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0 = dot(u_xlat4.xy, u_xlat4.xy);
					    u_xlat0 = min(u_xlat0, 1.0);
					    u_xlat0 = (-u_xlat0) + 1.0;
					    u_xlat4.z = sqrt(u_xlat0);
					    u_xlat0 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    u_xlat2.xyz = vec3(u_xlat0) * u_xlat2.xyz;
					    u_xlat0 = dot(u_xlat2.xyz, u_xlat4.xyz);
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat0 = (-u_xlat0) + _Emission;
					    u_xlat0 = log2(u_xlat0);
					    u_xlat0 = u_xlat0 * _GlowPower;
					    u_xlat0 = exp2(u_xlat0);
					    u_xlati22 = unity_StereoEyeIndex << 2;
					    u_xlat2.x = unity_StereoMatrixV[u_xlati22 / 4][u_xlati22 % 4].z;
					    u_xlat2.y = unity_StereoMatrixV[(u_xlati22 + 1) / 4][(u_xlati22 + 1) % 4].z;
					    u_xlat2.z = unity_StereoMatrixV[(u_xlati22 + 2) / 4][(u_xlati22 + 2) % 4].z;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat8.xyz = u_xlat7.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat8.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat8.x = sqrt(u_xlat8.x);
					    u_xlat8.x = (-u_xlat1.x) + u_xlat8.x;
					    u_xlat1.x = unity_ShadowFadeCenterAndType.w * u_xlat8.x + u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * _LightShadowData.z + _LightShadowData.w;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlatb8 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb8){
					        u_xlatb15 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat2.xyz = vs_TEXCOORD3.www * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat2.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat2.xyz;
					        u_xlat2.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat2.xyz;
					        u_xlat2.xyz = u_xlat2.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat2.xyz = (bool(u_xlatb15)) ? u_xlat2.xyz : u_xlat7.xyz;
					        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat15 = u_xlat2.y * 0.25 + 0.75;
					        u_xlat22 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat2.x = max(u_xlat22, u_xlat15);
					        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
					    } else {
					        u_xlat2.x = float(1.0);
					        u_xlat2.y = float(1.0);
					        u_xlat2.z = float(1.0);
					        u_xlat2.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat15 = dot(u_xlat2, unity_OcclusionMaskSelector);
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat2.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
					    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat2.xy);
					    u_xlat1.x = u_xlat1.x + u_xlat10_2.x;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat15 = min(u_xlat1.x, u_xlat15);
					    u_xlat1.x = (u_xlatb8) ? u_xlat15 : u_xlat1.x;
					    u_xlat2.x = dot(vs_TEXCOORD2.xyz, u_xlat4.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD3.xyz, u_xlat4.xyz);
					    u_xlat2.z = dot(vs_TEXCOORD4.xyz, u_xlat4.xyz);
					    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
					    u_xlat1.xzw = u_xlat1.xxx * _LightColor0.xyz;
					    if(u_xlatb8){
					        u_xlatb8 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat4.xyz = vs_TEXCOORD3.www * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.www + u_xlat4.xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD4.www + u_xlat4.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat7.xyz = (bool(u_xlatb8)) ? u_xlat4.xyz : u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat4.yzw = u_xlat7.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat7.x = u_xlat4.y * 0.25;
					        u_xlat14 = unity_ProbeVolumeParams.z * 0.5;
					        u_xlat21 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
					        u_xlat7.x = max(u_xlat14, u_xlat7.x);
					        u_xlat4.x = min(u_xlat21, u_xlat7.x);
					        u_xlat10_5 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
					        u_xlat7.xyz = u_xlat4.xzw + vec3(0.25, 0.0, 0.0);
					        u_xlat10_6 = texture(unity_ProbeVolumeSH, u_xlat7.xyz);
					        u_xlat7.xyz = u_xlat4.xzw + vec3(0.5, 0.0, 0.0);
					        u_xlat10_4 = texture(unity_ProbeVolumeSH, u_xlat7.xyz);
					        u_xlat2.w = 1.0;
					        u_xlat5.x = dot(u_xlat10_5, u_xlat2);
					        u_xlat5.y = dot(u_xlat10_6, u_xlat2);
					        u_xlat5.z = dot(u_xlat10_4, u_xlat2);
					    } else {
					        u_xlat2.w = 1.0;
					        u_xlat5.x = dot(unity_SHAr, u_xlat2);
					        u_xlat5.y = dot(unity_SHAg, u_xlat2);
					        u_xlat5.z = dot(unity_SHAb, u_xlat2);
					    //ENDIF
					    }
					    u_xlat7.xyz = u_xlat5.xyz + vs_TEXCOORD5.xyz;
					    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat8.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat8.x = max(u_xlat8.x, 0.0);
					    u_xlat1.xzw = u_xlat1.xzw * u_xlat3.xyz;
					    u_xlat7.xyz = u_xlat7.xyz * u_xlat3.xyz;
					    u_xlat7.xyz = u_xlat1.xzw * u_xlat8.xxx + u_xlat7.xyz;
					    SV_Target0.xyz = _GlowColor.xyz * vec3(u_xlat0) + u_xlat7.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
		Pass {
			Name "FORWARD"
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend One One, One One
			ZWrite Off
			GpuProgramID 68378
			Program "vp" {
				SubProgram "d3d11 " {
					Keywords { "POINT" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[12];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD5.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
					    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    vs_TEXCOORD2.y = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat1.z;
					    vs_TEXCOORD2.z = u_xlat0.y;
					    vs_TEXCOORD3.x = u_xlat1.x;
					    vs_TEXCOORD4.x = u_xlat1.y;
					    vs_TEXCOORD3.z = u_xlat0.z;
					    vs_TEXCOORD4.z = u_xlat0.x;
					    vs_TEXCOORD3.y = u_xlat2.y;
					    vs_TEXCOORD4.y = u_xlat2.z;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[12];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[40];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD5.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
					    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    vs_TEXCOORD2.y = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat1.z;
					    vs_TEXCOORD2.z = u_xlat0.y;
					    vs_TEXCOORD3.x = u_xlat1.x;
					    vs_TEXCOORD4.x = u_xlat1.y;
					    vs_TEXCOORD3.z = u_xlat0.z;
					    vs_TEXCOORD4.z = u_xlat0.x;
					    vs_TEXCOORD3.y = u_xlat2.y;
					    vs_TEXCOORD4.y = u_xlat2.z;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD5.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
					    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    vs_TEXCOORD2.y = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat1.z;
					    vs_TEXCOORD2.z = u_xlat0.y;
					    vs_TEXCOORD3.x = u_xlat1.x;
					    vs_TEXCOORD4.x = u_xlat1.y;
					    vs_TEXCOORD3.z = u_xlat0.z;
					    vs_TEXCOORD4.z = u_xlat0.x;
					    vs_TEXCOORD3.y = u_xlat2.y;
					    vs_TEXCOORD4.y = u_xlat2.z;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[40];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD5.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
					    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    vs_TEXCOORD2.y = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat1.z;
					    vs_TEXCOORD2.z = u_xlat0.y;
					    vs_TEXCOORD3.x = u_xlat1.x;
					    vs_TEXCOORD4.x = u_xlat1.y;
					    vs_TEXCOORD3.z = u_xlat0.z;
					    vs_TEXCOORD4.z = u_xlat0.x;
					    vs_TEXCOORD3.y = u_xlat2.y;
					    vs_TEXCOORD4.y = u_xlat2.z;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[12];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD5.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
					    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    vs_TEXCOORD2.y = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat1.z;
					    vs_TEXCOORD2.z = u_xlat0.y;
					    vs_TEXCOORD3.x = u_xlat1.x;
					    vs_TEXCOORD4.x = u_xlat1.y;
					    vs_TEXCOORD3.z = u_xlat0.z;
					    vs_TEXCOORD4.z = u_xlat0.x;
					    vs_TEXCOORD3.y = u_xlat2.y;
					    vs_TEXCOORD4.y = u_xlat2.z;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[12];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[40];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD5.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
					    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    vs_TEXCOORD2.y = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat1.z;
					    vs_TEXCOORD2.z = u_xlat0.y;
					    vs_TEXCOORD3.x = u_xlat1.x;
					    vs_TEXCOORD4.x = u_xlat1.y;
					    vs_TEXCOORD3.z = u_xlat0.z;
					    vs_TEXCOORD4.z = u_xlat0.x;
					    vs_TEXCOORD3.y = u_xlat2.y;
					    vs_TEXCOORD4.y = u_xlat2.z;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[12];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD5.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
					    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    vs_TEXCOORD2.y = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat1.z;
					    vs_TEXCOORD2.z = u_xlat0.y;
					    vs_TEXCOORD3.x = u_xlat1.x;
					    vs_TEXCOORD4.x = u_xlat1.y;
					    vs_TEXCOORD3.z = u_xlat0.z;
					    vs_TEXCOORD4.z = u_xlat0.x;
					    vs_TEXCOORD3.y = u_xlat2.y;
					    vs_TEXCOORD4.y = u_xlat2.z;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[12];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[40];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD5.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
					    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    vs_TEXCOORD2.y = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat1.z;
					    vs_TEXCOORD2.z = u_xlat0.y;
					    vs_TEXCOORD3.x = u_xlat1.x;
					    vs_TEXCOORD4.x = u_xlat1.y;
					    vs_TEXCOORD3.z = u_xlat0.z;
					    vs_TEXCOORD4.z = u_xlat0.x;
					    vs_TEXCOORD3.y = u_xlat2.y;
					    vs_TEXCOORD4.y = u_xlat2.z;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[12];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD5.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
					    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    vs_TEXCOORD2.y = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat1.z;
					    vs_TEXCOORD2.z = u_xlat0.y;
					    vs_TEXCOORD3.x = u_xlat1.x;
					    vs_TEXCOORD4.x = u_xlat1.y;
					    vs_TEXCOORD3.z = u_xlat0.z;
					    vs_TEXCOORD4.z = u_xlat0.x;
					    vs_TEXCOORD3.y = u_xlat2.y;
					    vs_TEXCOORD4.y = u_xlat2.z;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[12];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[40];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD5.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
					    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    vs_TEXCOORD2.y = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat1.z;
					    vs_TEXCOORD2.z = u_xlat0.y;
					    vs_TEXCOORD3.x = u_xlat1.x;
					    vs_TEXCOORD4.x = u_xlat1.y;
					    vs_TEXCOORD3.z = u_xlat0.z;
					    vs_TEXCOORD4.z = u_xlat0.x;
					    vs_TEXCOORD3.y = u_xlat2.y;
					    vs_TEXCOORD4.y = u_xlat2.z;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					Keywords { "POINT" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						mat4x4 unity_WorldToLight;
						vec4 _MainColor;
						float _Albedo;
						vec4 unused_0_6;
						float _OcclusionPower;
						vec4 unused_0_8[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_1_3;
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler2D _LightTexture0;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat10_1 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = u_xlat10_2.xyz * _MainColor.xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_Albedo) + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat10_1.xyz + (-u_xlat2.xyz);
					    u_xlat1.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat2 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat2.x = u_xlat2.w * u_xlat2.x;
					    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat2.z = sqrt(u_xlat15);
					    u_xlat3.xyz = vs_TEXCOORD5.yyy * unity_WorldToLight[1].xyz;
					    u_xlat3.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + unity_WorldToLight[3].xyz;
					    u_xlatb15 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb15){
					        u_xlatb15 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat4.xyz = vs_TEXCOORD5.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat4.xyz = (bool(u_xlatb15)) ? u_xlat4.xyz : vs_TEXCOORD5.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat15 = u_xlat4.y * 0.25 + 0.75;
					        u_xlat16 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat4.x = max(u_xlat15, u_xlat16);
					        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
					    } else {
					        u_xlat4.x = float(1.0);
					        u_xlat4.y = float(1.0);
					        u_xlat4.z = float(1.0);
					        u_xlat4.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat15 = dot(u_xlat4, unity_OcclusionMaskSelector);
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat16 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat10_3 = texture(_LightTexture0, vec2(u_xlat16));
					    u_xlat15 = u_xlat15 * u_xlat10_3.x;
					    u_xlat3.x = dot(vs_TEXCOORD2.xyz, u_xlat2.xyz);
					    u_xlat3.y = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
					    u_xlat3.z = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat16 = inversesqrt(u_xlat16);
					    u_xlat2.xyz = vec3(u_xlat16) * u_xlat3.xyz;
					    u_xlat3.xyz = vec3(u_xlat15) * _LightColor0.xyz;
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat5.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						mat4x4 unity_WorldToLight;
						vec4 _MainColor;
						float _Albedo;
						vec4 unused_0_6;
						float _OcclusionPower;
						vec4 unused_0_8[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_1_3;
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler2D _LightTexture0;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat10_1 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = u_xlat10_2.xyz * _MainColor.xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_Albedo) + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat10_1.xyz + (-u_xlat2.xyz);
					    u_xlat1.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat2 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat2.x = u_xlat2.w * u_xlat2.x;
					    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat2.z = sqrt(u_xlat15);
					    u_xlat3.xyz = vs_TEXCOORD5.yyy * unity_WorldToLight[1].xyz;
					    u_xlat3.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + unity_WorldToLight[3].xyz;
					    u_xlatb15 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb15){
					        u_xlatb15 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat4.xyz = vs_TEXCOORD5.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat4.xyz = (bool(u_xlatb15)) ? u_xlat4.xyz : vs_TEXCOORD5.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat15 = u_xlat4.y * 0.25 + 0.75;
					        u_xlat16 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat4.x = max(u_xlat15, u_xlat16);
					        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
					    } else {
					        u_xlat4.x = float(1.0);
					        u_xlat4.y = float(1.0);
					        u_xlat4.z = float(1.0);
					        u_xlat4.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat15 = dot(u_xlat4, unity_OcclusionMaskSelector);
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat16 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat10_3 = texture(_LightTexture0, vec2(u_xlat16));
					    u_xlat15 = u_xlat15 * u_xlat10_3.x;
					    u_xlat3.x = dot(vs_TEXCOORD2.xyz, u_xlat2.xyz);
					    u_xlat3.y = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
					    u_xlat3.z = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat16 = inversesqrt(u_xlat16);
					    u_xlat2.xyz = vec3(u_xlat16) * u_xlat3.xyz;
					    u_xlat3.xyz = vec3(u_xlat15) * _LightColor0.xyz;
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat5.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainColor;
						float _Albedo;
						vec4 unused_0_5;
						float _OcclusionPower;
						vec4 unused_0_7[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_1_3;
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat10;
					void main()
					{
					    u_xlat10_0 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xyz = u_xlat10_1.xyz * _MainColor.xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_Albedo) + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat10_0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat1.x = u_xlat1.w * u_xlat1.x;
					    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat9 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat9 = min(u_xlat9, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat1.z = sqrt(u_xlat9);
					    u_xlatb9 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb9){
					        u_xlatb9 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat2.xyz = vs_TEXCOORD5.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat2.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat2.xyz;
					        u_xlat2.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat2.xyz;
					        u_xlat2.xyz = u_xlat2.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat2.xyz = (bool(u_xlatb9)) ? u_xlat2.xyz : vs_TEXCOORD5.xyz;
					        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat9 = u_xlat2.y * 0.25 + 0.75;
					        u_xlat10 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat2.x = max(u_xlat9, u_xlat10);
					        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
					    } else {
					        u_xlat2.x = float(1.0);
					        u_xlat2.y = float(1.0);
					        u_xlat2.z = float(1.0);
					        u_xlat2.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat9 = dot(u_xlat2, unity_OcclusionMaskSelector);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat2.x = dot(vs_TEXCOORD2.xyz, u_xlat1.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
					    u_xlat2.z = dot(vs_TEXCOORD4.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat2.xyz = vec3(u_xlat9) * _LightColor0.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat9 = max(u_xlat9, 0.0);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainColor;
						float _Albedo;
						vec4 unused_0_5;
						float _OcclusionPower;
						vec4 unused_0_7[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_1_3;
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat10;
					void main()
					{
					    u_xlat10_0 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xyz = u_xlat10_1.xyz * _MainColor.xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_Albedo) + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat10_0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat1.x = u_xlat1.w * u_xlat1.x;
					    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat9 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat9 = min(u_xlat9, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat1.z = sqrt(u_xlat9);
					    u_xlatb9 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb9){
					        u_xlatb9 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat2.xyz = vs_TEXCOORD5.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat2.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat2.xyz;
					        u_xlat2.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat2.xyz;
					        u_xlat2.xyz = u_xlat2.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat2.xyz = (bool(u_xlatb9)) ? u_xlat2.xyz : vs_TEXCOORD5.xyz;
					        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat9 = u_xlat2.y * 0.25 + 0.75;
					        u_xlat10 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat2.x = max(u_xlat9, u_xlat10);
					        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
					    } else {
					        u_xlat2.x = float(1.0);
					        u_xlat2.y = float(1.0);
					        u_xlat2.z = float(1.0);
					        u_xlat2.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat9 = dot(u_xlat2, unity_OcclusionMaskSelector);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat2.x = dot(vs_TEXCOORD2.xyz, u_xlat1.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
					    u_xlat2.z = dot(vs_TEXCOORD4.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat2.xyz = vec3(u_xlat9) * _LightColor0.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat9 = max(u_xlat9, 0.0);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						mat4x4 unity_WorldToLight;
						vec4 _MainColor;
						float _Albedo;
						vec4 unused_0_6;
						float _OcclusionPower;
						vec4 unused_0_8[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_1_3;
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					bool u_xlatb16;
					float u_xlat17;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat10_1 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = u_xlat10_2.xyz * _MainColor.xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_Albedo) + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat10_1.xyz + (-u_xlat2.xyz);
					    u_xlat1.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat2 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat2.x = u_xlat2.w * u_xlat2.x;
					    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat2.z = sqrt(u_xlat15);
					    u_xlat3 = vs_TEXCOORD5.yyyy * unity_WorldToLight[1];
					    u_xlat3 = unity_WorldToLight[0] * vs_TEXCOORD5.xxxx + u_xlat3;
					    u_xlat3 = unity_WorldToLight[2] * vs_TEXCOORD5.zzzz + u_xlat3;
					    u_xlat3 = u_xlat3 + unity_WorldToLight[3];
					    u_xlatb15 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb15){
					        u_xlatb15 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat4.xyz = vs_TEXCOORD5.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat4.xyz = (bool(u_xlatb15)) ? u_xlat4.xyz : vs_TEXCOORD5.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat15 = u_xlat4.y * 0.25 + 0.75;
					        u_xlat16 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat4.x = max(u_xlat15, u_xlat16);
					        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
					    } else {
					        u_xlat4.x = float(1.0);
					        u_xlat4.y = float(1.0);
					        u_xlat4.z = float(1.0);
					        u_xlat4.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat15 = dot(u_xlat4, unity_OcclusionMaskSelector);
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlatb16 = 0.0<u_xlat3.z;
					    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
					    u_xlat4.xy = u_xlat3.xy / u_xlat3.ww;
					    u_xlat4.xy = u_xlat4.xy + vec2(0.5, 0.5);
					    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xy);
					    u_xlat16 = u_xlat16 * u_xlat10_4.w;
					    u_xlat17 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat10_3 = texture(_LightTextureB0, vec2(u_xlat17));
					    u_xlat16 = u_xlat16 * u_xlat10_3.x;
					    u_xlat15 = u_xlat15 * u_xlat16;
					    u_xlat3.x = dot(vs_TEXCOORD2.xyz, u_xlat2.xyz);
					    u_xlat3.y = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
					    u_xlat3.z = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat16 = inversesqrt(u_xlat16);
					    u_xlat2.xyz = vec3(u_xlat16) * u_xlat3.xyz;
					    u_xlat3.xyz = vec3(u_xlat15) * _LightColor0.xyz;
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat5.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						mat4x4 unity_WorldToLight;
						vec4 _MainColor;
						float _Albedo;
						vec4 unused_0_6;
						float _OcclusionPower;
						vec4 unused_0_8[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_1_3;
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					bool u_xlatb16;
					float u_xlat17;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat10_1 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = u_xlat10_2.xyz * _MainColor.xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_Albedo) + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat10_1.xyz + (-u_xlat2.xyz);
					    u_xlat1.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat2 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat2.x = u_xlat2.w * u_xlat2.x;
					    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat2.z = sqrt(u_xlat15);
					    u_xlat3 = vs_TEXCOORD5.yyyy * unity_WorldToLight[1];
					    u_xlat3 = unity_WorldToLight[0] * vs_TEXCOORD5.xxxx + u_xlat3;
					    u_xlat3 = unity_WorldToLight[2] * vs_TEXCOORD5.zzzz + u_xlat3;
					    u_xlat3 = u_xlat3 + unity_WorldToLight[3];
					    u_xlatb15 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb15){
					        u_xlatb15 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat4.xyz = vs_TEXCOORD5.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat4.xyz = (bool(u_xlatb15)) ? u_xlat4.xyz : vs_TEXCOORD5.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat15 = u_xlat4.y * 0.25 + 0.75;
					        u_xlat16 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat4.x = max(u_xlat15, u_xlat16);
					        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
					    } else {
					        u_xlat4.x = float(1.0);
					        u_xlat4.y = float(1.0);
					        u_xlat4.z = float(1.0);
					        u_xlat4.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat15 = dot(u_xlat4, unity_OcclusionMaskSelector);
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlatb16 = 0.0<u_xlat3.z;
					    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
					    u_xlat4.xy = u_xlat3.xy / u_xlat3.ww;
					    u_xlat4.xy = u_xlat4.xy + vec2(0.5, 0.5);
					    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xy);
					    u_xlat16 = u_xlat16 * u_xlat10_4.w;
					    u_xlat17 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat10_3 = texture(_LightTextureB0, vec2(u_xlat17));
					    u_xlat16 = u_xlat16 * u_xlat10_3.x;
					    u_xlat15 = u_xlat15 * u_xlat16;
					    u_xlat3.x = dot(vs_TEXCOORD2.xyz, u_xlat2.xyz);
					    u_xlat3.y = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
					    u_xlat3.z = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat16 = inversesqrt(u_xlat16);
					    u_xlat2.xyz = vec3(u_xlat16) * u_xlat3.xyz;
					    u_xlat3.xyz = vec3(u_xlat15) * _LightColor0.xyz;
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat5.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						mat4x4 unity_WorldToLight;
						vec4 _MainColor;
						float _Albedo;
						vec4 unused_0_6;
						float _OcclusionPower;
						vec4 unused_0_8[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_1_3;
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					float u_xlat16_16;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat10_1 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = u_xlat10_2.xyz * _MainColor.xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_Albedo) + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat10_1.xyz + (-u_xlat2.xyz);
					    u_xlat1.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat2 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat2.x = u_xlat2.w * u_xlat2.x;
					    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat2.z = sqrt(u_xlat15);
					    u_xlat3.xyz = vs_TEXCOORD5.yyy * unity_WorldToLight[1].xyz;
					    u_xlat3.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + unity_WorldToLight[3].xyz;
					    u_xlatb15 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb15){
					        u_xlatb15 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat4.xyz = vs_TEXCOORD5.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat4.xyz = (bool(u_xlatb15)) ? u_xlat4.xyz : vs_TEXCOORD5.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat15 = u_xlat4.y * 0.25 + 0.75;
					        u_xlat16 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat4.x = max(u_xlat15, u_xlat16);
					        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
					    } else {
					        u_xlat4.x = float(1.0);
					        u_xlat4.y = float(1.0);
					        u_xlat4.z = float(1.0);
					        u_xlat4.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat15 = dot(u_xlat4, unity_OcclusionMaskSelector);
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat16 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat10_4 = texture(_LightTextureB0, vec2(u_xlat16));
					    u_xlat10_3 = texture(_LightTexture0, u_xlat3.xyz);
					    u_xlat16_16 = u_xlat10_3.w * u_xlat10_4.x;
					    u_xlat15 = u_xlat15 * u_xlat16_16;
					    u_xlat3.x = dot(vs_TEXCOORD2.xyz, u_xlat2.xyz);
					    u_xlat3.y = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
					    u_xlat3.z = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat16 = inversesqrt(u_xlat16);
					    u_xlat2.xyz = vec3(u_xlat16) * u_xlat3.xyz;
					    u_xlat3.xyz = vec3(u_xlat15) * _LightColor0.xyz;
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat5.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						mat4x4 unity_WorldToLight;
						vec4 _MainColor;
						float _Albedo;
						vec4 unused_0_6;
						float _OcclusionPower;
						vec4 unused_0_8[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_1_3;
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					float u_xlat16_16;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat10_1 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = u_xlat10_2.xyz * _MainColor.xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_Albedo) + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat10_1.xyz + (-u_xlat2.xyz);
					    u_xlat1.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat2 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat2.x = u_xlat2.w * u_xlat2.x;
					    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat2.z = sqrt(u_xlat15);
					    u_xlat3.xyz = vs_TEXCOORD5.yyy * unity_WorldToLight[1].xyz;
					    u_xlat3.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + unity_WorldToLight[3].xyz;
					    u_xlatb15 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb15){
					        u_xlatb15 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat4.xyz = vs_TEXCOORD5.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat4.xyz = (bool(u_xlatb15)) ? u_xlat4.xyz : vs_TEXCOORD5.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat15 = u_xlat4.y * 0.25 + 0.75;
					        u_xlat16 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat4.x = max(u_xlat15, u_xlat16);
					        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
					    } else {
					        u_xlat4.x = float(1.0);
					        u_xlat4.y = float(1.0);
					        u_xlat4.z = float(1.0);
					        u_xlat4.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat15 = dot(u_xlat4, unity_OcclusionMaskSelector);
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat16 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat10_4 = texture(_LightTextureB0, vec2(u_xlat16));
					    u_xlat10_3 = texture(_LightTexture0, u_xlat3.xyz);
					    u_xlat16_16 = u_xlat10_3.w * u_xlat10_4.x;
					    u_xlat15 = u_xlat15 * u_xlat16_16;
					    u_xlat3.x = dot(vs_TEXCOORD2.xyz, u_xlat2.xyz);
					    u_xlat3.y = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
					    u_xlat3.z = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat16 = inversesqrt(u_xlat16);
					    u_xlat2.xyz = vec3(u_xlat16) * u_xlat3.xyz;
					    u_xlat3.xyz = vec3(u_xlat15) * _LightColor0.xyz;
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat5.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						mat4x4 unity_WorldToLight;
						vec4 _MainColor;
						float _Albedo;
						vec4 unused_0_6;
						float _OcclusionPower;
						vec4 unused_0_8[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_1_3;
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler2D _LightTexture0;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					void main()
					{
					    u_xlat10_0 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xyz = u_xlat10_1.xyz * _MainColor.xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_Albedo) + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat10_0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat1.x = u_xlat1.w * u_xlat1.x;
					    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat12 = min(u_xlat12, 1.0);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat1.z = sqrt(u_xlat12);
					    u_xlat2.xy = vs_TEXCOORD5.yy * unity_WorldToLight[1].xy;
					    u_xlat2.xy = unity_WorldToLight[0].xy * vs_TEXCOORD5.xx + u_xlat2.xy;
					    u_xlat2.xy = unity_WorldToLight[2].xy * vs_TEXCOORD5.zz + u_xlat2.xy;
					    u_xlat2.xy = u_xlat2.xy + unity_WorldToLight[3].xy;
					    u_xlatb12 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb12){
					        u_xlatb12 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat3.xyz = vs_TEXCOORD5.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat3.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat3.xyz;
					        u_xlat3.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat3.xyz;
					        u_xlat3.xyz = u_xlat3.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat3.xyz = (bool(u_xlatb12)) ? u_xlat3.xyz : vs_TEXCOORD5.xyz;
					        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat12 = u_xlat3.y * 0.25 + 0.75;
					        u_xlat13 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat3.x = max(u_xlat12, u_xlat13);
					        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
					    } else {
					        u_xlat3.x = float(1.0);
					        u_xlat3.y = float(1.0);
					        u_xlat3.z = float(1.0);
					        u_xlat3.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat12 = dot(u_xlat3, unity_OcclusionMaskSelector);
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat10_2 = texture(_LightTexture0, u_xlat2.xy);
					    u_xlat12 = u_xlat12 * u_xlat10_2.w;
					    u_xlat2.x = dot(vs_TEXCOORD2.xyz, u_xlat1.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
					    u_xlat2.z = dot(vs_TEXCOORD4.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat2.xyz = vec3(u_xlat12) * _LightColor0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						mat4x4 unity_WorldToLight;
						vec4 _MainColor;
						float _Albedo;
						vec4 unused_0_6;
						float _OcclusionPower;
						vec4 unused_0_8[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_1_3;
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler2D _LightTexture0;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					void main()
					{
					    u_xlat10_0 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xyz = u_xlat10_1.xyz * _MainColor.xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_Albedo) + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat10_0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat1.x = u_xlat1.w * u_xlat1.x;
					    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat12 = min(u_xlat12, 1.0);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat1.z = sqrt(u_xlat12);
					    u_xlat2.xy = vs_TEXCOORD5.yy * unity_WorldToLight[1].xy;
					    u_xlat2.xy = unity_WorldToLight[0].xy * vs_TEXCOORD5.xx + u_xlat2.xy;
					    u_xlat2.xy = unity_WorldToLight[2].xy * vs_TEXCOORD5.zz + u_xlat2.xy;
					    u_xlat2.xy = u_xlat2.xy + unity_WorldToLight[3].xy;
					    u_xlatb12 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb12){
					        u_xlatb12 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat3.xyz = vs_TEXCOORD5.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat3.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD5.xxx + u_xlat3.xyz;
					        u_xlat3.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD5.zzz + u_xlat3.xyz;
					        u_xlat3.xyz = u_xlat3.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat3.xyz = (bool(u_xlatb12)) ? u_xlat3.xyz : vs_TEXCOORD5.xyz;
					        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat12 = u_xlat3.y * 0.25 + 0.75;
					        u_xlat13 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat3.x = max(u_xlat12, u_xlat13);
					        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
					    } else {
					        u_xlat3.x = float(1.0);
					        u_xlat3.y = float(1.0);
					        u_xlat3.z = float(1.0);
					        u_xlat3.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat12 = dot(u_xlat3, unity_OcclusionMaskSelector);
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat10_2 = texture(_LightTexture0, u_xlat2.xy);
					    u_xlat12 = u_xlat12 * u_xlat10_2.w;
					    u_xlat2.x = dot(vs_TEXCOORD2.xyz, u_xlat1.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
					    u_xlat2.z = dot(vs_TEXCOORD4.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat2.xyz = vec3(u_xlat12) * _LightColor0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
		Pass {
			Name "PREPASS"
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "PREPASSBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			GpuProgramID 141656
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _BumpMap_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.w = u_xlat0.x;
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat2.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
					    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    vs_TEXCOORD1.y = u_xlat3.x;
					    vs_TEXCOORD1.x = u_xlat2.z;
					    vs_TEXCOORD1.z = u_xlat1.y;
					    vs_TEXCOORD2.x = u_xlat2.x;
					    vs_TEXCOORD3.x = u_xlat2.y;
					    vs_TEXCOORD2.z = u_xlat1.z;
					    vs_TEXCOORD3.z = u_xlat1.x;
					    vs_TEXCOORD2.w = u_xlat0.y;
					    vs_TEXCOORD3.w = u_xlat0.z;
					    vs_TEXCOORD2.y = u_xlat3.y;
					    vs_TEXCOORD3.y = u_xlat3.z;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _BumpMap_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[40];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					int u_xlati12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlati12 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati12 + 1) / 4][(u_xlati12 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati12 / 4][u_xlati12 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati12 + 2) / 4][(u_xlati12 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati12 + 3) / 4][(u_xlati12 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.w = u_xlat0.x;
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat2.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
					    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    vs_TEXCOORD1.y = u_xlat3.x;
					    vs_TEXCOORD1.x = u_xlat2.z;
					    vs_TEXCOORD1.z = u_xlat1.y;
					    vs_TEXCOORD2.x = u_xlat2.x;
					    vs_TEXCOORD3.x = u_xlat2.y;
					    vs_TEXCOORD2.z = u_xlat1.z;
					    vs_TEXCOORD3.z = u_xlat1.x;
					    vs_TEXCOORD2.w = u_xlat0.y;
					    vs_TEXCOORD3.w = u_xlat0.z;
					    vs_TEXCOORD2.y = u_xlat3.y;
					    vs_TEXCOORD3.y = u_xlat3.z;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					uniform  sampler2D _BumpMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = texture(_BumpMap, vs_TEXCOORD0.xy);
					    u_xlat0.x = u_xlat0.w * u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat6 = min(u_xlat6, 1.0);
					    u_xlat6 = (-u_xlat6) + 1.0;
					    u_xlat0.z = sqrt(u_xlat6);
					    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
					    u_xlat1.y = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat1.z = dot(vs_TEXCOORD3.xyz, u_xlat0.xyz);
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					uniform  sampler2D _BumpMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = texture(_BumpMap, vs_TEXCOORD0.xy);
					    u_xlat0.x = u_xlat0.w * u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat6 = min(u_xlat6, 1.0);
					    u_xlat6 = (-u_xlat6) + 1.0;
					    u_xlat0.z = sqrt(u_xlat6);
					    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
					    u_xlat1.y = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat1.z = dot(vs_TEXCOORD3.xyz, u_xlat0.xyz);
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
			}
		}
		Pass {
			Name "PREPASS"
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "PREPASSFINAL" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			ZWrite Off
			GpuProgramID 221307
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
						vec4 unused_0_4;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0[39];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_8[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat15;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
					    vs_TEXCOORD3.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat3.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat3.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.yzx * u_xlat3.zxy;
					    u_xlat2.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
					    u_xlat15 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
					    vs_TEXCOORD3.y = dot(u_xlat0.xyz, u_xlat2.xyz);
					    vs_TEXCOORD3.z = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat0.x * 0.5;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD4.zw = u_xlat1.zw;
					    vs_TEXCOORD4.xy = u_xlat0.zz + u_xlat0.xw;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = u_xlat3.y * u_xlat3.y;
					    u_xlat0.x = u_xlat3.x * u_xlat3.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat3.yzzx * u_xlat3.xyzz;
					    u_xlat2.x = dot(unity_SHBr, u_xlat1);
					    u_xlat2.y = dot(unity_SHBg, u_xlat1);
					    u_xlat2.z = dot(unity_SHBb, u_xlat1);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat3.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat3);
					    u_xlat1.y = dot(unity_SHAg, u_xlat3);
					    u_xlat1.z = dot(unity_SHAb, u_xlat3);
					    vs_TEXCOORD6.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
						vec4 unused_0_4;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0[39];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_8[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_4_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_4_2[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_4_4;
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_4_6;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat15;
					int u_xlati15;
					float u_xlat17;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlati15 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati15 + 1) / 4][(u_xlati15 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati15 / 4][u_xlati15 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati15 + 2) / 4][(u_xlati15 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_StereoMatrixVP[(u_xlati15 + 3) / 4][(u_xlati15 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
					    u_xlati15 = unity_StereoEyeIndex;
					    u_xlat0.xyz = (-u_xlat0.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati15].xyz;
					    vs_TEXCOORD3.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat3.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat3.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat17 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat17 = inversesqrt(u_xlat17);
					    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.yzx * u_xlat3.zxy;
					    u_xlat2.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
					    u_xlat17 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat17) * u_xlat2.xyz;
					    vs_TEXCOORD3.y = dot(u_xlat0.xyz, u_xlat2.xyz);
					    vs_TEXCOORD3.z = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat0.x * 0.5;
					    u_xlat2.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat1.xy = u_xlat1.ww * unity_StereoScaleOffset[u_xlati15].zw;
					    vs_TEXCOORD4.xy = u_xlat0.xy * unity_StereoScaleOffset[u_xlati15].xy + u_xlat1.xy;
					    vs_TEXCOORD4.zw = u_xlat1.zw;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = u_xlat3.y * u_xlat3.y;
					    u_xlat0.x = u_xlat3.x * u_xlat3.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat3.yzzx * u_xlat3.xyzz;
					    u_xlat2.x = dot(unity_SHBr, u_xlat1);
					    u_xlat2.y = dot(unity_SHBg, u_xlat1);
					    u_xlat2.z = dot(unity_SHBb, u_xlat1);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat3.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat3);
					    u_xlat1.y = dot(unity_SHAg, u_xlat3);
					    u_xlat1.z = dot(unity_SHAb, u_xlat3);
					    vs_TEXCOORD6.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
						vec4 unused_0_4;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0[39];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_8[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat15;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
					    vs_TEXCOORD3.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat3.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat3.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.yzx * u_xlat3.zxy;
					    u_xlat2.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
					    u_xlat15 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
					    vs_TEXCOORD3.y = dot(u_xlat0.xyz, u_xlat2.xyz);
					    vs_TEXCOORD3.z = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat0.x * 0.5;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD4.zw = u_xlat1.zw;
					    vs_TEXCOORD4.xy = u_xlat0.zz + u_xlat0.xw;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = u_xlat3.y * u_xlat3.y;
					    u_xlat0.x = u_xlat3.x * u_xlat3.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat3.yzzx * u_xlat3.xyzz;
					    u_xlat2.x = dot(unity_SHBr, u_xlat1);
					    u_xlat2.y = dot(unity_SHBg, u_xlat1);
					    u_xlat2.z = dot(unity_SHBb, u_xlat1);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat3.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat3);
					    u_xlat1.y = dot(unity_SHAg, u_xlat3);
					    u_xlat1.z = dot(unity_SHAb, u_xlat3);
					    vs_TEXCOORD6.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
						vec4 unused_0_4;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0[39];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_8[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_4_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_4_2[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_4_4;
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_4_6;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat15;
					int u_xlati15;
					float u_xlat17;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlati15 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati15 + 1) / 4][(u_xlati15 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati15 / 4][u_xlati15 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati15 + 2) / 4][(u_xlati15 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_StereoMatrixVP[(u_xlati15 + 3) / 4][(u_xlati15 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
					    u_xlati15 = unity_StereoEyeIndex;
					    u_xlat0.xyz = (-u_xlat0.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati15].xyz;
					    vs_TEXCOORD3.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat3.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat3.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat17 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat17 = inversesqrt(u_xlat17);
					    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.yzx * u_xlat3.zxy;
					    u_xlat2.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
					    u_xlat17 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat17) * u_xlat2.xyz;
					    vs_TEXCOORD3.y = dot(u_xlat0.xyz, u_xlat2.xyz);
					    vs_TEXCOORD3.z = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat0.x * 0.5;
					    u_xlat2.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat1.xy = u_xlat1.ww * unity_StereoScaleOffset[u_xlati15].zw;
					    vs_TEXCOORD4.xy = u_xlat0.xy * unity_StereoScaleOffset[u_xlati15].xy + u_xlat1.xy;
					    vs_TEXCOORD4.zw = u_xlat1.zw;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = u_xlat3.y * u_xlat3.y;
					    u_xlat0.x = u_xlat3.x * u_xlat3.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat3.yzzx * u_xlat3.xyzz;
					    u_xlat2.x = dot(unity_SHBr, u_xlat1);
					    u_xlat2.y = dot(unity_SHBg, u_xlat1);
					    u_xlat2.z = dot(unity_SHBb, u_xlat1);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat3.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat3);
					    u_xlat1.y = dot(unity_SHAg, u_xlat3);
					    u_xlat1.z = dot(unity_SHAb, u_xlat3);
					    vs_TEXCOORD6.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
						vec4 unused_0_4;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0[39];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_8[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat15;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
					    vs_TEXCOORD3.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat3.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat3.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.yzx * u_xlat3.zxy;
					    u_xlat2.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
					    u_xlat15 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
					    vs_TEXCOORD3.y = dot(u_xlat0.xyz, u_xlat2.xyz);
					    vs_TEXCOORD3.z = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat0.x * 0.5;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD4.zw = u_xlat1.zw;
					    vs_TEXCOORD4.xy = u_xlat0.zz + u_xlat0.xw;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = u_xlat3.y * u_xlat3.y;
					    u_xlat0.x = u_xlat3.x * u_xlat3.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat3.yzzx * u_xlat3.xyzz;
					    u_xlat2.x = dot(unity_SHBr, u_xlat1);
					    u_xlat2.y = dot(unity_SHBg, u_xlat1);
					    u_xlat2.z = dot(unity_SHBb, u_xlat1);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat3.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat3);
					    u_xlat1.y = dot(unity_SHAg, u_xlat3);
					    u_xlat1.z = dot(unity_SHAb, u_xlat3);
					    vs_TEXCOORD6.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
						vec4 unused_0_4;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0[39];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_8[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_4_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_4_2[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_4_4;
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_4_6;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat15;
					int u_xlati15;
					float u_xlat17;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlati15 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati15 + 1) / 4][(u_xlati15 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati15 / 4][u_xlati15 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati15 + 2) / 4][(u_xlati15 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_StereoMatrixVP[(u_xlati15 + 3) / 4][(u_xlati15 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
					    u_xlati15 = unity_StereoEyeIndex;
					    u_xlat0.xyz = (-u_xlat0.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati15].xyz;
					    vs_TEXCOORD3.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat3.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat3.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat17 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat17 = inversesqrt(u_xlat17);
					    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.yzx * u_xlat3.zxy;
					    u_xlat2.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
					    u_xlat17 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat17) * u_xlat2.xyz;
					    vs_TEXCOORD3.y = dot(u_xlat0.xyz, u_xlat2.xyz);
					    vs_TEXCOORD3.z = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat0.x * 0.5;
					    u_xlat2.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat1.xy = u_xlat1.ww * unity_StereoScaleOffset[u_xlati15].zw;
					    vs_TEXCOORD4.xy = u_xlat0.xy * unity_StereoScaleOffset[u_xlati15].xy + u_xlat1.xy;
					    vs_TEXCOORD4.zw = u_xlat1.zw;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = u_xlat3.y * u_xlat3.y;
					    u_xlat0.x = u_xlat3.x * u_xlat3.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat3.yzzx * u_xlat3.xyzz;
					    u_xlat2.x = dot(unity_SHBr, u_xlat1);
					    u_xlat2.y = dot(unity_SHBg, u_xlat1);
					    u_xlat2.z = dot(unity_SHBb, u_xlat1);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat3.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat3);
					    u_xlat1.y = dot(unity_SHAg, u_xlat3);
					    u_xlat1.z = dot(unity_SHAb, u_xlat3);
					    vs_TEXCOORD6.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _MainColor;
						float _Albedo;
						float _Emission;
						vec4 _GlowColor;
						float _GlowPower;
						float _OcclusionPower;
						vec4 unused_0_7[4];
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler2D _LightBuffer;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat0.x = u_xlat0.w * u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat12 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat12 = min(u_xlat12, 1.0);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat0.z = sqrt(u_xlat12);
					    u_xlat12 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * vs_TEXCOORD3.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + _Emission;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _GlowPower;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * _GlowColor.xyz;
					    u_xlat10_1 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = u_xlat10_2.xyz * _MainColor.xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_Albedo) + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat10_1.xyz + (-u_xlat2.xyz);
					    u_xlat1.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat2.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
					    u_xlat10_2 = texture(_LightBuffer, u_xlat2.xy);
					    u_xlat16_2.xyz = log2(u_xlat10_2.xyz);
					    u_xlat2.xyz = (-u_xlat16_2.xyz) + vs_TEXCOORD6.xyz;
					    SV_Target0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _MainColor;
						float _Albedo;
						float _Emission;
						vec4 _GlowColor;
						float _GlowPower;
						float _OcclusionPower;
						vec4 unused_0_7[4];
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler2D _LightBuffer;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat0.x = u_xlat0.w * u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat12 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat12 = min(u_xlat12, 1.0);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat0.z = sqrt(u_xlat12);
					    u_xlat12 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * vs_TEXCOORD3.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + _Emission;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _GlowPower;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * _GlowColor.xyz;
					    u_xlat10_1 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = u_xlat10_2.xyz * _MainColor.xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_Albedo) + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat10_1.xyz + (-u_xlat2.xyz);
					    u_xlat1.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat2.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
					    u_xlat10_2 = texture(_LightBuffer, u_xlat2.xy);
					    u_xlat16_2.xyz = log2(u_xlat10_2.xyz);
					    u_xlat2.xyz = (-u_xlat16_2.xyz) + vs_TEXCOORD6.xyz;
					    SV_Target0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _MainColor;
						float _Albedo;
						float _Emission;
						vec4 _GlowColor;
						float _GlowPower;
						float _OcclusionPower;
						vec4 unused_0_7[4];
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler2D _LightBuffer;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat0.x = u_xlat0.w * u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat12 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat12 = min(u_xlat12, 1.0);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat0.z = sqrt(u_xlat12);
					    u_xlat12 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * vs_TEXCOORD3.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + _Emission;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _GlowPower;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * _GlowColor.xyz;
					    u_xlat10_1 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = u_xlat10_2.xyz * _MainColor.xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_Albedo) + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat10_1.xyz + (-u_xlat2.xyz);
					    u_xlat1.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat2.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
					    u_xlat10_2 = texture(_LightBuffer, u_xlat2.xy);
					    u_xlat16_2.xyz = log2(u_xlat10_2.xyz);
					    u_xlat2.xyz = (-u_xlat16_2.xyz) + vs_TEXCOORD6.xyz;
					    SV_Target0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _MainColor;
						float _Albedo;
						float _Emission;
						vec4 _GlowColor;
						float _GlowPower;
						float _OcclusionPower;
						vec4 unused_0_7[4];
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler2D _LightBuffer;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat0.x = u_xlat0.w * u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat12 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat12 = min(u_xlat12, 1.0);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat0.z = sqrt(u_xlat12);
					    u_xlat12 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * vs_TEXCOORD3.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + _Emission;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _GlowPower;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * _GlowColor.xyz;
					    u_xlat10_1 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = u_xlat10_2.xyz * _MainColor.xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_Albedo) + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat10_1.xyz + (-u_xlat2.xyz);
					    u_xlat1.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat2.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
					    u_xlat10_2 = texture(_LightBuffer, u_xlat2.xy);
					    u_xlat16_2.xyz = log2(u_xlat10_2.xyz);
					    u_xlat2.xyz = (-u_xlat16_2.xyz) + vs_TEXCOORD6.xyz;
					    SV_Target0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _MainColor;
						float _Albedo;
						float _Emission;
						vec4 _GlowColor;
						float _GlowPower;
						float _OcclusionPower;
						vec4 unused_0_7[4];
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler2D _LightBuffer;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat0.x = u_xlat0.w * u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat12 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat12 = min(u_xlat12, 1.0);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat0.z = sqrt(u_xlat12);
					    u_xlat12 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * vs_TEXCOORD3.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + _Emission;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _GlowPower;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * _GlowColor.xyz;
					    u_xlat10_1 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = u_xlat10_2.xyz * _MainColor.xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_Albedo) + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat10_1.xyz + (-u_xlat2.xyz);
					    u_xlat1.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat2.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
					    u_xlat10_2 = texture(_LightBuffer, u_xlat2.xy);
					    u_xlat2.xyz = u_xlat10_2.xyz + vs_TEXCOORD6.xyz;
					    SV_Target0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _MainColor;
						float _Albedo;
						float _Emission;
						vec4 _GlowColor;
						float _GlowPower;
						float _OcclusionPower;
						vec4 unused_0_7[4];
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler2D _LightBuffer;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat0.x = u_xlat0.w * u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat12 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat12 = min(u_xlat12, 1.0);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat0.z = sqrt(u_xlat12);
					    u_xlat12 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * vs_TEXCOORD3.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + _Emission;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _GlowPower;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * _GlowColor.xyz;
					    u_xlat10_1 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = u_xlat10_2.xyz * _MainColor.xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_Albedo) + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat10_1.xyz + (-u_xlat2.xyz);
					    u_xlat1.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat2.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
					    u_xlat10_2 = texture(_LightBuffer, u_xlat2.xy);
					    u_xlat2.xyz = u_xlat10_2.xyz + vs_TEXCOORD6.xyz;
					    SV_Target0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
		Pass {
			Name "DEFERRED"
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "DEFERRED" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			GpuProgramID 265669
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
						vec4 unused_0_4;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.w = u_xlat0.x;
					    u_xlat12 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    vs_TEXCOORD2.y = u_xlat3.x;
					    vs_TEXCOORD2.x = u_xlat2.x;
					    vs_TEXCOORD2.z = u_xlat1.x;
					    vs_TEXCOORD3.x = u_xlat2.y;
					    vs_TEXCOORD3.z = u_xlat1.y;
					    vs_TEXCOORD3.w = u_xlat0.y;
					    vs_TEXCOORD3.y = u_xlat3.y;
					    vs_TEXCOORD4.x = u_xlat2.z;
					    vs_TEXCOORD4.z = u_xlat1.z;
					    vs_TEXCOORD4.w = u_xlat0.z;
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    vs_TEXCOORD4.y = u_xlat3.z;
					    vs_TEXCOORD5.y = dot(u_xlat0.xyz, u_xlat3.xyz);
					    vs_TEXCOORD5.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    vs_TEXCOORD5.z = dot(u_xlat0.xyz, u_xlat1.xyz);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
						vec4 unused_0_4;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_4[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat12;
					int u_xlati12;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlati12 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati12 + 1) / 4][(u_xlati12 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati12 / 4][u_xlati12 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati12 + 2) / 4][(u_xlati12 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati12 + 3) / 4][(u_xlati12 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.w = u_xlat0.x;
					    u_xlat12 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    vs_TEXCOORD2.y = u_xlat3.x;
					    vs_TEXCOORD2.x = u_xlat2.x;
					    vs_TEXCOORD2.z = u_xlat1.x;
					    vs_TEXCOORD3.x = u_xlat2.y;
					    vs_TEXCOORD3.z = u_xlat1.y;
					    vs_TEXCOORD3.w = u_xlat0.y;
					    vs_TEXCOORD3.y = u_xlat3.y;
					    vs_TEXCOORD4.x = u_xlat2.z;
					    vs_TEXCOORD4.z = u_xlat1.z;
					    vs_TEXCOORD4.w = u_xlat0.z;
					    vs_TEXCOORD4.y = u_xlat3.z;
					    u_xlati12 = unity_StereoEyeIndex;
					    u_xlat0.xyz = (-u_xlat0.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati12].xyz;
					    vs_TEXCOORD5.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    vs_TEXCOORD5.z = dot(u_xlat0.xyz, u_xlat1.xyz);
					    vs_TEXCOORD5.y = dot(u_xlat0.xyz, u_xlat3.xyz);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
						vec4 unused_0_4;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0[39];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_8[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.w = u_xlat0.x;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    vs_TEXCOORD2.x = u_xlat1.x;
					    u_xlat12 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
					    u_xlat3.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    vs_TEXCOORD2.y = u_xlat3.x;
					    vs_TEXCOORD2.z = u_xlat2.x;
					    vs_TEXCOORD3.x = u_xlat1.y;
					    vs_TEXCOORD3.w = u_xlat0.y;
					    vs_TEXCOORD3.y = u_xlat3.y;
					    vs_TEXCOORD3.z = u_xlat2.y;
					    vs_TEXCOORD4.x = u_xlat1.z;
					    vs_TEXCOORD4.w = u_xlat0.z;
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    vs_TEXCOORD4.y = u_xlat3.z;
					    vs_TEXCOORD5.y = dot(u_xlat0.xyz, u_xlat3.xyz);
					    vs_TEXCOORD4.z = u_xlat2.z;
					    vs_TEXCOORD5.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    vs_TEXCOORD5.z = dot(u_xlat0.xyz, u_xlat2.xyz);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = u_xlat2.y * u_xlat2.y;
					    u_xlat0.x = u_xlat2.x * u_xlat2.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat1);
					    u_xlat3.y = dot(unity_SHBg, u_xlat1);
					    u_xlat3.z = dot(unity_SHBb, u_xlat1);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat3.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat2);
					    u_xlat1.y = dot(unity_SHAg, u_xlat2);
					    u_xlat1.z = dot(unity_SHAb, u_xlat2);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    vs_TEXCOORD7.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
						vec4 unused_0_4;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0[39];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_8[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_2[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_4[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat12;
					int u_xlati12;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlati12 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati12 + 1) / 4][(u_xlati12 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati12 / 4][u_xlati12 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati12 + 2) / 4][(u_xlati12 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati12 + 3) / 4][(u_xlati12 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.w = u_xlat0.x;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    vs_TEXCOORD2.x = u_xlat1.x;
					    u_xlat12 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
					    u_xlat3.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    vs_TEXCOORD2.y = u_xlat3.x;
					    vs_TEXCOORD2.z = u_xlat2.x;
					    vs_TEXCOORD3.x = u_xlat1.y;
					    vs_TEXCOORD3.w = u_xlat0.y;
					    vs_TEXCOORD3.y = u_xlat3.y;
					    vs_TEXCOORD3.z = u_xlat2.y;
					    vs_TEXCOORD4.x = u_xlat1.z;
					    vs_TEXCOORD4.w = u_xlat0.z;
					    vs_TEXCOORD4.y = u_xlat3.z;
					    vs_TEXCOORD4.z = u_xlat2.z;
					    u_xlati12 = unity_StereoEyeIndex;
					    u_xlat0.xyz = (-u_xlat0.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati12].xyz;
					    vs_TEXCOORD5.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    vs_TEXCOORD5.y = dot(u_xlat0.xyz, u_xlat3.xyz);
					    vs_TEXCOORD5.z = dot(u_xlat0.xyz, u_xlat2.xyz);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = u_xlat2.y * u_xlat2.y;
					    u_xlat0.x = u_xlat2.x * u_xlat2.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat1);
					    u_xlat3.y = dot(unity_SHBg, u_xlat1);
					    u_xlat3.z = dot(unity_SHBb, u_xlat1);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat3.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat2);
					    u_xlat1.y = dot(unity_SHAg, u_xlat2);
					    u_xlat1.z = dot(unity_SHAb, u_xlat2);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    vs_TEXCOORD7.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
						vec4 unused_0_4;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0[39];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_8[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.w = u_xlat0.x;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    vs_TEXCOORD2.x = u_xlat1.x;
					    u_xlat12 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
					    u_xlat3.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    vs_TEXCOORD2.y = u_xlat3.x;
					    vs_TEXCOORD2.z = u_xlat2.x;
					    vs_TEXCOORD3.x = u_xlat1.y;
					    vs_TEXCOORD3.w = u_xlat0.y;
					    vs_TEXCOORD3.y = u_xlat3.y;
					    vs_TEXCOORD3.z = u_xlat2.y;
					    vs_TEXCOORD4.x = u_xlat1.z;
					    vs_TEXCOORD4.w = u_xlat0.z;
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    vs_TEXCOORD4.y = u_xlat3.z;
					    vs_TEXCOORD5.y = dot(u_xlat0.xyz, u_xlat3.xyz);
					    vs_TEXCOORD4.z = u_xlat2.z;
					    vs_TEXCOORD5.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    vs_TEXCOORD5.z = dot(u_xlat0.xyz, u_xlat2.xyz);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = u_xlat2.y * u_xlat2.y;
					    u_xlat0.x = u_xlat2.x * u_xlat2.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat1);
					    u_xlat3.y = dot(unity_SHBg, u_xlat1);
					    u_xlat3.z = dot(unity_SHBb, u_xlat1);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat3.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat2);
					    u_xlat1.y = dot(unity_SHAg, u_xlat2);
					    u_xlat1.z = dot(unity_SHAb, u_xlat2);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    vs_TEXCOORD7.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
						vec4 unused_0_4;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0[39];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_8[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_2[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_4[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat12;
					int u_xlati12;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlati12 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati12 + 1) / 4][(u_xlati12 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati12 / 4][u_xlati12 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati12 + 2) / 4][(u_xlati12 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati12 + 3) / 4][(u_xlati12 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    vs_TEXCOORD2.w = u_xlat0.x;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    vs_TEXCOORD2.x = u_xlat1.x;
					    u_xlat12 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
					    u_xlat3.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    vs_TEXCOORD2.y = u_xlat3.x;
					    vs_TEXCOORD2.z = u_xlat2.x;
					    vs_TEXCOORD3.x = u_xlat1.y;
					    vs_TEXCOORD3.w = u_xlat0.y;
					    vs_TEXCOORD3.y = u_xlat3.y;
					    vs_TEXCOORD3.z = u_xlat2.y;
					    vs_TEXCOORD4.x = u_xlat1.z;
					    vs_TEXCOORD4.w = u_xlat0.z;
					    vs_TEXCOORD4.y = u_xlat3.z;
					    vs_TEXCOORD4.z = u_xlat2.z;
					    u_xlati12 = unity_StereoEyeIndex;
					    u_xlat0.xyz = (-u_xlat0.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati12].xyz;
					    vs_TEXCOORD5.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    vs_TEXCOORD5.y = dot(u_xlat0.xyz, u_xlat3.xyz);
					    vs_TEXCOORD5.z = dot(u_xlat0.xyz, u_xlat2.xyz);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = u_xlat2.y * u_xlat2.y;
					    u_xlat0.x = u_xlat2.x * u_xlat2.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat1);
					    u_xlat3.y = dot(unity_SHBg, u_xlat1);
					    u_xlat3.z = dot(unity_SHBb, u_xlat1);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat3.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat2);
					    u_xlat1.y = dot(unity_SHAg, u_xlat2);
					    u_xlat1.z = dot(unity_SHAb, u_xlat2);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    vs_TEXCOORD7.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _MainColor;
						float _Albedo;
						float _Emission;
						vec4 _GlowColor;
						float _GlowPower;
						float _OcclusionPower;
						vec4 unused_0_7[4];
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					layout(location = 2) out vec4 SV_Target2;
					layout(location = 3) out vec4 SV_Target3;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat10_0 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xyz = u_xlat10_1.xyz * _MainColor.xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_Albedo) + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat10_0.xyz + (-u_xlat1.xyz);
					    SV_Target0.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat0.x = u_xlat0.w * u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat9 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat9 = min(u_xlat9, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat0.z = sqrt(u_xlat9);
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat1.y = dot(vs_TEXCOORD3.xyz, u_xlat0.xyz);
					    u_xlat1.z = dot(vs_TEXCOORD4.xyz, u_xlat0.xyz);
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    SV_Target2.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target2.w = 1.0;
					    u_xlat9 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * vs_TEXCOORD5.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + _Emission;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _GlowPower;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * _GlowColor.xyz;
					    SV_Target3.xyz = exp2((-u_xlat0.xyz));
					    SV_Target3.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _MainColor;
						float _Albedo;
						float _Emission;
						vec4 _GlowColor;
						float _GlowPower;
						float _OcclusionPower;
						vec4 unused_0_7[4];
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					layout(location = 2) out vec4 SV_Target2;
					layout(location = 3) out vec4 SV_Target3;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat10_0 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xyz = u_xlat10_1.xyz * _MainColor.xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_Albedo) + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat10_0.xyz + (-u_xlat1.xyz);
					    SV_Target0.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat0.x = u_xlat0.w * u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat9 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat9 = min(u_xlat9, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat0.z = sqrt(u_xlat9);
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat1.y = dot(vs_TEXCOORD3.xyz, u_xlat0.xyz);
					    u_xlat1.z = dot(vs_TEXCOORD4.xyz, u_xlat0.xyz);
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    SV_Target2.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target2.w = 1.0;
					    u_xlat9 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * vs_TEXCOORD5.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + _Emission;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _GlowPower;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * _GlowColor.xyz;
					    SV_Target3.xyz = exp2((-u_xlat0.xyz));
					    SV_Target3.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _MainColor;
						float _Albedo;
						float _Emission;
						vec4 _GlowColor;
						float _GlowPower;
						float _OcclusionPower;
						vec4 unused_0_7[4];
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD7;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					layout(location = 2) out vec4 SV_Target2;
					layout(location = 3) out vec4 SV_Target3;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat10_0 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xyz = u_xlat10_1.xyz * _MainColor.xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_Albedo) + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat10_0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD7.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat1 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat1.x = u_xlat1.w * u_xlat1.x;
					    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat9 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat9 = min(u_xlat9, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat1.z = sqrt(u_xlat9);
					    u_xlat2.x = dot(vs_TEXCOORD2.xyz, u_xlat1.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
					    u_xlat2.z = dot(vs_TEXCOORD4.xyz, u_xlat1.xyz);
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    SV_Target2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target2.w = 1.0;
					    u_xlat9 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat2.xyz = vec3(u_xlat9) * vs_TEXCOORD5.xyz;
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat9 = (-u_xlat9) + _Emission;
					    u_xlat9 = log2(u_xlat9);
					    u_xlat9 = u_xlat9 * _GlowPower;
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat0.xyz = _GlowColor.xyz * vec3(u_xlat9) + u_xlat0.xyz;
					    SV_Target3.xyz = exp2((-u_xlat0.xyz));
					    SV_Target3.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _MainColor;
						float _Albedo;
						float _Emission;
						vec4 _GlowColor;
						float _GlowPower;
						float _OcclusionPower;
						vec4 unused_0_7[4];
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD7;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					layout(location = 2) out vec4 SV_Target2;
					layout(location = 3) out vec4 SV_Target3;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat10_0 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xyz = u_xlat10_1.xyz * _MainColor.xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_Albedo) + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat10_0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD7.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat1 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat1.x = u_xlat1.w * u_xlat1.x;
					    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat9 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat9 = min(u_xlat9, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat1.z = sqrt(u_xlat9);
					    u_xlat2.x = dot(vs_TEXCOORD2.xyz, u_xlat1.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
					    u_xlat2.z = dot(vs_TEXCOORD4.xyz, u_xlat1.xyz);
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    SV_Target2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target2.w = 1.0;
					    u_xlat9 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat2.xyz = vec3(u_xlat9) * vs_TEXCOORD5.xyz;
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat9 = (-u_xlat9) + _Emission;
					    u_xlat9 = log2(u_xlat9);
					    u_xlat9 = u_xlat9 * _GlowPower;
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat0.xyz = _GlowColor.xyz * vec3(u_xlat9) + u_xlat0.xyz;
					    SV_Target3.xyz = exp2((-u_xlat0.xyz));
					    SV_Target3.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _MainColor;
						float _Albedo;
						float _Emission;
						vec4 _GlowColor;
						float _GlowPower;
						float _OcclusionPower;
						vec4 unused_0_7[4];
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD7;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					layout(location = 2) out vec4 SV_Target2;
					layout(location = 3) out vec4 SV_Target3;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat10_0 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xyz = u_xlat10_1.xyz * _MainColor.xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_Albedo) + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat10_0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD7.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat1 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat1.x = u_xlat1.w * u_xlat1.x;
					    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat9 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat9 = min(u_xlat9, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat1.z = sqrt(u_xlat9);
					    u_xlat2.x = dot(vs_TEXCOORD2.xyz, u_xlat1.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
					    u_xlat2.z = dot(vs_TEXCOORD4.xyz, u_xlat1.xyz);
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    SV_Target2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target2.w = 1.0;
					    u_xlat9 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat2.xyz = vec3(u_xlat9) * vs_TEXCOORD5.xyz;
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat9 = (-u_xlat9) + _Emission;
					    u_xlat9 = log2(u_xlat9);
					    u_xlat9 = u_xlat9 * _GlowPower;
					    u_xlat9 = exp2(u_xlat9);
					    SV_Target3.xyz = _GlowColor.xyz * vec3(u_xlat9) + u_xlat0.xyz;
					    SV_Target3.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _MainColor;
						float _Albedo;
						float _Emission;
						vec4 _GlowColor;
						float _GlowPower;
						float _OcclusionPower;
						vec4 unused_0_7[4];
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD7;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					layout(location = 2) out vec4 SV_Target2;
					layout(location = 3) out vec4 SV_Target3;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat10_0 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xyz = u_xlat10_1.xyz * _MainColor.xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_Albedo) + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat10_0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD7.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat1 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat1.x = u_xlat1.w * u_xlat1.x;
					    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat9 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat9 = min(u_xlat9, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat1.z = sqrt(u_xlat9);
					    u_xlat2.x = dot(vs_TEXCOORD2.xyz, u_xlat1.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
					    u_xlat2.z = dot(vs_TEXCOORD4.xyz, u_xlat1.xyz);
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    SV_Target2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target2.w = 1.0;
					    u_xlat9 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat2.xyz = vec3(u_xlat9) * vs_TEXCOORD5.xyz;
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat9 = (-u_xlat9) + _Emission;
					    u_xlat9 = log2(u_xlat9);
					    u_xlat9 = u_xlat9 * _GlowPower;
					    u_xlat9 = exp2(u_xlat9);
					    SV_Target3.xyz = _GlowColor.xyz * vec3(u_xlat9) + u_xlat0.xyz;
					    SV_Target3.w = 1.0;
					    return;
					}"
				}
			}
		}
		Pass {
			Name "META"
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "META" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Cull Off
			GpuProgramID 342241
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[9];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					layout(std140) uniform UnityLightmaps {
						vec4 unity_LightmapST;
						vec4 unity_DynamicLightmapST;
					};
					layout(std140) uniform UnityMetaPass {
						bvec4 unity_MetaVertexControl;
						vec4 unused_4_1[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_TEXCOORD1;
					in  vec4 in_TEXCOORD2;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					float u_xlat12;
					bool u_xlatb12;
					void main()
					{
					    u_xlatb0 = 0.0<in_POSITION0.z;
					    u_xlat0.z = u_xlatb0 ? 9.99999975e-05 : float(0.0);
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    u_xlat0.xyz = (unity_MetaVertexControl.x) ? u_xlat0.xyz : in_POSITION0.xyz;
					    u_xlatb12 = 0.0<u_xlat0.z;
					    u_xlat1.z = u_xlatb12 ? 9.99999975e-05 : float(0.0);
					    u_xlat1.xy = in_TEXCOORD2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
					    u_xlat0.xyz = (unity_MetaVertexControl.y) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
					    u_xlat12 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    vs_TEXCOORD2.y = u_xlat2.x;
					    u_xlat3.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat3.xyz;
					    vs_TEXCOORD2.w = u_xlat3.x;
					    vs_TEXCOORD2.x = u_xlat1.z;
					    vs_TEXCOORD2.z = u_xlat0.y;
					    vs_TEXCOORD3.x = u_xlat1.x;
					    vs_TEXCOORD4.x = u_xlat1.y;
					    vs_TEXCOORD3.z = u_xlat0.z;
					    vs_TEXCOORD4.z = u_xlat0.x;
					    vs_TEXCOORD3.w = u_xlat3.y;
					    vs_TEXCOORD4.w = u_xlat3.z;
					    vs_TEXCOORD3.y = u_xlat2.y;
					    vs_TEXCOORD4.y = u_xlat2.z;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[9];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
						vec4 _Occlusion_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[40];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(std140) uniform UnityLightmaps {
						vec4 unity_LightmapST;
						vec4 unity_DynamicLightmapST;
					};
					layout(std140) uniform UnityMetaPass {
						bvec4 unity_MetaVertexControl;
						vec4 unused_5_1[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_TEXCOORD1;
					in  vec4 in_TEXCOORD2;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat12;
					bool u_xlatb12;
					void main()
					{
					    u_xlatb0 = 0.0<in_POSITION0.z;
					    u_xlat0.z = u_xlatb0 ? 9.99999975e-05 : float(0.0);
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    u_xlat0.xyz = (unity_MetaVertexControl.x) ? u_xlat0.xyz : in_POSITION0.xyz;
					    u_xlatb12 = 0.0<u_xlat0.z;
					    u_xlat1.z = u_xlatb12 ? 9.99999975e-05 : float(0.0);
					    u_xlat1.xy = in_TEXCOORD2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
					    u_xlat0.xyz = (unity_MetaVertexControl.y) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlati1 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat0.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat0.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat0.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat0.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Occlusion_ST.xy + _Occlusion_ST.zw;
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
					    u_xlat12 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    vs_TEXCOORD2.y = u_xlat2.x;
					    u_xlat3.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat3.xyz;
					    vs_TEXCOORD2.w = u_xlat3.x;
					    vs_TEXCOORD2.x = u_xlat1.z;
					    vs_TEXCOORD2.z = u_xlat0.y;
					    vs_TEXCOORD3.x = u_xlat1.x;
					    vs_TEXCOORD4.x = u_xlat1.y;
					    vs_TEXCOORD3.z = u_xlat0.z;
					    vs_TEXCOORD4.z = u_xlat0.x;
					    vs_TEXCOORD3.w = u_xlat3.y;
					    vs_TEXCOORD4.w = u_xlat3.z;
					    vs_TEXCOORD3.y = u_xlat2.y;
					    vs_TEXCOORD4.y = u_xlat2.z;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _MainColor;
						float _Albedo;
						float _Emission;
						vec4 _GlowColor;
						float _GlowPower;
						float _OcclusionPower;
						float unity_OneOverOutputBoost;
						float unity_MaxOutputValue;
						float unity_UseLinearSpace;
						vec4 unused_0_10[3];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityMetaPass {
						vec4 unused_2_0;
						bvec4 unity_MetaFragmentControl;
						vec4 unused_2_2;
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD2.w;
					    u_xlat0.y = vs_TEXCOORD3.w;
					    u_xlat0.z = vs_TEXCOORD4.w;
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD3.xyz;
					    u_xlat0.xyw = vs_TEXCOORD2.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = vs_TEXCOORD4.xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat1.x = u_xlat1.w * u_xlat1.x;
					    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat12 = min(u_xlat12, 1.0);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat1.z = sqrt(u_xlat12);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + _Emission;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _GlowPower;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * _GlowColor.xyz;
					    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(unity_UseLinearSpace);
					    u_xlat0.xyz = (bool(u_xlatb12)) ? u_xlat0.xyz : u_xlat1.xyz;
					    u_xlat10_1 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = u_xlat10_2.xyz * _MainColor.xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_Albedo) + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat10_1.xyz + (-u_xlat2.xyz);
					    u_xlat1.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat13 = unity_OneOverOutputBoost;
					    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat13);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(vec3(unity_MaxOutputValue, unity_MaxOutputValue, unity_MaxOutputValue)));
					    u_xlat1.w = 1.0;
					    u_xlat1 = (unity_MetaFragmentControl.x) ? u_xlat1 : vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.w = 1.0;
					    SV_Target0 = (unity_MetaFragmentControl.y) ? u_xlat0 : u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _MainColor;
						float _Albedo;
						float _Emission;
						vec4 _GlowColor;
						float _GlowPower;
						float _OcclusionPower;
						float unity_OneOverOutputBoost;
						float unity_MaxOutputValue;
						float unity_UseLinearSpace;
						vec4 unused_0_10[3];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_1_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(std140) uniform UnityMetaPass {
						vec4 unused_3_0;
						bvec4 unity_MetaFragmentControl;
						vec4 unused_3_2;
					};
					uniform  sampler2D _Occlusion;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat12;
					int u_xlati12;
					bool u_xlatb12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD2.w;
					    u_xlat0.y = vs_TEXCOORD3.w;
					    u_xlat0.z = vs_TEXCOORD4.w;
					    u_xlati12 = unity_StereoEyeIndex;
					    u_xlat0.xyz = (-u_xlat0.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati12].xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD3.xyz;
					    u_xlat0.xyw = vs_TEXCOORD2.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = vs_TEXCOORD4.xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat1.x = u_xlat1.w * u_xlat1.x;
					    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat12 = min(u_xlat12, 1.0);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat1.z = sqrt(u_xlat12);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + _Emission;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _GlowPower;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * _GlowColor.xyz;
					    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(unity_UseLinearSpace);
					    u_xlat0.xyz = (bool(u_xlatb12)) ? u_xlat0.xyz : u_xlat1.xyz;
					    u_xlat10_1 = texture(_Occlusion, vs_TEXCOORD1.xy);
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = u_xlat10_2.xyz * _MainColor.xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_Albedo) + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat10_1.xyz + (-u_xlat2.xyz);
					    u_xlat1.xyz = vec3(vec3(_OcclusionPower, _OcclusionPower, _OcclusionPower)) * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat13 = unity_OneOverOutputBoost;
					    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat13);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(vec3(unity_MaxOutputValue, unity_MaxOutputValue, unity_MaxOutputValue)));
					    u_xlat1.w = 1.0;
					    u_xlat1 = (unity_MetaFragmentControl.x) ? u_xlat1 : vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.w = 1.0;
					    SV_Target0 = (unity_MetaFragmentControl.y) ? u_xlat0 : u_xlat1;
					    return;
					}"
				}
			}
		}
	}
	Fallback "Diffuse"
}