Shader "Sine VFX/StartSphereV5" {
	Properties {
		_FinalPower ("Final Power", Range(0, 4)) = 1
		_Ramp ("Ramp", 2D) = "white" {}
		_OffsetPower ("Offset Power", Range(0, 4)) = 0.3333333
		_Color ("Color", Vector) = (0.5,0.5,0.5,1)
		_Wave ("Wave", 2D) = "white" {}
		_OffsetAdd ("Offset Add", Float) = 0
		_ScrollSpeed ("Scroll Speed", Float) = 1
		_Distortion ("Distortion", 2D) = "bump" {}
		_DistortionPower ("Distortion Power", Range(0, 1)) = 0.1
		_FresnelExp ("Fresnel Exp", Range(0, 4)) = 2
		_Mask ("Mask", 2D) = "white" {}
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Name "FORWARD"
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
			Cull Off
			GpuProgramID 50976
			Program "vp" {
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						float _OffsetPower;
						vec4 unused_0_2;
						vec4 _Wave_ST;
						float _OffsetAdd;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = in_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat0 = textureLod(_Distortion, u_xlat0.xy, 0.0);
					    u_xlat2.x = _ScrollSpeed * _Time.y;
					    u_xlat2.xy = u_xlat2.xx * vec2(0.0, -1.0) + in_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xx * vec2(_DistortionPower) + u_xlat2.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat0 = textureLod(_Wave, u_xlat0.xy, 0.0);
					    u_xlat0.x = u_xlat0.x + _OffsetAdd;
					    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_OffsetPower) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
						vec4 unused_0_0[4];
						float _OffsetPower;
						vec4 unused_0_2;
						vec4 _Wave_ST;
						float _OffsetAdd;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
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
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = in_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat0 = textureLod(_Distortion, u_xlat0.xy, 0.0);
					    u_xlat3.x = _ScrollSpeed * _Time.y;
					    u_xlat3.xy = u_xlat3.xx * vec2(0.0, -1.0) + in_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xx * vec2(_DistortionPower) + u_xlat3.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat0 = textureLod(_Wave, u_xlat0.xy, 0.0);
					    u_xlat0.x = u_xlat0.x + _OffsetAdd;
					    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_OffsetPower) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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
					    vs_TEXCOORD2.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
						vec4 unused_0_0[4];
						float _OffsetPower;
						vec4 unused_0_2;
						vec4 _Wave_ST;
						float _OffsetAdd;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = in_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat0 = textureLod(_Distortion, u_xlat0.xy, 0.0);
					    u_xlat2.x = _ScrollSpeed * _Time.y;
					    u_xlat2.xy = u_xlat2.xx * vec2(0.0, -1.0) + in_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xx * vec2(_DistortionPower) + u_xlat2.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat0 = textureLod(_Wave, u_xlat0.xy, 0.0);
					    u_xlat0.x = u_xlat0.x + _OffsetAdd;
					    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_OffsetPower) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
						vec4 unused_0_0[4];
						float _OffsetPower;
						vec4 unused_0_2;
						vec4 _Wave_ST;
						float _OffsetAdd;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
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
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = in_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat0 = textureLod(_Distortion, u_xlat0.xy, 0.0);
					    u_xlat3.x = _ScrollSpeed * _Time.y;
					    u_xlat3.xy = u_xlat3.xx * vec2(0.0, -1.0) + in_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xx * vec2(_DistortionPower) + u_xlat3.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat0 = textureLod(_Wave, u_xlat0.xy, 0.0);
					    u_xlat0.x = u_xlat0.x + _OffsetAdd;
					    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_OffsetPower) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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
					    vs_TEXCOORD2.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
						vec4 unused_0_0[4];
						float _OffsetPower;
						vec4 unused_0_2;
						vec4 _Wave_ST;
						float _OffsetAdd;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = in_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat0 = textureLod(_Distortion, u_xlat0.xy, 0.0);
					    u_xlat2.x = _ScrollSpeed * _Time.y;
					    u_xlat2.xy = u_xlat2.xx * vec2(0.0, -1.0) + in_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xx * vec2(_DistortionPower) + u_xlat2.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat0 = textureLod(_Wave, u_xlat0.xy, 0.0);
					    u_xlat0.x = u_xlat0.x + _OffsetAdd;
					    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_OffsetPower) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
						vec4 unused_0_0[4];
						float _OffsetPower;
						vec4 unused_0_2;
						vec4 _Wave_ST;
						float _OffsetAdd;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
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
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = in_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat0 = textureLod(_Distortion, u_xlat0.xy, 0.0);
					    u_xlat3.x = _ScrollSpeed * _Time.y;
					    u_xlat3.xy = u_xlat3.xx * vec2(0.0, -1.0) + in_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xx * vec2(_DistortionPower) + u_xlat3.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat0 = textureLod(_Wave, u_xlat0.xy, 0.0);
					    u_xlat0.x = u_xlat0.x + _OffsetAdd;
					    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_OffsetPower) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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
					    vs_TEXCOORD2.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
						vec4 unused_0_0[4];
						float _OffsetPower;
						vec4 unused_0_2;
						vec4 _Wave_ST;
						float _OffsetAdd;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = in_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat0 = textureLod(_Distortion, u_xlat0.xy, 0.0);
					    u_xlat2.x = _ScrollSpeed * _Time.y;
					    u_xlat2.xy = u_xlat2.xx * vec2(0.0, -1.0) + in_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xx * vec2(_DistortionPower) + u_xlat2.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat0 = textureLod(_Wave, u_xlat0.xy, 0.0);
					    u_xlat0.x = u_xlat0.x + _OffsetAdd;
					    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_OffsetPower) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
						vec4 unused_0_0[4];
						float _OffsetPower;
						vec4 unused_0_2;
						vec4 _Wave_ST;
						float _OffsetAdd;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
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
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = in_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat0 = textureLod(_Distortion, u_xlat0.xy, 0.0);
					    u_xlat3.x = _ScrollSpeed * _Time.y;
					    u_xlat3.xy = u_xlat3.xx * vec2(0.0, -1.0) + in_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xx * vec2(_DistortionPower) + u_xlat3.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat0 = textureLod(_Wave, u_xlat0.xy, 0.0);
					    u_xlat0.x = u_xlat0.x + _OffsetAdd;
					    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_OffsetPower) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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
					    vs_TEXCOORD2.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
						vec4 unused_0_0[4];
						float _OffsetPower;
						vec4 unused_0_2;
						vec4 _Wave_ST;
						float _OffsetAdd;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = in_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat0 = textureLod(_Distortion, u_xlat0.xy, 0.0);
					    u_xlat2.x = _ScrollSpeed * _Time.y;
					    u_xlat2.xy = u_xlat2.xx * vec2(0.0, -1.0) + in_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xx * vec2(_DistortionPower) + u_xlat2.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat0 = textureLod(_Wave, u_xlat0.xy, 0.0);
					    u_xlat0.x = u_xlat0.x + _OffsetAdd;
					    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_OffsetPower) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
						vec4 unused_0_0[4];
						float _OffsetPower;
						vec4 unused_0_2;
						vec4 _Wave_ST;
						float _OffsetAdd;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
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
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = in_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat0 = textureLod(_Distortion, u_xlat0.xy, 0.0);
					    u_xlat3.x = _ScrollSpeed * _Time.y;
					    u_xlat3.xy = u_xlat3.xx * vec2(0.0, -1.0) + in_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xx * vec2(_DistortionPower) + u_xlat3.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat0 = textureLod(_Wave, u_xlat0.xy, 0.0);
					    u_xlat0.x = u_xlat0.x + _OffsetAdd;
					    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_OffsetPower) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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
					    vs_TEXCOORD2.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
						vec4 unused_0_0[4];
						float _OffsetPower;
						vec4 unused_0_2;
						vec4 _Wave_ST;
						float _OffsetAdd;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = in_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat0 = textureLod(_Distortion, u_xlat0.xy, 0.0);
					    u_xlat2.x = _ScrollSpeed * _Time.y;
					    u_xlat2.xy = u_xlat2.xx * vec2(0.0, -1.0) + in_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xx * vec2(_DistortionPower) + u_xlat2.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat0 = textureLod(_Wave, u_xlat0.xy, 0.0);
					    u_xlat0.x = u_xlat0.x + _OffsetAdd;
					    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_OffsetPower) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
						vec4 unused_0_0[4];
						float _OffsetPower;
						vec4 unused_0_2;
						vec4 _Wave_ST;
						float _OffsetAdd;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
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
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = in_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat0 = textureLod(_Distortion, u_xlat0.xy, 0.0);
					    u_xlat3.x = _ScrollSpeed * _Time.y;
					    u_xlat3.xy = u_xlat3.xx * vec2(0.0, -1.0) + in_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xx * vec2(_DistortionPower) + u_xlat3.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat0 = textureLod(_Wave, u_xlat0.xy, 0.0);
					    u_xlat0.x = u_xlat0.x + _OffsetAdd;
					    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_OffsetPower) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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
					    vs_TEXCOORD2.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
						vec4 unused_0_0[4];
						float _OffsetPower;
						vec4 unused_0_2;
						vec4 _Wave_ST;
						float _OffsetAdd;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = in_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat0 = textureLod(_Distortion, u_xlat0.xy, 0.0);
					    u_xlat2.x = _ScrollSpeed * _Time.y;
					    u_xlat2.xy = u_xlat2.xx * vec2(0.0, -1.0) + in_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xx * vec2(_DistortionPower) + u_xlat2.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat0 = textureLod(_Wave, u_xlat0.xy, 0.0);
					    u_xlat0.x = u_xlat0.x + _OffsetAdd;
					    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_OffsetPower) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
						vec4 unused_0_0[4];
						float _OffsetPower;
						vec4 unused_0_2;
						vec4 _Wave_ST;
						float _OffsetAdd;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
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
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = in_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat0 = textureLod(_Distortion, u_xlat0.xy, 0.0);
					    u_xlat3.x = _ScrollSpeed * _Time.y;
					    u_xlat3.xy = u_xlat3.xx * vec2(0.0, -1.0) + in_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xx * vec2(_DistortionPower) + u_xlat3.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat0 = textureLod(_Wave, u_xlat0.xy, 0.0);
					    u_xlat0.x = u_xlat0.x + _OffsetAdd;
					    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_OffsetPower) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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
					    vs_TEXCOORD2.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
						vec4 unused_0_0[4];
						float _OffsetPower;
						vec4 unused_0_2;
						vec4 _Wave_ST;
						float _OffsetAdd;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = in_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat0 = textureLod(_Distortion, u_xlat0.xy, 0.0);
					    u_xlat2.x = _ScrollSpeed * _Time.y;
					    u_xlat2.xy = u_xlat2.xx * vec2(0.0, -1.0) + in_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xx * vec2(_DistortionPower) + u_xlat2.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat0 = textureLod(_Wave, u_xlat0.xy, 0.0);
					    u_xlat0.x = u_xlat0.x + _OffsetAdd;
					    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_OffsetPower) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
						vec4 unused_0_0[4];
						float _OffsetPower;
						vec4 unused_0_2;
						vec4 _Wave_ST;
						float _OffsetAdd;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
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
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = in_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat0 = textureLod(_Distortion, u_xlat0.xy, 0.0);
					    u_xlat3.x = _ScrollSpeed * _Time.y;
					    u_xlat3.xy = u_xlat3.xx * vec2(0.0, -1.0) + in_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xx * vec2(_DistortionPower) + u_xlat3.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat0 = textureLod(_Wave, u_xlat0.xy, 0.0);
					    u_xlat0.x = u_xlat0.x + _OffsetAdd;
					    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_OffsetPower) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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
					    vs_TEXCOORD2.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
						float _FinalPower;
						vec4 _Ramp_ST;
						vec4 unused_0_3;
						vec4 _Color;
						vec4 _Wave_ST;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						float _FresnelExp;
						vec4 _Mask_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					uniform  sampler2D _Mask;
					uniform  sampler2D _Ramp;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat10_0 = texture(_Distortion, u_xlat0.xy);
					    u_xlat2.x = _ScrollSpeed * _Time.y;
					    u_xlat2.xy = u_xlat2.xx * vec2(0.0, -1.0) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat10_0.xx * vec2(_DistortionPower) + u_xlat2.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat10_0 = texture(_Wave, u_xlat0.xy);
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat2.x = max(u_xlat2.x, 0.0);
					    u_xlat2.x = (-u_xlat2.x) + 1.0;
					    u_xlat0.x = u_xlat10_0.x * u_xlat2.x;
					    u_xlat2.x = log2(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * _FresnelExp;
					    u_xlat2.x = exp2(u_xlat2.x);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_1 = texture(_Mask, u_xlat4.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat10_1.x + u_xlat2.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x * _Ramp_ST.x;
					    u_xlat0.y = 0.0;
					    u_xlat0.xy = u_xlat0.xy + _Ramp_ST.zw;
					    u_xlat10_0 = texture(_Ramp, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_FinalPower);
					    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
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
						float _FinalPower;
						vec4 _Ramp_ST;
						vec4 unused_0_3;
						vec4 _Color;
						vec4 _Wave_ST;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						float _FresnelExp;
						vec4 _Mask_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					uniform  sampler2D _Mask;
					uniform  sampler2D _Ramp;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					int u_xlati2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat10_0 = texture(_Distortion, u_xlat0.xy);
					    u_xlat2.x = _ScrollSpeed * _Time.y;
					    u_xlat2.xy = u_xlat2.xx * vec2(0.0, -1.0) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat10_0.xx * vec2(_DistortionPower) + u_xlat2.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat10_0 = texture(_Wave, u_xlat0.xy);
					    u_xlati2 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati2].xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat2.x = max(u_xlat2.x, 0.0);
					    u_xlat2.x = (-u_xlat2.x) + 1.0;
					    u_xlat0.x = u_xlat10_0.x * u_xlat2.x;
					    u_xlat2.x = log2(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * _FresnelExp;
					    u_xlat2.x = exp2(u_xlat2.x);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_1 = texture(_Mask, u_xlat4.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat10_1.x + u_xlat2.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x * _Ramp_ST.x;
					    u_xlat0.y = 0.0;
					    u_xlat0.xy = u_xlat0.xy + _Ramp_ST.zw;
					    u_xlat10_0 = texture(_Ramp, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_FinalPower);
					    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
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
						float _FinalPower;
						vec4 _Ramp_ST;
						vec4 unused_0_3;
						vec4 _Color;
						vec4 _Wave_ST;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						float _FresnelExp;
						vec4 _Mask_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					uniform  sampler2D _Mask;
					uniform  sampler2D _Ramp;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat10_0 = texture(_Distortion, u_xlat0.xy);
					    u_xlat2.x = _ScrollSpeed * _Time.y;
					    u_xlat2.xy = u_xlat2.xx * vec2(0.0, -1.0) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat10_0.xx * vec2(_DistortionPower) + u_xlat2.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat10_0 = texture(_Wave, u_xlat0.xy);
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat2.x = max(u_xlat2.x, 0.0);
					    u_xlat2.x = (-u_xlat2.x) + 1.0;
					    u_xlat0.x = u_xlat10_0.x * u_xlat2.x;
					    u_xlat2.x = log2(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * _FresnelExp;
					    u_xlat2.x = exp2(u_xlat2.x);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_1 = texture(_Mask, u_xlat4.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat10_1.x + u_xlat2.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x * _Ramp_ST.x;
					    u_xlat0.y = 0.0;
					    u_xlat0.xy = u_xlat0.xy + _Ramp_ST.zw;
					    u_xlat10_0 = texture(_Ramp, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_FinalPower);
					    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
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
						float _FinalPower;
						vec4 _Ramp_ST;
						vec4 unused_0_3;
						vec4 _Color;
						vec4 _Wave_ST;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						float _FresnelExp;
						vec4 _Mask_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					uniform  sampler2D _Mask;
					uniform  sampler2D _Ramp;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					int u_xlati2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat10_0 = texture(_Distortion, u_xlat0.xy);
					    u_xlat2.x = _ScrollSpeed * _Time.y;
					    u_xlat2.xy = u_xlat2.xx * vec2(0.0, -1.0) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat10_0.xx * vec2(_DistortionPower) + u_xlat2.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat10_0 = texture(_Wave, u_xlat0.xy);
					    u_xlati2 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati2].xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat2.x = max(u_xlat2.x, 0.0);
					    u_xlat2.x = (-u_xlat2.x) + 1.0;
					    u_xlat0.x = u_xlat10_0.x * u_xlat2.x;
					    u_xlat2.x = log2(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * _FresnelExp;
					    u_xlat2.x = exp2(u_xlat2.x);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_1 = texture(_Mask, u_xlat4.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat10_1.x + u_xlat2.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x * _Ramp_ST.x;
					    u_xlat0.y = 0.0;
					    u_xlat0.xy = u_xlat0.xy + _Ramp_ST.zw;
					    u_xlat10_0 = texture(_Ramp, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_FinalPower);
					    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
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
						float _FinalPower;
						vec4 _Ramp_ST;
						vec4 unused_0_3;
						vec4 _Color;
						vec4 _Wave_ST;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						float _FresnelExp;
						vec4 _Mask_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					uniform  sampler2D _Mask;
					uniform  sampler2D _Ramp;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat10_0 = texture(_Distortion, u_xlat0.xy);
					    u_xlat2.x = _ScrollSpeed * _Time.y;
					    u_xlat2.xy = u_xlat2.xx * vec2(0.0, -1.0) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat10_0.xx * vec2(_DistortionPower) + u_xlat2.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat10_0 = texture(_Wave, u_xlat0.xy);
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat2.x = max(u_xlat2.x, 0.0);
					    u_xlat2.x = (-u_xlat2.x) + 1.0;
					    u_xlat0.x = u_xlat10_0.x * u_xlat2.x;
					    u_xlat2.x = log2(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * _FresnelExp;
					    u_xlat2.x = exp2(u_xlat2.x);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_1 = texture(_Mask, u_xlat4.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat10_1.x + u_xlat2.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x * _Ramp_ST.x;
					    u_xlat0.y = 0.0;
					    u_xlat0.xy = u_xlat0.xy + _Ramp_ST.zw;
					    u_xlat10_0 = texture(_Ramp, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_FinalPower);
					    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
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
						float _FinalPower;
						vec4 _Ramp_ST;
						vec4 unused_0_3;
						vec4 _Color;
						vec4 _Wave_ST;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						float _FresnelExp;
						vec4 _Mask_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					uniform  sampler2D _Mask;
					uniform  sampler2D _Ramp;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					int u_xlati2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat10_0 = texture(_Distortion, u_xlat0.xy);
					    u_xlat2.x = _ScrollSpeed * _Time.y;
					    u_xlat2.xy = u_xlat2.xx * vec2(0.0, -1.0) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat10_0.xx * vec2(_DistortionPower) + u_xlat2.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat10_0 = texture(_Wave, u_xlat0.xy);
					    u_xlati2 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati2].xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat2.x = max(u_xlat2.x, 0.0);
					    u_xlat2.x = (-u_xlat2.x) + 1.0;
					    u_xlat0.x = u_xlat10_0.x * u_xlat2.x;
					    u_xlat2.x = log2(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * _FresnelExp;
					    u_xlat2.x = exp2(u_xlat2.x);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_1 = texture(_Mask, u_xlat4.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat10_1.x + u_xlat2.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x * _Ramp_ST.x;
					    u_xlat0.y = 0.0;
					    u_xlat0.xy = u_xlat0.xy + _Ramp_ST.zw;
					    u_xlat10_0 = texture(_Ramp, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_FinalPower);
					    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
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
						float _FinalPower;
						vec4 _Ramp_ST;
						vec4 unused_0_3;
						vec4 _Color;
						vec4 _Wave_ST;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						float _FresnelExp;
						vec4 _Mask_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					uniform  sampler2D _Mask;
					uniform  sampler2D _Ramp;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat10_0 = texture(_Distortion, u_xlat0.xy);
					    u_xlat2.x = _ScrollSpeed * _Time.y;
					    u_xlat2.xy = u_xlat2.xx * vec2(0.0, -1.0) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat10_0.xx * vec2(_DistortionPower) + u_xlat2.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat10_0 = texture(_Wave, u_xlat0.xy);
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat2.x = max(u_xlat2.x, 0.0);
					    u_xlat2.x = (-u_xlat2.x) + 1.0;
					    u_xlat0.x = u_xlat10_0.x * u_xlat2.x;
					    u_xlat2.x = log2(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * _FresnelExp;
					    u_xlat2.x = exp2(u_xlat2.x);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_1 = texture(_Mask, u_xlat4.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat10_1.x + u_xlat2.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x * _Ramp_ST.x;
					    u_xlat0.y = 0.0;
					    u_xlat0.xy = u_xlat0.xy + _Ramp_ST.zw;
					    u_xlat10_0 = texture(_Ramp, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_FinalPower);
					    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
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
						float _FinalPower;
						vec4 _Ramp_ST;
						vec4 unused_0_3;
						vec4 _Color;
						vec4 _Wave_ST;
						float _ScrollSpeed;
						vec4 _Distortion_ST;
						float _DistortionPower;
						float _FresnelExp;
						vec4 _Mask_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _Distortion;
					uniform  sampler2D _Wave;
					uniform  sampler2D _Mask;
					uniform  sampler2D _Ramp;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					int u_xlati2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Distortion_ST.xy + _Distortion_ST.zw;
					    u_xlat10_0 = texture(_Distortion, u_xlat0.xy);
					    u_xlat2.x = _ScrollSpeed * _Time.y;
					    u_xlat2.xy = u_xlat2.xx * vec2(0.0, -1.0) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat10_0.xx * vec2(_DistortionPower) + u_xlat2.xy;
					    u_xlat0.xy = u_xlat0.xy * _Wave_ST.xy + _Wave_ST.zw;
					    u_xlat10_0 = texture(_Wave, u_xlat0.xy);
					    u_xlati2 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati2].xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat2.x = max(u_xlat2.x, 0.0);
					    u_xlat2.x = (-u_xlat2.x) + 1.0;
					    u_xlat0.x = u_xlat10_0.x * u_xlat2.x;
					    u_xlat2.x = log2(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * _FresnelExp;
					    u_xlat2.x = exp2(u_xlat2.x);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_1 = texture(_Mask, u_xlat4.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat10_1.x + u_xlat2.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x * _Ramp_ST.x;
					    u_xlat0.y = 0.0;
					    u_xlat0.xy = u_xlat0.xy + _Ramp_ST.zw;
					    u_xlat10_0 = texture(_Ramp, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_FinalPower);
					    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
	}
	CustomEditor "ShaderForgeMaterialInspector"
}