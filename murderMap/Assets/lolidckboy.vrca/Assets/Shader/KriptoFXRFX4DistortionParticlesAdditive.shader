Shader "KriptoFX/RFX4/DistortionParticlesAdditive" {
	Properties {
		[HDR] _TintColor ("Tint Color", Vector) = (0.5,0.5,0.5,0.5)
		_FrontColor ("Front Color", Range(0, 1)) = 0.2
		_AlphaDistort ("Alpha Distort", Range(0, 1)) = 0
		_MainTex ("Main Texture", 2D) = "black" {}
		_BumpTex ("Normalmap (RG) & Alpha (A)", 2D) = "black" {}
		_BumpAmt ("Distortion", Float) = 10
		_InvFade ("Soft Particles Factor", Float) = 0.5
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "ALWAYS" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha One, SrcAlpha One
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 57537
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_ST;
						vec4 unused_0_2[2];
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
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
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
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_COLOR0 = in_COLOR0;
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
						vec4 unused_0_0[2];
						vec4 _MainTex_ST;
						vec4 unused_0_2[2];
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
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
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
					    gl_Position = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat0.wwww + u_xlat2;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SOFTPARTICLES_ON" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_ST;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[9];
						mat4x4 unity_MatrixV;
						vec4 unused_3_2[4];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat2 = u_xlat0.y * unity_MatrixV[1].z;
					    u_xlat0.x = unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
					    u_xlat0.x = unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    vs_TEXCOORD3.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat0.x * 0.5;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD3.w = u_xlat1.w;
					    vs_TEXCOORD3.xy = u_xlat0.zz + u_xlat0.xw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SOFTPARTICLES_ON" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_ST;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[8];
						mat4x4 unity_StereoMatrixV[2];
						vec4 unused_3_2[12];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_4[38];
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_3_6;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec2 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					float u_xlat3;
					int u_xlati6;
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
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat0.wwww + u_xlat2;
					    gl_Position = u_xlat2;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat3 = u_xlat0.y * unity_StereoMatrixV[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4].z;
					    u_xlat0.x = unity_StereoMatrixV[u_xlati1 / 4][u_xlati1 % 4].z * u_xlat0.x + u_xlat3;
					    u_xlat0.x = unity_StereoMatrixV[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = unity_StereoMatrixV[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4].z * u_xlat0.w + u_xlat0.x;
					    vs_TEXCOORD3.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat2.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat0.x * 0.5;
					    u_xlat0.xz = u_xlat2.xw * vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.zz + u_xlat0.xw;
					    u_xlati6 = unity_StereoEyeIndex;
					    u_xlat1.xy = u_xlat2.ww * unity_StereoScaleOffset[u_xlati6].zw;
					    vs_TEXCOORD3.xy = u_xlat0.xy * unity_StereoScaleOffset[u_xlati6].xy + u_xlat1.xy;
					    vs_TEXCOORD3.w = u_xlat2.w;
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
						vec4 unused_0_0[3];
						vec4 _TintColor;
						vec4 unused_0_2;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat0 = u_xlat10_0 * _TintColor;
					    u_xlat0 = u_xlat0 * vec4(5.0, 5.0, 5.0, 5.0);
					    SV_Target0 = u_xlat0 * vs_COLOR0.wwww;
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
						vec4 unused_0_0[3];
						vec4 _TintColor;
						vec4 unused_0_2;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat0 = u_xlat10_0 * _TintColor;
					    u_xlat0 = u_xlat0 * vec4(5.0, 5.0, 5.0, 5.0);
					    SV_Target0 = u_xlat0 * vs_COLOR0.wwww;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SOFTPARTICLES_ON" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[3];
						vec4 _TintColor;
						float _InvFade;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					float u_xlat2;
					bool u_xlatb2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD3.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x + -1.0;
					    u_xlatb2 = _InvFade>=0.00100000005;
					    u_xlat2 = u_xlatb2 ? 1.0 : float(0.0);
					    u_xlat0.x = u_xlat2 * u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat1 = u_xlat10_1 * _TintColor;
					    u_xlat1 = u_xlat1 * vec4(5.0, 5.0, 5.0, 5.0);
					    SV_Target0 = u_xlat0.xxxx * u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SOFTPARTICLES_ON" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[3];
						vec4 _TintColor;
						float _InvFade;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[6];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					float u_xlat2;
					bool u_xlatb2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD3.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x + -1.0;
					    u_xlatb2 = _InvFade>=0.00100000005;
					    u_xlat2 = u_xlatb2 ? 1.0 : float(0.0);
					    u_xlat0.x = u_xlat2 * u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat1 = u_xlat10_1 * _TintColor;
					    u_xlat1 = u_xlat1 * vec4(5.0, 5.0, 5.0, 5.0);
					    SV_Target0 = u_xlat0.xxxx * u_xlat1;
					    return;
					}"
				}
			}
		}
		GrabPass {
		}
		Pass {
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "ALWAYS" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 98794
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						vec4 _BumpTex_ST;
						vec4 _MainTex_ST;
						vec4 unused_0_3[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.z = u_xlat1.w / u_xlat0.x;
					    u_xlat0.xy = u_xlat1.xy * vec2(1.0, -1.0) + u_xlat1.ww;
					    vs_TEXCOORD0.w = u_xlat1.w;
					    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BumpTex_ST.xy + _BumpTex_ST.zw;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_COLOR0 = in_COLOR0;
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
						vec4 unused_0_0[4];
						vec4 _BumpTex_ST;
						vec4 _MainTex_ST;
						vec4 unused_0_3[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[6];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_4;
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_2_6;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					int u_xlati9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlati9 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati9 + 1) / 4][(u_xlati9 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati9 / 4][u_xlati9 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati9 + 2) / 4][(u_xlati9 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_StereoMatrixVP[(u_xlati9 + 3) / 4][(u_xlati9 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat1;
					    u_xlat1.xy = u_xlat1.xy * vec2(1.0, -1.0) + u_xlat1.ww;
					    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5);
					    u_xlati9 = unity_StereoEyeIndex;
					    u_xlat2.xy = u_xlat1.ww * unity_StereoScaleOffset[u_xlati9].zw;
					    vs_TEXCOORD0.xy = u_xlat1.xy * unity_StereoScaleOffset[u_xlati9].xy + u_xlat2.xy;
					    u_xlat0.xyz = (-u_xlat0.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati9].xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    vs_TEXCOORD0.z = u_xlat1.w / u_xlat0.x;
					    vs_TEXCOORD0.w = u_xlat1.w;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BumpTex_ST.xy + _BumpTex_ST.zw;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SOFTPARTICLES_ON" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						vec4 _BumpTex_ST;
						vec4 _MainTex_ST;
						vec4 unused_0_3[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[9];
						mat4x4 unity_MatrixV;
						vec4 unused_3_2[4];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat2 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat2;
					    vs_TEXCOORD0.z = u_xlat2.w / u_xlat0.x;
					    u_xlat0.xy = u_xlat2.xy * vec2(1.0, -1.0) + u_xlat2.ww;
					    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    vs_TEXCOORD0.w = u_xlat2.w;
					    vs_TEXCOORD3.w = u_xlat2.w;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BumpTex_ST.xy + _BumpTex_ST.zw;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat0.x = u_xlat1.y * unity_MatrixV[1].z;
					    u_xlat0.x = unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
					    vs_TEXCOORD3.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat2.y * _ProjectionParams.x;
					    u_xlat1.xz = u_xlat2.xw * vec2(0.5, 0.5);
					    u_xlat1.w = u_xlat0.x * 0.5;
					    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SOFTPARTICLES_ON" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						vec4 _BumpTex_ST;
						vec4 _MainTex_ST;
						vec4 unused_0_3[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[8];
						mat4x4 unity_StereoMatrixV[2];
						vec4 unused_3_2[12];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_4[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_6;
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_3_8;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					int u_xlati10;
					vec2 u_xlat11;
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
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati12 + 3) / 4][(u_xlati12 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat2;
					    u_xlat3.xy = u_xlat2.xy * vec2(1.0, -1.0) + u_xlat2.ww;
					    u_xlat3.xy = u_xlat3.xy * vec2(0.5, 0.5);
					    u_xlati10 = unity_StereoEyeIndex;
					    u_xlat11.xy = u_xlat2.ww * unity_StereoScaleOffset[u_xlati10].zw;
					    vs_TEXCOORD0.xy = u_xlat3.xy * unity_StereoScaleOffset[u_xlati10].xy + u_xlat11.xy;
					    u_xlat0.xyz = (-u_xlat0.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati10].xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    vs_TEXCOORD0.z = u_xlat2.w / u_xlat0.x;
					    vs_TEXCOORD0.w = u_xlat2.w;
					    vs_TEXCOORD3.w = u_xlat2.w;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BumpTex_ST.xy + _BumpTex_ST.zw;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat0.x = u_xlat1.y * unity_StereoMatrixV[(u_xlati12 + 1) / 4][(u_xlati12 + 1) % 4].z;
					    u_xlat0.x = unity_StereoMatrixV[u_xlati12 / 4][u_xlati12 % 4].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = unity_StereoMatrixV[(u_xlati12 + 2) / 4][(u_xlati12 + 2) % 4].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = unity_StereoMatrixV[(u_xlati12 + 3) / 4][(u_xlati12 + 3) % 4].z * u_xlat1.w + u_xlat0.x;
					    vs_TEXCOORD3.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat2.y * _ProjectionParams.x;
					    u_xlat1.xz = u_xlat2.xw * vec2(0.5, 0.5);
					    u_xlat1.w = u_xlat0.x * 0.5;
					    u_xlat0.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3.xy = u_xlat0.xy * unity_StereoScaleOffset[u_xlati10].xy + u_xlat11.xy;
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
						vec4 unused_0_0[2];
						float _BumpAmt;
						vec4 _GrabTexture_TexelSize;
						vec4 unused_0_3[2];
						vec4 _TintColor;
						vec4 unused_0_5;
					};
					uniform  sampler2D _BumpTex;
					uniform  sampler2D _GrabTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat10_1;
					float u_xlat2;
					float u_xlat4;
					void main()
					{
					    u_xlat0 = texture(_BumpTex, vs_TEXCOORD1.xy);
					    u_xlat0.x = u_xlat0.w * u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat4 = u_xlat0.y + u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(_BumpAmt);
					    u_xlat0.xy = u_xlat0.xy * _GrabTexture_TexelSize.xy;
					    u_xlat0.xy = u_xlat0.xy * vs_COLOR0.ww;
					    u_xlat0.xy = u_xlat0.xy * _TintColor.ww;
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD0.zz + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_1 = texture(_GrabTexture, u_xlat0.xy);
					    u_xlat0.x = abs(u_xlat4) + -0.00999999978;
					    u_xlat2 = u_xlat0.x * 25.0 + -0.100000001;
					    u_xlat0.x = u_xlat0.x * 25.0;
					    SV_Target0.w = u_xlat0.x * u_xlat10_1.w;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat10_1.xyz;
					    u_xlatb0 = u_xlat2<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
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
						vec4 unused_0_0[2];
						float _BumpAmt;
						vec4 _GrabTexture_TexelSize;
						vec4 unused_0_3[2];
						vec4 _TintColor;
						vec4 unused_0_5;
					};
					uniform  sampler2D _BumpTex;
					uniform  sampler2D _GrabTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat10_1;
					float u_xlat2;
					float u_xlat4;
					void main()
					{
					    u_xlat0 = texture(_BumpTex, vs_TEXCOORD1.xy);
					    u_xlat0.x = u_xlat0.w * u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat4 = u_xlat0.y + u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(_BumpAmt);
					    u_xlat0.xy = u_xlat0.xy * _GrabTexture_TexelSize.xy;
					    u_xlat0.xy = u_xlat0.xy * vs_COLOR0.ww;
					    u_xlat0.xy = u_xlat0.xy * _TintColor.ww;
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD0.zz + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_1 = texture(_GrabTexture, u_xlat0.xy);
					    u_xlat0.x = abs(u_xlat4) + -0.00999999978;
					    u_xlat2 = u_xlat0.x * 25.0 + -0.100000001;
					    u_xlat0.x = u_xlat0.x * 25.0;
					    SV_Target0.w = u_xlat0.x * u_xlat10_1.w;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat10_1.xyz;
					    u_xlatb0 = u_xlat2<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SOFTPARTICLES_ON" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _BumpAmt;
						vec4 _GrabTexture_TexelSize;
						vec4 unused_0_3[2];
						vec4 _TintColor;
						float _InvFade;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _BumpTex;
					uniform  sampler2D _GrabTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					float u_xlat4;
					float u_xlat6;
					bool u_xlatb6;
					void main()
					{
					    u_xlat0 = texture(_BumpTex, vs_TEXCOORD1.xy);
					    u_xlat0.x = u_xlat0.w * u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat4 = u_xlat0.y + u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(_BumpAmt);
					    u_xlat0.xy = u_xlat0.xy * _GrabTexture_TexelSize.xy;
					    u_xlat4 = abs(u_xlat4) + -0.00999999978;
					    u_xlat6 = u_xlat4 * 25.0 + -0.100000001;
					    u_xlat4 = u_xlat4 * 25.0;
					    u_xlatb6 = u_xlat6<0.0;
					    if(((int(u_xlatb6) * int(0xffffffffu)))!=0){discard;}
					    u_xlat1.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat10_1 = texture(_CameraDepthTexture, u_xlat1.xy);
					    u_xlat6 = _ZBufferParams.z * u_xlat10_1.x + _ZBufferParams.w;
					    u_xlat6 = float(1.0) / u_xlat6;
					    u_xlat6 = u_xlat6 + (-vs_TEXCOORD3.z);
					    u_xlat6 = u_xlat6 * _InvFade;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    u_xlat6 = u_xlat6 + -1.0;
					    u_xlatb1 = _InvFade>=0.00100000005;
					    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
					    u_xlat6 = u_xlat1.x * u_xlat6 + 1.0;
					    u_xlat6 = u_xlat6 * vs_COLOR0.w;
					    u_xlat0.xy = vec2(u_xlat6) * u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy * _TintColor.ww;
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD0.zz + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_1 = texture(_GrabTexture, u_xlat0.xy);
					    SV_Target0.w = u_xlat4 * u_xlat10_1.w;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat10_1.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SOFTPARTICLES_ON" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _BumpAmt;
						vec4 _GrabTexture_TexelSize;
						vec4 unused_0_3[2];
						vec4 _TintColor;
						float _InvFade;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[6];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _BumpTex;
					uniform  sampler2D _GrabTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					float u_xlat4;
					float u_xlat6;
					bool u_xlatb6;
					void main()
					{
					    u_xlat0 = texture(_BumpTex, vs_TEXCOORD1.xy);
					    u_xlat0.x = u_xlat0.w * u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat4 = u_xlat0.y + u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(_BumpAmt);
					    u_xlat0.xy = u_xlat0.xy * _GrabTexture_TexelSize.xy;
					    u_xlat4 = abs(u_xlat4) + -0.00999999978;
					    u_xlat6 = u_xlat4 * 25.0 + -0.100000001;
					    u_xlat4 = u_xlat4 * 25.0;
					    u_xlatb6 = u_xlat6<0.0;
					    if(((int(u_xlatb6) * int(0xffffffffu)))!=0){discard;}
					    u_xlat1.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat10_1 = texture(_CameraDepthTexture, u_xlat1.xy);
					    u_xlat6 = _ZBufferParams.z * u_xlat10_1.x + _ZBufferParams.w;
					    u_xlat6 = float(1.0) / u_xlat6;
					    u_xlat6 = u_xlat6 + (-vs_TEXCOORD3.z);
					    u_xlat6 = u_xlat6 * _InvFade;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    u_xlat6 = u_xlat6 + -1.0;
					    u_xlatb1 = _InvFade>=0.00100000005;
					    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
					    u_xlat6 = u_xlat1.x * u_xlat6 + 1.0;
					    u_xlat6 = u_xlat6 * vs_COLOR0.w;
					    u_xlat0.xy = vec2(u_xlat6) * u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy * _TintColor.ww;
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD0.zz + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_1 = texture(_GrabTexture, u_xlat0.xy);
					    SV_Target0.w = u_xlat4 * u_xlat10_1.w;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat10_1.xyz;
					    return;
					}"
				}
			}
		}
	}
}