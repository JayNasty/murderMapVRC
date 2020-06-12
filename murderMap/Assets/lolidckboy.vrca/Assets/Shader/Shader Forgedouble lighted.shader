Shader "Shader Forge/double lighted" {
	Properties {
		_AvatarsOriginalTexture ("Avatars Original Texture", 2D) = "white" {}
		_AvatarsNormal ("Avatars Normal ", 2D) = "black" {}
		_AvatarsLightmap ("Avatars Lightmap", 2D) = "white" {}
		_AvatarsHueAdjust ("Avatars Hue Adjust", Vector) = (1,1,1,1)
		_AvatarsSpecular ("Avatars Specular", Vector) = (0.4852941,0.9574036,1,1)
		_AvatarsSmoothness ("Avatars Smoothness", Range(0, 1)) = 0.5
		_EffectBlackMatteImage ("Effect (Black Matte Image)", 2D) = "black" {}
		_EffectHueAdjust ("Effect Hue Adjust", Vector) = (1,1,1,1)
		_EffectSpeed ("Effect Speed", Range(-5, 5)) = 5
		_EffectStereoDepth ("Effect Stereo Depth", Range(-1, 1)) = 1
	}
	SubShader {
		Tags { "RenderType" = "Opaque" }
		Pass {
			Name "FORWARD"
			Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
			Cull Off
			GpuProgramID 27219
			Program "vp" {
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
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
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
					    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    vs_TEXCOORD4.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_1_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_1_2[40];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
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
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
					    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    vs_TEXCOORD4.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
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
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
					    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    vs_TEXCOORD4.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_1_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_1_2[40];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
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
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
					    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    vs_TEXCOORD4.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerCamera {
						vec4 unused_0_0[5];
						vec4 _ProjectionParams;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD5.zw = u_xlat0.zw;
					    vs_TEXCOORD5.xy = u_xlat1.zz + u_xlat1.xw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerCamera {
						vec4 unused_0_0[4];
						vec4 _ProjectionParams;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[38];
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_2_4;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat5;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    u_xlat0 = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    u_xlat0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlati1 = unity_StereoEyeIndex;
					    u_xlat5.xy = u_xlat0.ww * unity_StereoScaleOffset[u_xlati1].zw;
					    vs_TEXCOORD5.xy = u_xlat0.xy * unity_StereoScaleOffset[u_xlati1].xy + u_xlat5.xy;
					    vs_TEXCOORD5.zw = u_xlat0.zw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerCamera {
						vec4 unused_0_0[5];
						vec4 _ProjectionParams;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD5.zw = u_xlat0.zw;
					    vs_TEXCOORD5.xy = u_xlat1.zz + u_xlat1.xw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerCamera {
						vec4 unused_0_0[4];
						vec4 _ProjectionParams;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[38];
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_2_4;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat5;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    u_xlat0 = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    u_xlat0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlati1 = unity_StereoEyeIndex;
					    u_xlat5.xy = u_xlat0.ww * unity_StereoScaleOffset[u_xlati1].zw;
					    vs_TEXCOORD5.xy = u_xlat0.xy * unity_StereoScaleOffset[u_xlati1].xy + u_xlat5.xy;
					    vs_TEXCOORD5.zw = u_xlat0.zw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
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
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
					    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    vs_TEXCOORD4.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_1_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_1_2[40];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
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
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
					    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    vs_TEXCOORD4.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
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
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
					    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    vs_TEXCOORD4.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_1_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_1_2[40];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
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
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
					    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    vs_TEXCOORD4.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerCamera {
						vec4 unused_0_0[5];
						vec4 _ProjectionParams;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD5.zw = u_xlat0.zw;
					    vs_TEXCOORD5.xy = u_xlat1.zz + u_xlat1.xw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerCamera {
						vec4 unused_0_0[4];
						vec4 _ProjectionParams;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[38];
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_2_4;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat5;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    u_xlat0 = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    u_xlat0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlati1 = unity_StereoEyeIndex;
					    u_xlat5.xy = u_xlat0.ww * unity_StereoScaleOffset[u_xlati1].zw;
					    vs_TEXCOORD5.xy = u_xlat0.xy * unity_StereoScaleOffset[u_xlati1].xy + u_xlat5.xy;
					    vs_TEXCOORD5.zw = u_xlat0.zw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerCamera {
						vec4 unused_0_0[5];
						vec4 _ProjectionParams;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD5.zw = u_xlat0.zw;
					    vs_TEXCOORD5.xy = u_xlat1.zz + u_xlat1.xw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerCamera {
						vec4 unused_0_0[4];
						vec4 _ProjectionParams;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[38];
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_2_4;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat5;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    u_xlat0 = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    u_xlat0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlati1 = unity_StereoEyeIndex;
					    u_xlat5.xy = u_xlat0.ww * unity_StereoScaleOffset[u_xlati1].zw;
					    vs_TEXCOORD5.xy = u_xlat0.xy * unity_StereoScaleOffset[u_xlati1].xy + u_xlat5.xy;
					    vs_TEXCOORD5.zw = u_xlat0.zw;
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
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 _AvatarsHueAdjust;
						vec4 _AvatarsOriginalTexture_ST;
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 _AvatarsLightmap_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _AvatarsOriginalTexture;
					uniform  sampler2D _EffectBlackMatteImage;
					uniform  sampler2D _AvatarsLightmap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					bvec3 u_xlatb2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					float u_xlat6;
					vec3 u_xlat7;
					float u_xlat18;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat18 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat1.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat7.xyz = vec3(u_xlat18) * u_xlat2.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat2.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat6 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat7.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat7.xyz);
					    u_xlat18 = _EffectStereoDepth + -0.5;
					    u_xlat18 = u_xlat18 * 0.0500000007;
					    u_xlat7.x = _EffectSpeed * _Time.x;
					    u_xlat7.xy = u_xlat7.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat7.xy = vec2(u_xlat18) * u_xlat2.xy + u_xlat7.xy;
					    u_xlat7.xy = u_xlat7.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat7.xy);
					    u_xlat7.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat2.xyz = fract(u_xlat10_2.xyz);
					    u_xlat0.xyz = u_xlat7.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat7.xyz + u_xlat7.xyz;
					    u_xlat3.xy = vs_TEXCOORD0.xy * _AvatarsOriginalTexture_ST.xy + _AvatarsOriginalTexture_ST.zw;
					    u_xlat10_3 = texture(_AvatarsOriginalTexture, u_xlat3.xy);
					    u_xlat1.xyz = u_xlat10_3.xyz * _AvatarsHueAdjust.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), u_xlat1.xyzx).xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat3.xyz = (-u_xlat3.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _AvatarsLightmap_ST.xy + _AvatarsLightmap_ST.zw;
					    u_xlat10_4 = texture(_AvatarsLightmap, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat1.xyz;
					    u_xlat3.xyz = (-u_xlat3.xyz) * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat3.x : u_xlat1.x;
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat3.y : u_xlat1.y;
					        hlslcc_movcTemp.z = (u_xlatb2.z) ? u_xlat3.z : u_xlat1.z;
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * _LightColor0.xyz + u_xlat1.xyz;
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
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 _AvatarsHueAdjust;
						vec4 _AvatarsOriginalTexture_ST;
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 _AvatarsLightmap_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _AvatarsOriginalTexture;
					uniform  sampler2D _EffectBlackMatteImage;
					uniform  sampler2D _AvatarsLightmap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					bvec3 u_xlatb2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					float u_xlat6;
					vec3 u_xlat7;
					float u_xlat18;
					int u_xlati18;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat18 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat1.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
					    u_xlati18 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati18].xyz;
					    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat7.xyz = vec3(u_xlat18) * u_xlat2.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat2.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat6 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat7.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat7.xyz);
					    u_xlat18 = _EffectStereoDepth + -0.5;
					    u_xlat18 = u_xlat18 * 0.0500000007;
					    u_xlat7.x = _EffectSpeed * _Time.x;
					    u_xlat7.xy = u_xlat7.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat7.xy = vec2(u_xlat18) * u_xlat2.xy + u_xlat7.xy;
					    u_xlat7.xy = u_xlat7.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat7.xy);
					    u_xlat7.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat2.xyz = fract(u_xlat10_2.xyz);
					    u_xlat0.xyz = u_xlat7.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat7.xyz + u_xlat7.xyz;
					    u_xlat3.xy = vs_TEXCOORD0.xy * _AvatarsOriginalTexture_ST.xy + _AvatarsOriginalTexture_ST.zw;
					    u_xlat10_3 = texture(_AvatarsOriginalTexture, u_xlat3.xy);
					    u_xlat1.xyz = u_xlat10_3.xyz * _AvatarsHueAdjust.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), u_xlat1.xyzx).xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat3.xyz = (-u_xlat3.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _AvatarsLightmap_ST.xy + _AvatarsLightmap_ST.zw;
					    u_xlat10_4 = texture(_AvatarsLightmap, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat1.xyz;
					    u_xlat3.xyz = (-u_xlat3.xyz) * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat3.x : u_xlat1.x;
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat3.y : u_xlat1.y;
					        hlslcc_movcTemp.z = (u_xlatb2.z) ? u_xlat3.z : u_xlat1.z;
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * _LightColor0.xyz + u_xlat1.xyz;
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
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 _AvatarsHueAdjust;
						vec4 _AvatarsOriginalTexture_ST;
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 _AvatarsLightmap_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _AvatarsOriginalTexture;
					uniform  sampler2D _EffectBlackMatteImage;
					uniform  sampler2D _AvatarsLightmap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					bvec3 u_xlatb2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					float u_xlat6;
					vec3 u_xlat7;
					float u_xlat18;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat18 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat1.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat7.xyz = vec3(u_xlat18) * u_xlat2.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat2.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat6 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat7.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat7.xyz);
					    u_xlat18 = _EffectStereoDepth + -0.5;
					    u_xlat18 = u_xlat18 * 0.0500000007;
					    u_xlat7.x = _EffectSpeed * _Time.x;
					    u_xlat7.xy = u_xlat7.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat7.xy = vec2(u_xlat18) * u_xlat2.xy + u_xlat7.xy;
					    u_xlat7.xy = u_xlat7.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat7.xy);
					    u_xlat7.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat2.xyz = fract(u_xlat10_2.xyz);
					    u_xlat0.xyz = u_xlat7.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat7.xyz + u_xlat7.xyz;
					    u_xlat3.xy = vs_TEXCOORD0.xy * _AvatarsOriginalTexture_ST.xy + _AvatarsOriginalTexture_ST.zw;
					    u_xlat10_3 = texture(_AvatarsOriginalTexture, u_xlat3.xy);
					    u_xlat1.xyz = u_xlat10_3.xyz * _AvatarsHueAdjust.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), u_xlat1.xyzx).xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat3.xyz = (-u_xlat3.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _AvatarsLightmap_ST.xy + _AvatarsLightmap_ST.zw;
					    u_xlat10_4 = texture(_AvatarsLightmap, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat1.xyz;
					    u_xlat3.xyz = (-u_xlat3.xyz) * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat3.x : u_xlat1.x;
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat3.y : u_xlat1.y;
					        hlslcc_movcTemp.z = (u_xlatb2.z) ? u_xlat3.z : u_xlat1.z;
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * _LightColor0.xyz + u_xlat1.xyz;
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
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 _AvatarsHueAdjust;
						vec4 _AvatarsOriginalTexture_ST;
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 _AvatarsLightmap_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _AvatarsOriginalTexture;
					uniform  sampler2D _EffectBlackMatteImage;
					uniform  sampler2D _AvatarsLightmap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					bvec3 u_xlatb2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					float u_xlat6;
					vec3 u_xlat7;
					float u_xlat18;
					int u_xlati18;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat18 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat1.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
					    u_xlati18 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati18].xyz;
					    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat7.xyz = vec3(u_xlat18) * u_xlat2.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat2.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat6 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat7.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat7.xyz);
					    u_xlat18 = _EffectStereoDepth + -0.5;
					    u_xlat18 = u_xlat18 * 0.0500000007;
					    u_xlat7.x = _EffectSpeed * _Time.x;
					    u_xlat7.xy = u_xlat7.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat7.xy = vec2(u_xlat18) * u_xlat2.xy + u_xlat7.xy;
					    u_xlat7.xy = u_xlat7.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat7.xy);
					    u_xlat7.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat2.xyz = fract(u_xlat10_2.xyz);
					    u_xlat0.xyz = u_xlat7.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat7.xyz + u_xlat7.xyz;
					    u_xlat3.xy = vs_TEXCOORD0.xy * _AvatarsOriginalTexture_ST.xy + _AvatarsOriginalTexture_ST.zw;
					    u_xlat10_3 = texture(_AvatarsOriginalTexture, u_xlat3.xy);
					    u_xlat1.xyz = u_xlat10_3.xyz * _AvatarsHueAdjust.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), u_xlat1.xyzx).xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat3.xyz = (-u_xlat3.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _AvatarsLightmap_ST.xy + _AvatarsLightmap_ST.zw;
					    u_xlat10_4 = texture(_AvatarsLightmap, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat1.xyz;
					    u_xlat3.xyz = (-u_xlat3.xyz) * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat3.x : u_xlat1.x;
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat3.y : u_xlat1.y;
					        hlslcc_movcTemp.z = (u_xlatb2.z) ? u_xlat3.z : u_xlat1.z;
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * _LightColor0.xyz + u_xlat1.xyz;
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
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 _AvatarsHueAdjust;
						vec4 _AvatarsOriginalTexture_ST;
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 _AvatarsLightmap_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _AvatarsOriginalTexture;
					uniform  sampler2D _EffectBlackMatteImage;
					uniform  sampler2D _AvatarsLightmap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					bvec3 u_xlatb2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					float u_xlat6;
					vec3 u_xlat7;
					float u_xlat18;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat18 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat1.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat7.xyz = vec3(u_xlat18) * u_xlat2.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat2.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat6 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat7.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat7.xyz);
					    u_xlat18 = _EffectStereoDepth + -0.5;
					    u_xlat18 = u_xlat18 * 0.0500000007;
					    u_xlat7.x = _EffectSpeed * _Time.x;
					    u_xlat7.xy = u_xlat7.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat7.xy = vec2(u_xlat18) * u_xlat2.xy + u_xlat7.xy;
					    u_xlat7.xy = u_xlat7.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat7.xy);
					    u_xlat7.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat2.xyz = fract(u_xlat10_2.xyz);
					    u_xlat0.xyz = u_xlat7.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat7.xyz + u_xlat7.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat3.xy = vs_TEXCOORD0.xy * _AvatarsOriginalTexture_ST.xy + _AvatarsOriginalTexture_ST.zw;
					    u_xlat10_3 = texture(_AvatarsOriginalTexture, u_xlat3.xy);
					    u_xlat1.xyz = u_xlat10_3.xyz * _AvatarsHueAdjust.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), u_xlat1.xyzx).xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat3.xyz = (-u_xlat3.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _AvatarsLightmap_ST.xy + _AvatarsLightmap_ST.zw;
					    u_xlat10_4 = texture(_AvatarsLightmap, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat1.xyz;
					    u_xlat3.xyz = (-u_xlat3.xyz) * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat3.x : u_xlat1.x;
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat3.y : u_xlat1.y;
					        hlslcc_movcTemp.z = (u_xlatb2.z) ? u_xlat3.z : u_xlat1.z;
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
					    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat2.xy);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_2.xxx + u_xlat1.xyz;
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
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 _AvatarsHueAdjust;
						vec4 _AvatarsOriginalTexture_ST;
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 _AvatarsLightmap_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _AvatarsOriginalTexture;
					uniform  sampler2D _EffectBlackMatteImage;
					uniform  sampler2D _AvatarsLightmap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					bvec3 u_xlatb2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					float u_xlat6;
					vec3 u_xlat7;
					float u_xlat18;
					int u_xlati18;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat18 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat1.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
					    u_xlati18 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati18].xyz;
					    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat7.xyz = vec3(u_xlat18) * u_xlat2.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat2.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat6 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat7.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat7.xyz);
					    u_xlat18 = _EffectStereoDepth + -0.5;
					    u_xlat18 = u_xlat18 * 0.0500000007;
					    u_xlat7.x = _EffectSpeed * _Time.x;
					    u_xlat7.xy = u_xlat7.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat7.xy = vec2(u_xlat18) * u_xlat2.xy + u_xlat7.xy;
					    u_xlat7.xy = u_xlat7.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat7.xy);
					    u_xlat7.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat2.xyz = fract(u_xlat10_2.xyz);
					    u_xlat0.xyz = u_xlat7.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat7.xyz + u_xlat7.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat3.xy = vs_TEXCOORD0.xy * _AvatarsOriginalTexture_ST.xy + _AvatarsOriginalTexture_ST.zw;
					    u_xlat10_3 = texture(_AvatarsOriginalTexture, u_xlat3.xy);
					    u_xlat1.xyz = u_xlat10_3.xyz * _AvatarsHueAdjust.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), u_xlat1.xyzx).xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat3.xyz = (-u_xlat3.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _AvatarsLightmap_ST.xy + _AvatarsLightmap_ST.zw;
					    u_xlat10_4 = texture(_AvatarsLightmap, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat1.xyz;
					    u_xlat3.xyz = (-u_xlat3.xyz) * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat3.x : u_xlat1.x;
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat3.y : u_xlat1.y;
					        hlslcc_movcTemp.z = (u_xlatb2.z) ? u_xlat3.z : u_xlat1.z;
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
					    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat2.xy);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_2.xxx + u_xlat1.xyz;
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
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 _AvatarsHueAdjust;
						vec4 _AvatarsOriginalTexture_ST;
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 _AvatarsLightmap_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _AvatarsOriginalTexture;
					uniform  sampler2D _EffectBlackMatteImage;
					uniform  sampler2D _AvatarsLightmap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					bvec3 u_xlatb2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					float u_xlat6;
					vec3 u_xlat7;
					float u_xlat18;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat18 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat1.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat7.xyz = vec3(u_xlat18) * u_xlat2.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat2.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat6 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat7.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat7.xyz);
					    u_xlat18 = _EffectStereoDepth + -0.5;
					    u_xlat18 = u_xlat18 * 0.0500000007;
					    u_xlat7.x = _EffectSpeed * _Time.x;
					    u_xlat7.xy = u_xlat7.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat7.xy = vec2(u_xlat18) * u_xlat2.xy + u_xlat7.xy;
					    u_xlat7.xy = u_xlat7.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat7.xy);
					    u_xlat7.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat2.xyz = fract(u_xlat10_2.xyz);
					    u_xlat0.xyz = u_xlat7.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat7.xyz + u_xlat7.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat3.xy = vs_TEXCOORD0.xy * _AvatarsOriginalTexture_ST.xy + _AvatarsOriginalTexture_ST.zw;
					    u_xlat10_3 = texture(_AvatarsOriginalTexture, u_xlat3.xy);
					    u_xlat1.xyz = u_xlat10_3.xyz * _AvatarsHueAdjust.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), u_xlat1.xyzx).xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat3.xyz = (-u_xlat3.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _AvatarsLightmap_ST.xy + _AvatarsLightmap_ST.zw;
					    u_xlat10_4 = texture(_AvatarsLightmap, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat1.xyz;
					    u_xlat3.xyz = (-u_xlat3.xyz) * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat3.x : u_xlat1.x;
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat3.y : u_xlat1.y;
					        hlslcc_movcTemp.z = (u_xlatb2.z) ? u_xlat3.z : u_xlat1.z;
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
					    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat2.xy);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_2.xxx + u_xlat1.xyz;
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
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 _AvatarsHueAdjust;
						vec4 _AvatarsOriginalTexture_ST;
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 _AvatarsLightmap_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _AvatarsOriginalTexture;
					uniform  sampler2D _EffectBlackMatteImage;
					uniform  sampler2D _AvatarsLightmap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					bvec3 u_xlatb2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					float u_xlat6;
					vec3 u_xlat7;
					float u_xlat18;
					int u_xlati18;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat18 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat1.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
					    u_xlati18 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati18].xyz;
					    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat7.xyz = vec3(u_xlat18) * u_xlat2.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat2.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat6 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat7.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat7.xyz);
					    u_xlat18 = _EffectStereoDepth + -0.5;
					    u_xlat18 = u_xlat18 * 0.0500000007;
					    u_xlat7.x = _EffectSpeed * _Time.x;
					    u_xlat7.xy = u_xlat7.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat7.xy = vec2(u_xlat18) * u_xlat2.xy + u_xlat7.xy;
					    u_xlat7.xy = u_xlat7.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat7.xy);
					    u_xlat7.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat2.xyz = fract(u_xlat10_2.xyz);
					    u_xlat0.xyz = u_xlat7.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat7.xyz + u_xlat7.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat3.xy = vs_TEXCOORD0.xy * _AvatarsOriginalTexture_ST.xy + _AvatarsOriginalTexture_ST.zw;
					    u_xlat10_3 = texture(_AvatarsOriginalTexture, u_xlat3.xy);
					    u_xlat1.xyz = u_xlat10_3.xyz * _AvatarsHueAdjust.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), u_xlat1.xyzx).xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat3.xyz = (-u_xlat3.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _AvatarsLightmap_ST.xy + _AvatarsLightmap_ST.zw;
					    u_xlat10_4 = texture(_AvatarsLightmap, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat1.xyz;
					    u_xlat3.xyz = (-u_xlat3.xyz) * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat3.x : u_xlat1.x;
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat3.y : u_xlat1.y;
					        hlslcc_movcTemp.z = (u_xlatb2.z) ? u_xlat3.z : u_xlat1.z;
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
					    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat2.xy);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_2.xxx + u_xlat1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
		Pass {
			Name "FORWARD_DELTA"
			Tags { "LIGHTMODE" = "FORWARDADD" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
			Blend One One, One One
			Cull Off
			GpuProgramID 77258
			Program "vp" {
				SubProgram "d3d11 " {
					Keywords { "POINT" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[11];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD5.xyz = unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[11];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
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
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					int u_xlati2;
					vec4 u_xlat3;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati2 = unity_StereoEyeIndex << 2;
					    u_xlat3 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati2 + 1) / 4][(u_xlati2 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati2 / 4][u_xlati2 % 4] * u_xlat1.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati2 + 2) / 4][(u_xlati2 + 2) % 4] * u_xlat1.zzzz + u_xlat3;
					    gl_Position = unity_StereoMatrixVP[(u_xlati2 + 3) / 4][(u_xlati2 + 3) % 4] * u_xlat1.wwww + u_xlat3;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD5.xyz = unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
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
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
					    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    vs_TEXCOORD4.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_1_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_1_2[40];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
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
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
					    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    vs_TEXCOORD4.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[11];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_WorldToLight[1];
					    u_xlat1 = unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
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
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[11];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
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
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					int u_xlati2;
					vec4 u_xlat3;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati2 = unity_StereoEyeIndex << 2;
					    u_xlat3 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati2 + 1) / 4][(u_xlati2 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati2 / 4][u_xlati2 % 4] * u_xlat1.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati2 + 2) / 4][(u_xlati2 + 2) % 4] * u_xlat1.zzzz + u_xlat3;
					    gl_Position = unity_StereoMatrixVP[(u_xlati2 + 3) / 4][(u_xlati2 + 3) % 4] * u_xlat1.wwww + u_xlat3;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_WorldToLight[1];
					    u_xlat1 = unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
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
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[11];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD5.xyz = unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[11];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
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
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					int u_xlati2;
					vec4 u_xlat3;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati2 = unity_StereoEyeIndex << 2;
					    u_xlat3 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati2 + 1) / 4][(u_xlati2 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati2 / 4][u_xlati2 % 4] * u_xlat1.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati2 + 2) / 4][(u_xlati2 + 2) % 4] * u_xlat1.zzzz + u_xlat3;
					    gl_Position = unity_StereoMatrixVP[(u_xlati2 + 3) / 4][(u_xlati2 + 3) % 4] * u_xlat1.wwww + u_xlat3;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD5.xyz = unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[11];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat1.xy = u_xlat0.yy * unity_WorldToLight[1].xy;
					    u_xlat1.xy = unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat1.xy;
					    u_xlat1.xy = unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat1.xy;
					    vs_TEXCOORD5.xy = unity_WorldToLight[3].xy * u_xlat0.ww + u_xlat1.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
					    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    vs_TEXCOORD4.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[11];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
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
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					int u_xlati2;
					vec4 u_xlat3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati2 = unity_StereoEyeIndex << 2;
					    u_xlat3 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati2 + 1) / 4][(u_xlati2 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati2 / 4][u_xlati2 % 4] * u_xlat1.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati2 + 2) / 4][(u_xlati2 + 2) % 4] * u_xlat1.zzzz + u_xlat3;
					    gl_Position = unity_StereoMatrixVP[(u_xlati2 + 3) / 4][(u_xlati2 + 3) % 4] * u_xlat1.wwww + u_xlat3;
					    u_xlat1.xy = u_xlat0.yy * unity_WorldToLight[1].xy;
					    u_xlat1.xy = unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat1.xy;
					    u_xlat1.xy = unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat1.xy;
					    vs_TEXCOORD5.xy = unity_WorldToLight[3].xy * u_xlat0.ww + u_xlat1.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
					    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[11];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_1_0[8];
						mat4x4 unity_WorldToShadow[4];
						vec4 unused_1_2[14];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_WorldToLight[1];
					    u_xlat1 = unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1 = u_xlat0.yyyy * unity_WorldToShadow[1 / 4][1 % 4];
					    u_xlat1 = unity_WorldToShadow[0 / 4][0 % 4] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToShadow[2 / 4][2 % 4] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD6 = unity_WorldToShadow[3 / 4][3 % 4] * u_xlat0.wwww + u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[11];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_1_0[8];
						mat4x4 unity_WorldToShadow[4];
						vec4 unused_1_2[14];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
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
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					int u_xlati2;
					vec4 u_xlat3;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati2 = unity_StereoEyeIndex << 2;
					    u_xlat3 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati2 + 1) / 4][(u_xlati2 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati2 / 4][u_xlati2 % 4] * u_xlat1.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati2 + 2) / 4][(u_xlati2 + 2) % 4] * u_xlat1.zzzz + u_xlat3;
					    gl_Position = unity_StereoMatrixVP[(u_xlati2 + 3) / 4][(u_xlati2 + 3) % 4] * u_xlat1.wwww + u_xlat3;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_WorldToLight[1];
					    u_xlat1 = unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1 = u_xlat0.yyyy * unity_WorldToShadow[1 / 4][1 % 4];
					    u_xlat1 = unity_WorldToShadow[0 / 4][0 % 4] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToShadow[2 / 4][2 % 4] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD6 = unity_WorldToShadow[3 / 4][3 % 4] * u_xlat0.wwww + u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[7];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[11];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_1_0[8];
						mat4x4 unity_WorldToShadow[4];
						vec4 unused_1_2[14];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_WorldToLight[1];
					    u_xlat1 = unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1 = u_xlat0.yyyy * unity_WorldToShadow[1 / 4][1 % 4];
					    u_xlat1 = unity_WorldToShadow[0 / 4][0 % 4] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToShadow[2 / 4][2 % 4] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD6 = unity_WorldToShadow[3 / 4][3 % 4] * u_xlat0.wwww + u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[7];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[11];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_1_0[8];
						mat4x4 unity_WorldToShadow[4];
						vec4 unused_1_2[14];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
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
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					int u_xlati2;
					vec4 u_xlat3;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati2 = unity_StereoEyeIndex << 2;
					    u_xlat3 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati2 + 1) / 4][(u_xlati2 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati2 / 4][u_xlati2 % 4] * u_xlat1.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati2 + 2) / 4][(u_xlati2 + 2) % 4] * u_xlat1.zzzz + u_xlat3;
					    gl_Position = unity_StereoMatrixVP[(u_xlati2 + 3) / 4][(u_xlati2 + 3) % 4] * u_xlat1.wwww + u_xlat3;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_WorldToLight[1];
					    u_xlat1 = unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1 = u_xlat0.yyyy * unity_WorldToShadow[1 / 4][1 % 4];
					    u_xlat1 = unity_WorldToShadow[0 / 4][0 % 4] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToShadow[2 / 4][2 % 4] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD6 = unity_WorldToShadow[3 / 4][3 % 4] * u_xlat0.wwww + u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerCamera {
						vec4 unused_0_0[5];
						vec4 _ProjectionParams;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD5.zw = u_xlat0.zw;
					    vs_TEXCOORD5.xy = u_xlat1.zz + u_xlat1.xw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerCamera {
						vec4 unused_0_0[4];
						vec4 _ProjectionParams;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[38];
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_2_4;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat5;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    u_xlat0 = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    u_xlat0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlati1 = unity_StereoEyeIndex;
					    u_xlat5.xy = u_xlat0.ww * unity_StereoScaleOffset[u_xlati1].zw;
					    vs_TEXCOORD5.xy = u_xlat0.xy * unity_StereoScaleOffset[u_xlati1].xy + u_xlat5.xy;
					    vs_TEXCOORD5.zw = u_xlat0.zw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[11];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD6;
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
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat1;
					    u_xlat2.xy = u_xlat0.yy * unity_WorldToLight[1].xy;
					    u_xlat2.xy = unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat2.xy;
					    u_xlat2.xy = unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat2.xy;
					    vs_TEXCOORD5.xy = unity_WorldToLight[3].xy * u_xlat0.ww + u_xlat2.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
					    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat0.x * 0.5;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD6.zw = u_xlat1.zw;
					    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[11];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
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
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					int u_xlati2;
					vec4 u_xlat3;
					int u_xlati8;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati2 = unity_StereoEyeIndex << 2;
					    u_xlat3 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati2 + 1) / 4][(u_xlati2 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati2 / 4][u_xlati2 % 4] * u_xlat1.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati2 + 2) / 4][(u_xlati2 + 2) % 4] * u_xlat1.zzzz + u_xlat3;
					    u_xlat1 = unity_StereoMatrixVP[(u_xlati2 + 3) / 4][(u_xlati2 + 3) % 4] * u_xlat1.wwww + u_xlat3;
					    gl_Position = u_xlat1;
					    u_xlat2.xy = u_xlat0.yy * unity_WorldToLight[1].xy;
					    u_xlat2.xy = unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat2.xy;
					    u_xlat2.xy = unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat2.xy;
					    vs_TEXCOORD5.xy = unity_WorldToLight[3].xy * u_xlat0.ww + u_xlat2.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
					    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat0.x * 0.5;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.zz + u_xlat0.xw;
					    u_xlati8 = unity_StereoEyeIndex;
					    u_xlat1.xy = u_xlat1.ww * unity_StereoScaleOffset[u_xlati8].zw;
					    vs_TEXCOORD6.xy = u_xlat0.xy * unity_StereoScaleOffset[u_xlati8].xy + u_xlat1.xy;
					    vs_TEXCOORD6.zw = u_xlat1.zw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[11];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0;
						vec4 _LightPositionRange;
						vec4 unused_1_2[46];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD5.xyz = unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[11];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0;
						vec4 _LightPositionRange;
						vec4 unused_1_2[46];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
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
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					int u_xlati2;
					vec4 u_xlat3;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati2 = unity_StereoEyeIndex << 2;
					    u_xlat3 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati2 + 1) / 4][(u_xlati2 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati2 / 4][u_xlati2 % 4] * u_xlat1.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati2 + 2) / 4][(u_xlati2 + 2) % 4] * u_xlat1.zzzz + u_xlat3;
					    gl_Position = unity_StereoMatrixVP[(u_xlati2 + 3) / 4][(u_xlati2 + 3) % 4] * u_xlat1.wwww + u_xlat3;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD5.xyz = unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[11];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0;
						vec4 _LightPositionRange;
						vec4 unused_1_2[46];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD5.xyz = unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[11];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0;
						vec4 _LightPositionRange;
						vec4 unused_1_2[46];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
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
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					int u_xlati2;
					vec4 u_xlat3;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati2 = unity_StereoEyeIndex << 2;
					    u_xlat3 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati2 + 1) / 4][(u_xlati2 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati2 / 4][u_xlati2 % 4] * u_xlat1.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati2 + 2) / 4][(u_xlati2 + 2) % 4] * u_xlat1.zzzz + u_xlat3;
					    gl_Position = unity_StereoMatrixVP[(u_xlati2 + 3) / 4][(u_xlati2 + 3) % 4] * u_xlat1.wwww + u_xlat3;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD5.xyz = unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[11];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0;
						vec4 _LightPositionRange;
						vec4 unused_1_2[46];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD5.xyz = unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[11];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0;
						vec4 _LightPositionRange;
						vec4 unused_1_2[46];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
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
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					int u_xlati2;
					vec4 u_xlat3;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati2 = unity_StereoEyeIndex << 2;
					    u_xlat3 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati2 + 1) / 4][(u_xlati2 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati2 / 4][u_xlati2 % 4] * u_xlat1.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati2 + 2) / 4][(u_xlati2 + 2) % 4] * u_xlat1.zzzz + u_xlat3;
					    gl_Position = unity_StereoMatrixVP[(u_xlati2 + 3) / 4][(u_xlati2 + 3) % 4] * u_xlat1.wwww + u_xlat3;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD5.xyz = unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[11];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0;
						vec4 _LightPositionRange;
						vec4 unused_1_2[46];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD5.xyz = unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[11];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0;
						vec4 _LightPositionRange;
						vec4 unused_1_2[46];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
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
					in  vec3 in_NORMAL0;
					in  vec4 in_TANGENT0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					int u_xlati2;
					vec4 u_xlat3;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati2 = unity_StereoEyeIndex << 2;
					    u_xlat3 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati2 + 1) / 4][(u_xlati2 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati2 / 4][u_xlati2 % 4] * u_xlat1.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati2 + 2) / 4][(u_xlati2 + 2) % 4] * u_xlat1.zzzz + u_xlat3;
					    gl_Position = unity_StereoMatrixVP[(u_xlati2 + 3) / 4][(u_xlati2 + 3) % 4] * u_xlat1.wwww + u_xlat3;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
					    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
					    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD5.xyz = unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
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
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _EffectBlackMatteImage;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat12 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_1 = texture(_LightTexture0, vec2(u_xlat12));
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_1.xxx;
					    SV_Target0.w = 0.0;
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
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _EffectBlackMatteImage;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					int u_xlati12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlati12 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati12].xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat12 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_1 = texture(_LightTexture0, vec2(u_xlat12));
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_1.xxx;
					    SV_Target0.w = 0.0;
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
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _EffectBlackMatteImage;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    SV_Target0.w = 0.0;
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
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _EffectBlackMatteImage;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					int u_xlati12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlati12 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati12].xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    SV_Target0.w = 0.0;
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
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler2D _EffectBlackMatteImage;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					bool u_xlatb12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat1.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xy);
					    u_xlatb12 = 0.0<vs_TEXCOORD5.z;
					    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
					    u_xlat12 = u_xlat10_1.w * u_xlat12;
					    u_xlat1.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_1 = texture(_LightTextureB0, u_xlat1.xx);
					    u_xlat12 = u_xlat12 * u_xlat10_1.x;
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    SV_Target0.w = 0.0;
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
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler2D _EffectBlackMatteImage;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					int u_xlati12;
					bool u_xlatb12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlati12 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati12].xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat1.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xy);
					    u_xlatb12 = 0.0<vs_TEXCOORD5.z;
					    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
					    u_xlat12 = u_xlat10_1.w * u_xlat12;
					    u_xlat1.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_1 = texture(_LightTextureB0, u_xlat1.xx);
					    u_xlat12 = u_xlat12 * u_xlat10_1.x;
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    SV_Target0.w = 0.0;
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
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler2D _EffectBlackMatteImage;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					float u_xlat16_12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat12 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_1 = texture(_LightTextureB0, vec2(u_xlat12));
					    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
					    u_xlat16_12 = u_xlat10_1.x * u_xlat10_2.w;
					    SV_Target0.xyz = vec3(u_xlat16_12) * u_xlat0.xyz;
					    SV_Target0.w = 0.0;
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
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler2D _EffectBlackMatteImage;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					float u_xlat16_12;
					int u_xlati12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlati12 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati12].xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat12 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_1 = texture(_LightTextureB0, vec2(u_xlat12));
					    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
					    u_xlat16_12 = u_xlat10_1.x * u_xlat10_2.w;
					    SV_Target0.xyz = vec3(u_xlat16_12) * u_xlat0.xyz;
					    SV_Target0.w = 0.0;
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
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _EffectBlackMatteImage;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD5;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat10_1 = texture(_LightTexture0, vs_TEXCOORD5.xy);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_1.www;
					    SV_Target0.w = 0.0;
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
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _EffectBlackMatteImage;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD5;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					int u_xlati12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlati12 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati12].xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat10_1 = texture(_LightTexture0, vs_TEXCOORD5.xy);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_1.www;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler2D _EffectBlackMatteImage;
					uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  sampler2D _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD5;
					in  vec4 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					bool u_xlatb12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat1.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xy);
					    u_xlatb12 = 0.0<vs_TEXCOORD5.z;
					    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
					    u_xlat12 = u_xlat10_1.w * u_xlat12;
					    u_xlat1.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_1 = texture(_LightTextureB0, u_xlat1.xx);
					    u_xlat12 = u_xlat12 * u_xlat10_1.x;
					    u_xlat1.xyz = vs_TEXCOORD6.xyz / vs_TEXCOORD6.www;
					    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
					    u_xlat10_1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat5.x = (-_LightShadowData.x) + 1.0;
					    u_xlat1.x = u_xlat10_1.x * u_xlat5.x + _LightShadowData.x;
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_4_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_4_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler2D _EffectBlackMatteImage;
					uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  sampler2D _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD5;
					in  vec4 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					int u_xlati12;
					bool u_xlatb12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlati12 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati12].xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat1.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xy);
					    u_xlatb12 = 0.0<vs_TEXCOORD5.z;
					    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
					    u_xlat12 = u_xlat10_1.w * u_xlat12;
					    u_xlat1.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_1 = texture(_LightTextureB0, u_xlat1.xx);
					    u_xlat12 = u_xlat12 * u_xlat10_1.x;
					    u_xlat1.xyz = vs_TEXCOORD6.xyz / vs_TEXCOORD6.www;
					    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
					    u_xlat10_1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat5.x = (-_LightShadowData.x) + 1.0;
					    u_xlat1.x = u_xlat10_1.x * u_xlat5.x + _LightShadowData.x;
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[6];
						vec4 _ShadowMapTexture_TexelSize;
						vec4 unused_0_2[4];
						vec4 _LightColor0;
						vec4 unused_0_4;
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_9[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_13;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler2D _EffectBlackMatteImage;
					uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  sampler2D _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD5;
					in  vec4 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					float u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					float u_xlat10_6;
					bool u_xlatb6;
					vec3 u_xlat7;
					float u_xlat12;
					float u_xlat10_12;
					vec2 u_xlat13;
					float u_xlat19;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD6.xyz / vs_TEXCOORD6.www;
					    u_xlat1.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat0.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat1.xy);
					    u_xlat13.xy = (-u_xlat0.xy) + vec2(1.0, 1.0);
					    u_xlat2.xy = min(u_xlat0.xy, vec2(0.0, 0.0));
					    u_xlat2.xy = (-u_xlat2.xy) * u_xlat2.xy + u_xlat13.xy;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat13.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
					    u_xlat4 = u_xlat0.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
					    u_xlat2.xz = (-u_xlat13.xy) * u_xlat13.xy + u_xlat4.yw;
					    u_xlat13.xy = u_xlat4.xz * u_xlat4.xz;
					    u_xlat3.z = u_xlat2.x;
					    u_xlat0.xy = u_xlat13.xy * vec2(0.5, 0.5) + (-u_xlat0.xy);
					    u_xlat3.x = u_xlat0.x;
					    u_xlat2.x = u_xlat0.y;
					    u_xlat3.w = u_xlat13.x;
					    u_xlat2.w = u_xlat13.y;
					    u_xlat2 = u_xlat2 * vec4(0.444440007, 0.444440007, 0.444440007, 0.222220004);
					    u_xlat3 = u_xlat3 * vec4(0.444440007, 0.444440007, 0.444440007, 0.222220004);
					    u_xlat4 = u_xlat3.ywyw + u_xlat3.xzxz;
					    u_xlat0.xy = u_xlat3.yw / u_xlat4.zw;
					    u_xlat0.xy = u_xlat0.xy + vec2(-1.5, 0.5);
					    u_xlat3.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.xx;
					    u_xlat5 = u_xlat2.yyww + u_xlat2.xxzz;
					    u_xlat0.xy = u_xlat2.yw / u_xlat5.yw;
					    u_xlat2 = u_xlat4 * u_xlat5;
					    u_xlat0.xy = u_xlat0.xy + vec2(-1.5, 0.5);
					    u_xlat3.zw = u_xlat0.xy * _ShadowMapTexture_TexelSize.yy;
					    u_xlat4 = u_xlat1.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat3.xzyz;
					    u_xlat1 = u_xlat1.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat3.xwyw;
					    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat0.z);
					    u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    vec3 txVec1 = vec3(u_xlat4.zw,u_xlat0.z);
					    u_xlat10_6 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
					    u_xlat6.x = u_xlat10_6 * u_xlat2.y;
					    u_xlat0.x = u_xlat2.x * u_xlat10_0 + u_xlat6.x;
					    vec3 txVec2 = vec3(u_xlat1.xy,u_xlat0.z);
					    u_xlat10_6 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
					    vec3 txVec3 = vec3(u_xlat1.zw,u_xlat0.z);
					    u_xlat10_12 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
					    u_xlat0.x = u_xlat2.z * u_xlat10_6 + u_xlat0.x;
					    u_xlat0.x = u_xlat2.w * u_xlat10_12 + u_xlat0.x;
					    u_xlat6.x = (-_LightShadowData.x) + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat6.x + _LightShadowData.x;
					    u_xlat6.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat6.xy = u_xlat6.xy + vec2(0.5, 0.5);
					    u_xlat10_1 = texture(_LightTexture0, u_xlat6.xy);
					    u_xlatb6 = 0.0<vs_TEXCOORD5.z;
					    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
					    u_xlat6.x = u_xlat10_1.w * u_xlat6.x;
					    u_xlat12 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_1 = texture(_LightTextureB0, vec2(u_xlat12));
					    u_xlat6.x = u_xlat6.x * u_xlat10_1.x;
					    u_xlat0.x = u_xlat0.x * u_xlat6.x;
					    u_xlat6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat6.x = inversesqrt(u_xlat6.x);
					    u_xlat6.xyz = u_xlat6.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat6.xyz = u_xlat6.xyz * u_xlat1.xxx;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat6.xyz = u_xlat10_1.zzz * u_xlat6.xyz + u_xlat1.xyw;
					    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat6.xyz = u_xlat6.xyz * u_xlat1.xxx;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat19) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat6.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat7.xyz = vec3(u_xlat19) * u_xlat2.xyz;
					    u_xlat2.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz;
					    u_xlat6.x = dot(u_xlat6.xyz, u_xlat2.xyz);
					    u_xlat6.x = max(u_xlat6.x, 0.0);
					    u_xlat6.x = log2(u_xlat6.x);
					    u_xlat12 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat6.x = u_xlat6.x * u_xlat12;
					    u_xlat6.x = exp2(u_xlat6.x);
					    u_xlat6.x = u_xlat6.x * u_xlat1.x;
					    u_xlat6.xyz = u_xlat6.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat7.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat7.xyz);
					    u_xlat7.x = _EffectStereoDepth + -0.5;
					    u_xlat7.x = u_xlat7.x * 0.0500000007;
					    u_xlat13.x = _EffectSpeed * _Time.x;
					    u_xlat13.xy = u_xlat13.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat7.xy = u_xlat7.xx * u_xlat2.xy + u_xlat13.xy;
					    u_xlat7.xy = u_xlat7.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat7.xy);
					    u_xlat7.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat6.xyz = u_xlat7.xyz * u_xlat1.xxx + u_xlat6.xyz;
					    u_xlat6.xyz = u_xlat6.xyz * _LightColor0.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat6.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[6];
						vec4 _ShadowMapTexture_TexelSize;
						vec4 unused_0_2[4];
						vec4 _LightColor0;
						vec4 unused_0_4;
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_9[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_13;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_4_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_4_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler2D _EffectBlackMatteImage;
					uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  sampler2D _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD5;
					in  vec4 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					float u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					float u_xlat10_6;
					bool u_xlatb6;
					vec3 u_xlat7;
					float u_xlat12;
					float u_xlat10_12;
					vec2 u_xlat13;
					float u_xlat19;
					int u_xlati19;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD6.xyz / vs_TEXCOORD6.www;
					    u_xlat1.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat0.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat1.xy);
					    u_xlat13.xy = (-u_xlat0.xy) + vec2(1.0, 1.0);
					    u_xlat2.xy = min(u_xlat0.xy, vec2(0.0, 0.0));
					    u_xlat2.xy = (-u_xlat2.xy) * u_xlat2.xy + u_xlat13.xy;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat13.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
					    u_xlat4 = u_xlat0.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
					    u_xlat2.xz = (-u_xlat13.xy) * u_xlat13.xy + u_xlat4.yw;
					    u_xlat13.xy = u_xlat4.xz * u_xlat4.xz;
					    u_xlat3.z = u_xlat2.x;
					    u_xlat0.xy = u_xlat13.xy * vec2(0.5, 0.5) + (-u_xlat0.xy);
					    u_xlat3.x = u_xlat0.x;
					    u_xlat2.x = u_xlat0.y;
					    u_xlat3.w = u_xlat13.x;
					    u_xlat2.w = u_xlat13.y;
					    u_xlat2 = u_xlat2 * vec4(0.444440007, 0.444440007, 0.444440007, 0.222220004);
					    u_xlat3 = u_xlat3 * vec4(0.444440007, 0.444440007, 0.444440007, 0.222220004);
					    u_xlat4 = u_xlat3.ywyw + u_xlat3.xzxz;
					    u_xlat0.xy = u_xlat3.yw / u_xlat4.zw;
					    u_xlat0.xy = u_xlat0.xy + vec2(-1.5, 0.5);
					    u_xlat3.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.xx;
					    u_xlat5 = u_xlat2.yyww + u_xlat2.xxzz;
					    u_xlat0.xy = u_xlat2.yw / u_xlat5.yw;
					    u_xlat2 = u_xlat4 * u_xlat5;
					    u_xlat0.xy = u_xlat0.xy + vec2(-1.5, 0.5);
					    u_xlat3.zw = u_xlat0.xy * _ShadowMapTexture_TexelSize.yy;
					    u_xlat4 = u_xlat1.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat3.xzyz;
					    u_xlat1 = u_xlat1.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat3.xwyw;
					    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat0.z);
					    u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    vec3 txVec1 = vec3(u_xlat4.zw,u_xlat0.z);
					    u_xlat10_6 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
					    u_xlat6.x = u_xlat10_6 * u_xlat2.y;
					    u_xlat0.x = u_xlat2.x * u_xlat10_0 + u_xlat6.x;
					    vec3 txVec2 = vec3(u_xlat1.xy,u_xlat0.z);
					    u_xlat10_6 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
					    vec3 txVec3 = vec3(u_xlat1.zw,u_xlat0.z);
					    u_xlat10_12 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
					    u_xlat0.x = u_xlat2.z * u_xlat10_6 + u_xlat0.x;
					    u_xlat0.x = u_xlat2.w * u_xlat10_12 + u_xlat0.x;
					    u_xlat6.x = (-_LightShadowData.x) + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat6.x + _LightShadowData.x;
					    u_xlat6.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat6.xy = u_xlat6.xy + vec2(0.5, 0.5);
					    u_xlat10_1 = texture(_LightTexture0, u_xlat6.xy);
					    u_xlatb6 = 0.0<vs_TEXCOORD5.z;
					    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
					    u_xlat6.x = u_xlat10_1.w * u_xlat6.x;
					    u_xlat12 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_1 = texture(_LightTextureB0, vec2(u_xlat12));
					    u_xlat6.x = u_xlat6.x * u_xlat10_1.x;
					    u_xlat0.x = u_xlat0.x * u_xlat6.x;
					    u_xlat6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat6.x = inversesqrt(u_xlat6.x);
					    u_xlat6.xyz = u_xlat6.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat6.xyz = u_xlat6.xyz * u_xlat1.xxx;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat6.xyz = u_xlat10_1.zzz * u_xlat6.xyz + u_xlat1.xyw;
					    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat6.xyz = u_xlat6.xyz * u_xlat1.xxx;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
					    u_xlati19 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati19].xyz;
					    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat19) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat6.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat7.xyz = vec3(u_xlat19) * u_xlat2.xyz;
					    u_xlat2.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz;
					    u_xlat6.x = dot(u_xlat6.xyz, u_xlat2.xyz);
					    u_xlat6.x = max(u_xlat6.x, 0.0);
					    u_xlat6.x = log2(u_xlat6.x);
					    u_xlat12 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat6.x = u_xlat6.x * u_xlat12;
					    u_xlat6.x = exp2(u_xlat6.x);
					    u_xlat6.x = u_xlat6.x * u_xlat1.x;
					    u_xlat6.xyz = u_xlat6.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat7.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat7.xyz);
					    u_xlat7.x = _EffectStereoDepth + -0.5;
					    u_xlat7.x = u_xlat7.x * 0.0500000007;
					    u_xlat13.x = _EffectSpeed * _Time.x;
					    u_xlat13.xy = u_xlat13.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat7.xy = u_xlat7.xx * u_xlat2.xy + u_xlat13.xy;
					    u_xlat7.xy = u_xlat7.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat7.xy);
					    u_xlat7.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat6.xyz = u_xlat7.xyz * u_xlat1.xxx + u_xlat6.xyz;
					    u_xlat6.xyz = u_xlat6.xyz * _LightColor0.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat6.xyz;
					    SV_Target0.w = 0.0;
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
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _EffectBlackMatteImage;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat1.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat10_1 = texture(_ShadowMapTexture, u_xlat1.xy);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_1.xxx;
					    SV_Target0.w = 0.0;
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
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _EffectBlackMatteImage;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					int u_xlati12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlati12 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati12].xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat1.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat10_1 = texture(_ShadowMapTexture, u_xlat1.xy);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_1.xxx;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _EffectBlackMatteImage;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD5;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					float u_xlat16_12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat1.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
					    u_xlat10_1 = texture(_ShadowMapTexture, u_xlat1.xy);
					    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD5.xy);
					    u_xlat16_12 = u_xlat10_1.x * u_xlat10_2.w;
					    SV_Target0.xyz = vec3(u_xlat16_12) * u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _EffectBlackMatteImage;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD5;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					float u_xlat16_12;
					int u_xlati12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlati12 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati12].xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat1.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
					    u_xlat10_1 = texture(_ShadowMapTexture, u_xlat1.xy);
					    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD5.xy);
					    u_xlat16_12 = u_xlat10_1.x * u_xlat10_2.w;
					    SV_Target0.xyz = vec3(u_xlat16_12) * u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1;
						vec4 _LightProjectionParams;
						vec4 unused_2_3[45];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _EffectBlackMatteImage;
					uniform  samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  samplerCube _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					float u_xlat10_12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat12 = max(abs(vs_TEXCOORD6.y), abs(vs_TEXCOORD6.x));
					    u_xlat12 = max(u_xlat12, abs(vs_TEXCOORD6.z));
					    u_xlat12 = u_xlat12 + (-_LightProjectionParams.z);
					    u_xlat12 = max(u_xlat12, 9.99999975e-06);
					    u_xlat12 = u_xlat12 * _LightProjectionParams.w;
					    u_xlat12 = _LightProjectionParams.y / u_xlat12;
					    u_xlat12 = u_xlat12 + (-_LightProjectionParams.x);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    vec4 txVec0 = vec4(vs_TEXCOORD6.xyz,u_xlat12);
					    u_xlat10_12 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat1.x = (-_LightShadowData.x) + 1.0;
					    u_xlat12 = u_xlat10_12 * u_xlat1.x + _LightShadowData.x;
					    u_xlat1.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xx);
					    u_xlat12 = u_xlat12 * u_xlat10_1.x;
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1;
						vec4 _LightProjectionParams;
						vec4 unused_2_3[45];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_4_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_4_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _EffectBlackMatteImage;
					uniform  samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  samplerCube _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					float u_xlat10_12;
					int u_xlati12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlati12 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati12].xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat12 = max(abs(vs_TEXCOORD6.y), abs(vs_TEXCOORD6.x));
					    u_xlat12 = max(u_xlat12, abs(vs_TEXCOORD6.z));
					    u_xlat12 = u_xlat12 + (-_LightProjectionParams.z);
					    u_xlat12 = max(u_xlat12, 9.99999975e-06);
					    u_xlat12 = u_xlat12 * _LightProjectionParams.w;
					    u_xlat12 = _LightProjectionParams.y / u_xlat12;
					    u_xlat12 = u_xlat12 + (-_LightProjectionParams.x);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    vec4 txVec0 = vec4(vs_TEXCOORD6.xyz,u_xlat12);
					    u_xlat10_12 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat1.x = (-_LightShadowData.x) + 1.0;
					    u_xlat12 = u_xlat10_12 * u_xlat1.x + _LightShadowData.x;
					    u_xlat1.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xx);
					    u_xlat12 = u_xlat12 * u_xlat10_1.x;
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1;
						vec4 _LightProjectionParams;
						vec4 unused_2_3[45];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _EffectBlackMatteImage;
					uniform  samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  samplerCube _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat12 = max(abs(vs_TEXCOORD6.y), abs(vs_TEXCOORD6.x));
					    u_xlat12 = max(u_xlat12, abs(vs_TEXCOORD6.z));
					    u_xlat12 = u_xlat12 + (-_LightProjectionParams.z);
					    u_xlat12 = max(u_xlat12, 9.99999975e-06);
					    u_xlat12 = u_xlat12 * _LightProjectionParams.w;
					    u_xlat12 = _LightProjectionParams.y / u_xlat12;
					    u_xlat12 = u_xlat12 + (-_LightProjectionParams.x);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat1.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
					    vec4 txVec0 = vec4(u_xlat1.xyz,u_xlat12);
					    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat2.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
					    vec4 txVec1 = vec4(u_xlat2.xyz,u_xlat12);
					    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
					    u_xlat2.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
					    vec4 txVec2 = vec4(u_xlat2.xyz,u_xlat12);
					    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
					    u_xlat2.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
					    vec4 txVec3 = vec4(u_xlat2.xyz,u_xlat12);
					    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
					    u_xlat12 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
					    u_xlat1.x = (-_LightShadowData.x) + 1.0;
					    u_xlat12 = u_xlat12 * u_xlat1.x + _LightShadowData.x;
					    u_xlat1.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xx);
					    u_xlat12 = u_xlat12 * u_xlat10_1.x;
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1;
						vec4 _LightProjectionParams;
						vec4 unused_2_3[45];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_4_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_4_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _EffectBlackMatteImage;
					uniform  samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  samplerCube _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					int u_xlati12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlati12 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati12].xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat12 = max(abs(vs_TEXCOORD6.y), abs(vs_TEXCOORD6.x));
					    u_xlat12 = max(u_xlat12, abs(vs_TEXCOORD6.z));
					    u_xlat12 = u_xlat12 + (-_LightProjectionParams.z);
					    u_xlat12 = max(u_xlat12, 9.99999975e-06);
					    u_xlat12 = u_xlat12 * _LightProjectionParams.w;
					    u_xlat12 = _LightProjectionParams.y / u_xlat12;
					    u_xlat12 = u_xlat12 + (-_LightProjectionParams.x);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat1.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
					    vec4 txVec0 = vec4(u_xlat1.xyz,u_xlat12);
					    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat2.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
					    vec4 txVec1 = vec4(u_xlat2.xyz,u_xlat12);
					    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
					    u_xlat2.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
					    vec4 txVec2 = vec4(u_xlat2.xyz,u_xlat12);
					    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
					    u_xlat2.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
					    vec4 txVec3 = vec4(u_xlat2.xyz,u_xlat12);
					    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
					    u_xlat12 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
					    u_xlat1.x = (-_LightShadowData.x) + 1.0;
					    u_xlat12 = u_xlat12 * u_xlat1.x + _LightShadowData.x;
					    u_xlat1.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xx);
					    u_xlat12 = u_xlat12 * u_xlat10_1.x;
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1;
						vec4 _LightProjectionParams;
						vec4 unused_2_3[45];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler2D _EffectBlackMatteImage;
					uniform  samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  samplerCube _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					float u_xlat10_12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat12 = max(abs(vs_TEXCOORD6.y), abs(vs_TEXCOORD6.x));
					    u_xlat12 = max(u_xlat12, abs(vs_TEXCOORD6.z));
					    u_xlat12 = u_xlat12 + (-_LightProjectionParams.z);
					    u_xlat12 = max(u_xlat12, 9.99999975e-06);
					    u_xlat12 = u_xlat12 * _LightProjectionParams.w;
					    u_xlat12 = _LightProjectionParams.y / u_xlat12;
					    u_xlat12 = u_xlat12 + (-_LightProjectionParams.x);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    vec4 txVec0 = vec4(vs_TEXCOORD6.xyz,u_xlat12);
					    u_xlat10_12 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat1.x = (-_LightShadowData.x) + 1.0;
					    u_xlat12 = u_xlat10_12 * u_xlat1.x + _LightShadowData.x;
					    u_xlat1.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_1 = texture(_LightTextureB0, u_xlat1.xx);
					    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
					    u_xlat16_1 = u_xlat10_1.x * u_xlat10_2.w;
					    u_xlat12 = u_xlat12 * u_xlat16_1;
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1;
						vec4 _LightProjectionParams;
						vec4 unused_2_3[45];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_4_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_4_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler2D _EffectBlackMatteImage;
					uniform  samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  samplerCube _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					float u_xlat10_12;
					int u_xlati12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlati12 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati12].xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat12 = max(abs(vs_TEXCOORD6.y), abs(vs_TEXCOORD6.x));
					    u_xlat12 = max(u_xlat12, abs(vs_TEXCOORD6.z));
					    u_xlat12 = u_xlat12 + (-_LightProjectionParams.z);
					    u_xlat12 = max(u_xlat12, 9.99999975e-06);
					    u_xlat12 = u_xlat12 * _LightProjectionParams.w;
					    u_xlat12 = _LightProjectionParams.y / u_xlat12;
					    u_xlat12 = u_xlat12 + (-_LightProjectionParams.x);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    vec4 txVec0 = vec4(vs_TEXCOORD6.xyz,u_xlat12);
					    u_xlat10_12 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat1.x = (-_LightShadowData.x) + 1.0;
					    u_xlat12 = u_xlat10_12 * u_xlat1.x + _LightShadowData.x;
					    u_xlat1.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_1 = texture(_LightTextureB0, u_xlat1.xx);
					    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
					    u_xlat16_1 = u_xlat10_1.x * u_xlat10_2.w;
					    u_xlat12 = u_xlat12 * u_xlat16_1;
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1;
						vec4 _LightProjectionParams;
						vec4 unused_2_3[45];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler2D _EffectBlackMatteImage;
					uniform  samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  samplerCube _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat12 = max(abs(vs_TEXCOORD6.y), abs(vs_TEXCOORD6.x));
					    u_xlat12 = max(u_xlat12, abs(vs_TEXCOORD6.z));
					    u_xlat12 = u_xlat12 + (-_LightProjectionParams.z);
					    u_xlat12 = max(u_xlat12, 9.99999975e-06);
					    u_xlat12 = u_xlat12 * _LightProjectionParams.w;
					    u_xlat12 = _LightProjectionParams.y / u_xlat12;
					    u_xlat12 = u_xlat12 + (-_LightProjectionParams.x);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat1.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
					    vec4 txVec0 = vec4(u_xlat1.xyz,u_xlat12);
					    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat2.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
					    vec4 txVec1 = vec4(u_xlat2.xyz,u_xlat12);
					    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
					    u_xlat2.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
					    vec4 txVec2 = vec4(u_xlat2.xyz,u_xlat12);
					    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
					    u_xlat2.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
					    vec4 txVec3 = vec4(u_xlat2.xyz,u_xlat12);
					    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
					    u_xlat12 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
					    u_xlat1.x = (-_LightShadowData.x) + 1.0;
					    u_xlat12 = u_xlat12 * u_xlat1.x + _LightShadowData.x;
					    u_xlat1.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_1 = texture(_LightTextureB0, u_xlat1.xx);
					    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
					    u_xlat16_1 = u_xlat10_1.x * u_xlat10_2.w;
					    u_xlat12 = u_xlat12 * u_xlat16_1;
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _EffectBlackMatteImage_ST;
						vec4 _EffectHueAdjust;
						float _AvatarsSmoothness;
						vec4 _AvatarsSpecular;
						vec4 unused_0_7[2];
						float _EffectSpeed;
						float _EffectStereoDepth;
						vec4 _AvatarsNormal_ST;
						vec4 unused_0_11;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1;
						vec4 _LightProjectionParams;
						vec4 unused_2_3[45];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_4_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_4_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _AvatarsNormal;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler2D _EffectBlackMatteImage;
					uniform  samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  samplerCube _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					float u_xlat12;
					int u_xlati12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat12 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? 1.0 : -1.0;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _AvatarsNormal_ST.xy + _AvatarsNormal_ST.zw;
					    u_xlat10_1 = texture(_AvatarsNormal, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat10_1.yyy * vs_TEXCOORD4.xyz;
					    u_xlat1.xyw = u_xlat10_1.xxx * vs_TEXCOORD3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat10_1.zzz * u_xlat0.xyz + u_xlat1.xyw;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlati12 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati12].xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat4 = _AvatarsSmoothness * 10.0 + 1.0;
					    u_xlat4 = exp2(u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _AvatarsSpecular.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD4.xyz, u_xlat5.xyz);
					    u_xlat12 = _EffectStereoDepth + -0.5;
					    u_xlat12 = u_xlat12 * 0.0500000007;
					    u_xlat5.x = _EffectSpeed * _Time.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
					    u_xlat5.xy = vec2(u_xlat12) * u_xlat2.xy + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy * _EffectBlackMatteImage_ST.xy + _EffectBlackMatteImage_ST.zw;
					    u_xlat10_2 = texture(_EffectBlackMatteImage, u_xlat5.xy);
					    u_xlat5.xyz = u_xlat10_2.xyz * _EffectHueAdjust.xyz;
					    u_xlat0.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat12 = max(abs(vs_TEXCOORD6.y), abs(vs_TEXCOORD6.x));
					    u_xlat12 = max(u_xlat12, abs(vs_TEXCOORD6.z));
					    u_xlat12 = u_xlat12 + (-_LightProjectionParams.z);
					    u_xlat12 = max(u_xlat12, 9.99999975e-06);
					    u_xlat12 = u_xlat12 * _LightProjectionParams.w;
					    u_xlat12 = _LightProjectionParams.y / u_xlat12;
					    u_xlat12 = u_xlat12 + (-_LightProjectionParams.x);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat1.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
					    vec4 txVec0 = vec4(u_xlat1.xyz,u_xlat12);
					    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat2.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
					    vec4 txVec1 = vec4(u_xlat2.xyz,u_xlat12);
					    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
					    u_xlat2.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
					    vec4 txVec2 = vec4(u_xlat2.xyz,u_xlat12);
					    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
					    u_xlat2.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
					    vec4 txVec3 = vec4(u_xlat2.xyz,u_xlat12);
					    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
					    u_xlat12 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
					    u_xlat1.x = (-_LightShadowData.x) + 1.0;
					    u_xlat12 = u_xlat12 * u_xlat1.x + _LightShadowData.x;
					    u_xlat1.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_1 = texture(_LightTextureB0, u_xlat1.xx);
					    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
					    u_xlat16_1 = u_xlat10_1.x * u_xlat10_2.w;
					    u_xlat12 = u_xlat12 * u_xlat16_1;
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
			}
		}
		Pass {
			Name "SHADOWCASTER"
			Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
			Cull Off
			Offset 1, 1
			GpuProgramID 166268
			Program "vp" {
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityShadows {
						vec4 unused_0_0[5];
						vec4 unity_LightShadowBias;
						vec4 unused_0_2[20];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[6];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat4;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
					    u_xlat1.x = min(u_xlat1.x, 0.0);
					    u_xlat1.x = max(u_xlat1.x, -1.0);
					    u_xlat4 = u_xlat0.z + u_xlat1.x;
					    u_xlat1.x = min(u_xlat0.w, u_xlat4);
					    gl_Position.xyw = u_xlat0.xyw;
					    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
					    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityShadows {
						vec4 unused_0_0[5];
						vec4 unity_LightShadowBias;
						vec4 unused_0_2[20];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[6];
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
					vec4 u_xlat0;
					float u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlati1 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat0.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat0.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat0.zzzz + u_xlat2;
					    u_xlat0 = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat0.wwww + u_xlat2;
					    u_xlat1 = unity_LightShadowBias.x / u_xlat0.w;
					    u_xlat1 = min(u_xlat1, 0.0);
					    u_xlat1 = max(u_xlat1, -1.0);
					    u_xlat6 = u_xlat0.z + u_xlat1;
					    u_xlat1 = min(u_xlat0.w, u_xlat6);
					    gl_Position.xyw = u_xlat0.xyw;
					    u_xlat0.x = (-u_xlat6) + u_xlat1;
					    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityShadows {
						vec4 unused_0_0[5];
						vec4 unity_LightShadowBias;
						vec4 unused_0_2[20];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[6];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = min(u_xlat0.w, u_xlat0.z);
					    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
					    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
					    gl_Position.xyw = u_xlat0.xyw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityShadows {
						vec4 unused_0_0[5];
						vec4 unity_LightShadowBias;
						vec4 unused_0_2[20];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[6];
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
					vec4 u_xlat0;
					float u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlati1 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat0.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat0.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat0.zzzz + u_xlat2;
					    u_xlat0 = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat0.wwww + u_xlat2;
					    u_xlat1 = min(u_xlat0.w, u_xlat0.z);
					    u_xlat1 = (-u_xlat0.z) + u_xlat1;
					    gl_Position.z = unity_LightShadowBias.y * u_xlat1 + u_xlat0.z;
					    gl_Position.xyw = u_xlat0.xyw;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
			}
		}
	}
	Fallback "Diffuse"
	CustomEditor "ShaderForgeMaterialInspector"
}