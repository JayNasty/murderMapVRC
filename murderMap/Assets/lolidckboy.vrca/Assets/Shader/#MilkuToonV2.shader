Shader "#Milku/ToonV2" {
	Properties {
		_Diffuse ("Main Tex", 2D) = "white" {}
		_SkinFunc ("SkinFunc", 2D) = "white" {}
		_HighlightFunc ("HighlightFunc", 2D) = "black" {}
		_Cubemap ("Cubemap", Cube) = "_Skybox" {}
		_SkinSubsurf ("SkinSubsurf", Vector) = (0,0,0,1)
		[MaterialToggle] _Color ("Solid Color?", Float) = 0
		_color ("color", Vector) = (0.5,0.5,0.5,1)
		_LightDesaturate ("LightDesaturate", Float) = 1
		_highlightint ("highlightint", Float) = 1
		_FuncEffect ("FuncStrength", Range(0, 1)) = 0
		_Metal ("Cubemap Strength", Float) = 0
	}
	SubShader {
		Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Overlay+999999999" "RenderType" = "Opaque" }
		Pass {
			Name "OUTLINE"
			Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Overlay+999999999" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
			Cull Front
			Lighting On
			GpuProgramID 62879
			Program "vp" {
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						float _Outline;
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
					in  vec3 in_NORMAL0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_Outline) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						float _Outline;
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
					in  vec3 in_NORMAL0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_Outline) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlati1 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat0.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat0.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat0.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat0.wwww + u_xlat2;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						float _Outline;
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
					in  vec3 in_NORMAL0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_Outline) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						float _Outline;
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
					in  vec3 in_NORMAL0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_Outline) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlati1 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat0.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat0.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat0.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat0.wwww + u_xlat2;
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
		Pass {
			Name "FORWARD"
			Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Overlay+999999999" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
			Stencil {
				Ref 128
			}
			GpuProgramID 92723
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 _HighlightFunc_ST;
						vec4 _SkinSubsurf;
						vec4 _SkinFunc_copy_ST;
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _highlightint;
						float _FuncEffect;
						float _Metal;
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
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_9[2];
					};
					uniform  sampler2D _HighlightFunc;
					uniform  sampler2D _SkinFunc_copy;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec3 u_xlat6;
					vec3 u_xlat16_6;
					vec2 u_xlat14;
					vec2 u_xlat17;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					float u_xlat16_23;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat21 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat21);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat4.y = 0.0;
					    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat5.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
					    u_xlat21 = dot(u_xlat5.xyz, u_xlat0.xyz);
					    u_xlat21 = max(u_xlat21, 0.0);
					    u_xlat22 = max(u_xlat21, 0.0199999996);
					    u_xlat21 = u_xlat21 * 0.5 + 0.5;
					    u_xlat22 = min(u_xlat22, 1.0);
					    u_xlat4.x = u_xlat22 * _SkinFunc_ST.x;
					    u_xlat4.xy = u_xlat4.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_6.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_6.xyz + u_xlat10_4.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat22) + u_xlat5.xyz;
					    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
					    u_xlat22 = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = vec3(u_xlat22) * u_xlat5.xyz;
					    u_xlat22 = dot(u_xlat0.xyz, u_xlat5.xyz);
					    u_xlat22 = max(u_xlat22, 0.0);
					    u_xlat22 = u_xlat22 * 1.10000002;
					    u_xlat22 = log2(u_xlat22);
					    u_xlat22 = u_xlat22 * 80.0;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat22 = min(u_xlat22, 2.0);
					    u_xlat23 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat23 = u_xlat23 + u_xlat23;
					    u_xlat5.xyz = u_xlat0.xyz * (-vec3(u_xlat23)) + (-u_xlat4.xyz);
					    u_xlat10_5 = texture(_Cubemap, u_xlat5.xyz);
					    u_xlat16_5.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz;
					    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_23 = dot(u_xlat16_6.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_5.xyz = (-u_xlat16_5.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_23);
					    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_6.xyz;
					    u_xlat23 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat6.xyz = vec3(u_xlat23) + (-_LightColor0.xyz);
					    u_xlat6.xyz = vec3(_LightDesaturate) * u_xlat6.xyz + _LightColor0.xyz;
					    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat6.xyz = min(u_xlat6.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat5.xyz = u_xlat16_5.xyz * u_xlat6.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat5.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat22);
					    u_xlat2.xyz = (-u_xlat3.xyz) * u_xlat6.xyz + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat6.xyz;
					    u_xlat2.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat2.xyz + u_xlat3.xyz;
					    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
					    u_xlat22 = dot(u_xlat0.xyz, u_xlat4.xyz);
					    u_xlat0.xyz = vs_TEXCOORD3.xyz * vec3(-0.100000001, -0.100000001, -0.100000001) + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat4.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat3.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = max(u_xlat22, 0.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.800000012;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = (-u_xlat0.x) * 0.800000012 + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat21;
					    u_xlat17.x = u_xlat0.x * _SkinFunc_copy_ST.x;
					    u_xlat3.y = float(0.0);
					    u_xlat17.y = float(0.0);
					    u_xlat0.xy = u_xlat17.xy + _SkinFunc_copy_ST.zw;
					    u_xlat14.xy = u_xlat3.xy * _HighlightFunc_ST.xy + _HighlightFunc_ST.zw;
					    u_xlat10_3 = texture(_HighlightFunc, u_xlat14.xy);
					    u_xlat10_0 = texture(_SkinFunc_copy, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat10_0.www * _SkinSubsurf.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat6.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat10_3.xyz * vec3(vec3(_highlightint, _highlightint, _highlightint)) + u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 _HighlightFunc_ST;
						vec4 _SkinSubsurf;
						vec4 _SkinFunc_copy_ST;
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _highlightint;
						float _FuncEffect;
						float _Metal;
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _HighlightFunc;
					uniform  sampler2D _SkinFunc_copy;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec3 u_xlat6;
					vec3 u_xlat16_6;
					vec2 u_xlat14;
					vec2 u_xlat17;
					float u_xlat21;
					float u_xlat22;
					int u_xlati22;
					float u_xlat23;
					float u_xlat16_23;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat21 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat21);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat4.y = 0.0;
					    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat5.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
					    u_xlat21 = dot(u_xlat5.xyz, u_xlat0.xyz);
					    u_xlat21 = max(u_xlat21, 0.0);
					    u_xlat22 = max(u_xlat21, 0.0199999996);
					    u_xlat21 = u_xlat21 * 0.5 + 0.5;
					    u_xlat22 = min(u_xlat22, 1.0);
					    u_xlat4.x = u_xlat22 * _SkinFunc_ST.x;
					    u_xlat4.xy = u_xlat4.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_6.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_6.xyz + u_xlat10_4.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlati22 = unity_StereoEyeIndex;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati22].xyz;
					    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat22) + u_xlat5.xyz;
					    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
					    u_xlat22 = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = vec3(u_xlat22) * u_xlat5.xyz;
					    u_xlat22 = dot(u_xlat0.xyz, u_xlat5.xyz);
					    u_xlat22 = max(u_xlat22, 0.0);
					    u_xlat22 = u_xlat22 * 1.10000002;
					    u_xlat22 = log2(u_xlat22);
					    u_xlat22 = u_xlat22 * 80.0;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat22 = min(u_xlat22, 2.0);
					    u_xlat23 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat23 = u_xlat23 + u_xlat23;
					    u_xlat5.xyz = u_xlat0.xyz * (-vec3(u_xlat23)) + (-u_xlat4.xyz);
					    u_xlat10_5 = texture(_Cubemap, u_xlat5.xyz);
					    u_xlat16_5.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz;
					    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_23 = dot(u_xlat16_6.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_5.xyz = (-u_xlat16_5.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_23);
					    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_6.xyz;
					    u_xlat23 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat6.xyz = vec3(u_xlat23) + (-_LightColor0.xyz);
					    u_xlat6.xyz = vec3(_LightDesaturate) * u_xlat6.xyz + _LightColor0.xyz;
					    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat6.xyz = min(u_xlat6.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat5.xyz = u_xlat16_5.xyz * u_xlat6.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat5.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat22);
					    u_xlat2.xyz = (-u_xlat3.xyz) * u_xlat6.xyz + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat6.xyz;
					    u_xlat2.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat2.xyz + u_xlat3.xyz;
					    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
					    u_xlat22 = dot(u_xlat0.xyz, u_xlat4.xyz);
					    u_xlat0.xyz = vs_TEXCOORD3.xyz * vec3(-0.100000001, -0.100000001, -0.100000001) + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat4.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat3.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = max(u_xlat22, 0.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.800000012;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = (-u_xlat0.x) * 0.800000012 + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat21;
					    u_xlat17.x = u_xlat0.x * _SkinFunc_copy_ST.x;
					    u_xlat3.y = float(0.0);
					    u_xlat17.y = float(0.0);
					    u_xlat0.xy = u_xlat17.xy + _SkinFunc_copy_ST.zw;
					    u_xlat14.xy = u_xlat3.xy * _HighlightFunc_ST.xy + _HighlightFunc_ST.zw;
					    u_xlat10_3 = texture(_HighlightFunc, u_xlat14.xy);
					    u_xlat10_0 = texture(_SkinFunc_copy, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat10_0.www * _SkinSubsurf.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat6.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat10_3.xyz * vec3(vec3(_highlightint, _highlightint, _highlightint)) + u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 _HighlightFunc_ST;
						vec4 _SkinSubsurf;
						vec4 _SkinFunc_copy_ST;
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _highlightint;
						float _FuncEffect;
						float _Metal;
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
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_9[2];
					};
					uniform  sampler2D _HighlightFunc;
					uniform  sampler2D _SkinFunc_copy;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec3 u_xlat6;
					vec3 u_xlat16_6;
					vec2 u_xlat14;
					vec2 u_xlat17;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					float u_xlat16_23;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat21 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat21);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat4.y = 0.0;
					    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat5.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
					    u_xlat21 = dot(u_xlat5.xyz, u_xlat0.xyz);
					    u_xlat21 = max(u_xlat21, 0.0);
					    u_xlat22 = max(u_xlat21, 0.0199999996);
					    u_xlat21 = u_xlat21 * 0.5 + 0.5;
					    u_xlat22 = min(u_xlat22, 1.0);
					    u_xlat4.x = u_xlat22 * _SkinFunc_ST.x;
					    u_xlat4.xy = u_xlat4.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_6.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_6.xyz + u_xlat10_4.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat22) + u_xlat5.xyz;
					    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
					    u_xlat22 = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = vec3(u_xlat22) * u_xlat5.xyz;
					    u_xlat22 = dot(u_xlat0.xyz, u_xlat5.xyz);
					    u_xlat22 = max(u_xlat22, 0.0);
					    u_xlat22 = u_xlat22 * 1.10000002;
					    u_xlat22 = log2(u_xlat22);
					    u_xlat22 = u_xlat22 * 80.0;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat22 = min(u_xlat22, 2.0);
					    u_xlat23 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat23 = u_xlat23 + u_xlat23;
					    u_xlat5.xyz = u_xlat0.xyz * (-vec3(u_xlat23)) + (-u_xlat4.xyz);
					    u_xlat10_5 = texture(_Cubemap, u_xlat5.xyz);
					    u_xlat16_5.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz;
					    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_23 = dot(u_xlat16_6.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_5.xyz = (-u_xlat16_5.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_23);
					    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_6.xyz;
					    u_xlat23 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat6.xyz = vec3(u_xlat23) + (-_LightColor0.xyz);
					    u_xlat6.xyz = vec3(_LightDesaturate) * u_xlat6.xyz + _LightColor0.xyz;
					    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat6.xyz = min(u_xlat6.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat5.xyz = u_xlat16_5.xyz * u_xlat6.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat5.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat22);
					    u_xlat2.xyz = (-u_xlat3.xyz) * u_xlat6.xyz + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat6.xyz;
					    u_xlat2.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat2.xyz + u_xlat3.xyz;
					    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
					    u_xlat22 = dot(u_xlat0.xyz, u_xlat4.xyz);
					    u_xlat0.xyz = vs_TEXCOORD3.xyz * vec3(-0.100000001, -0.100000001, -0.100000001) + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat4.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat3.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = max(u_xlat22, 0.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.800000012;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = (-u_xlat0.x) * 0.800000012 + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat21;
					    u_xlat17.x = u_xlat0.x * _SkinFunc_copy_ST.x;
					    u_xlat3.y = float(0.0);
					    u_xlat17.y = float(0.0);
					    u_xlat0.xy = u_xlat17.xy + _SkinFunc_copy_ST.zw;
					    u_xlat14.xy = u_xlat3.xy * _HighlightFunc_ST.xy + _HighlightFunc_ST.zw;
					    u_xlat10_3 = texture(_HighlightFunc, u_xlat14.xy);
					    u_xlat10_0 = texture(_SkinFunc_copy, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat10_0.www * _SkinSubsurf.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat6.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat10_3.xyz * vec3(vec3(_highlightint, _highlightint, _highlightint)) + u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 _HighlightFunc_ST;
						vec4 _SkinSubsurf;
						vec4 _SkinFunc_copy_ST;
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _highlightint;
						float _FuncEffect;
						float _Metal;
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _HighlightFunc;
					uniform  sampler2D _SkinFunc_copy;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec3 u_xlat6;
					vec3 u_xlat16_6;
					vec2 u_xlat14;
					vec2 u_xlat17;
					float u_xlat21;
					float u_xlat22;
					int u_xlati22;
					float u_xlat23;
					float u_xlat16_23;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat21 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat21);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat4.y = 0.0;
					    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat5.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
					    u_xlat21 = dot(u_xlat5.xyz, u_xlat0.xyz);
					    u_xlat21 = max(u_xlat21, 0.0);
					    u_xlat22 = max(u_xlat21, 0.0199999996);
					    u_xlat21 = u_xlat21 * 0.5 + 0.5;
					    u_xlat22 = min(u_xlat22, 1.0);
					    u_xlat4.x = u_xlat22 * _SkinFunc_ST.x;
					    u_xlat4.xy = u_xlat4.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_6.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_6.xyz + u_xlat10_4.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlati22 = unity_StereoEyeIndex;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati22].xyz;
					    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat22) + u_xlat5.xyz;
					    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
					    u_xlat22 = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = vec3(u_xlat22) * u_xlat5.xyz;
					    u_xlat22 = dot(u_xlat0.xyz, u_xlat5.xyz);
					    u_xlat22 = max(u_xlat22, 0.0);
					    u_xlat22 = u_xlat22 * 1.10000002;
					    u_xlat22 = log2(u_xlat22);
					    u_xlat22 = u_xlat22 * 80.0;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat22 = min(u_xlat22, 2.0);
					    u_xlat23 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat23 = u_xlat23 + u_xlat23;
					    u_xlat5.xyz = u_xlat0.xyz * (-vec3(u_xlat23)) + (-u_xlat4.xyz);
					    u_xlat10_5 = texture(_Cubemap, u_xlat5.xyz);
					    u_xlat16_5.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz;
					    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_23 = dot(u_xlat16_6.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_5.xyz = (-u_xlat16_5.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_23);
					    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_6.xyz;
					    u_xlat23 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat6.xyz = vec3(u_xlat23) + (-_LightColor0.xyz);
					    u_xlat6.xyz = vec3(_LightDesaturate) * u_xlat6.xyz + _LightColor0.xyz;
					    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat6.xyz = min(u_xlat6.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat5.xyz = u_xlat16_5.xyz * u_xlat6.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat5.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat22);
					    u_xlat2.xyz = (-u_xlat3.xyz) * u_xlat6.xyz + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat6.xyz;
					    u_xlat2.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat2.xyz + u_xlat3.xyz;
					    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
					    u_xlat22 = dot(u_xlat0.xyz, u_xlat4.xyz);
					    u_xlat0.xyz = vs_TEXCOORD3.xyz * vec3(-0.100000001, -0.100000001, -0.100000001) + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat4.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat3.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = max(u_xlat22, 0.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.800000012;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = (-u_xlat0.x) * 0.800000012 + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat21;
					    u_xlat17.x = u_xlat0.x * _SkinFunc_copy_ST.x;
					    u_xlat3.y = float(0.0);
					    u_xlat17.y = float(0.0);
					    u_xlat0.xy = u_xlat17.xy + _SkinFunc_copy_ST.zw;
					    u_xlat14.xy = u_xlat3.xy * _HighlightFunc_ST.xy + _HighlightFunc_ST.zw;
					    u_xlat10_3 = texture(_HighlightFunc, u_xlat14.xy);
					    u_xlat10_0 = texture(_SkinFunc_copy, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat10_0.www * _SkinSubsurf.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat6.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat10_3.xyz * vec3(vec3(_highlightint, _highlightint, _highlightint)) + u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 _HighlightFunc_ST;
						vec4 _SkinSubsurf;
						vec4 _SkinFunc_copy_ST;
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _highlightint;
						float _FuncEffect;
						float _Metal;
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
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_9[2];
					};
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _HighlightFunc;
					uniform  sampler2D _SkinFunc_copy;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec4 u_xlat10_6;
					vec3 u_xlat13;
					vec3 u_xlat16_13;
					vec2 u_xlat14;
					vec2 u_xlat17;
					vec2 u_xlat18;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					float u_xlat16_23;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat21 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat21);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat4.y = 0.0;
					    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat5.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
					    u_xlat21 = dot(u_xlat5.xyz, u_xlat0.xyz);
					    u_xlat21 = max(u_xlat21, 0.0);
					    u_xlat22 = max(u_xlat21, 0.0199999996);
					    u_xlat21 = u_xlat21 * 0.5 + 0.5;
					    u_xlat22 = min(u_xlat22, 1.0);
					    u_xlat18.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat10_6 = texture(_ShadowMapTexture, u_xlat18.xy);
					    u_xlat4.x = u_xlat22 * u_xlat10_6.x;
					    u_xlat4.xy = u_xlat4.xy * _SkinFunc_ST.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_13.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_13.xyz + u_xlat10_4.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat22) + u_xlat5.xyz;
					    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
					    u_xlat22 = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = vec3(u_xlat22) * u_xlat5.xyz;
					    u_xlat22 = dot(u_xlat0.xyz, u_xlat5.xyz);
					    u_xlat22 = max(u_xlat22, 0.0);
					    u_xlat22 = u_xlat22 * 1.10000002;
					    u_xlat22 = log2(u_xlat22);
					    u_xlat22 = u_xlat22 * 80.0;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat22 = min(u_xlat22, 2.0);
					    u_xlat22 = u_xlat22 * u_xlat10_6.x;
					    u_xlat23 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat23 = u_xlat23 + u_xlat23;
					    u_xlat5.xyz = u_xlat0.xyz * (-vec3(u_xlat23)) + (-u_xlat4.xyz);
					    u_xlat10_5 = texture(_Cubemap, u_xlat5.xyz);
					    u_xlat16_5.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz;
					    u_xlat16_13.xyz = u_xlat16_5.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_23 = dot(u_xlat16_13.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_5.xyz = (-u_xlat16_5.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_23);
					    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_13.xyz;
					    u_xlat23 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat13.xyz = vec3(u_xlat23) + (-_LightColor0.xyz);
					    u_xlat13.xyz = vec3(_LightDesaturate) * u_xlat13.xyz + _LightColor0.xyz;
					    u_xlat13.xyz = max(u_xlat13.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat13.xyz = min(u_xlat13.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat5.xyz = u_xlat16_5.xyz * u_xlat13.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat5.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat22);
					    u_xlat2.xyz = (-u_xlat3.xyz) * u_xlat13.xyz + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat13.xyz;
					    u_xlat2.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat2.xyz + u_xlat3.xyz;
					    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
					    u_xlat22 = dot(u_xlat0.xyz, u_xlat4.xyz);
					    u_xlat0.xyz = vs_TEXCOORD3.xyz * vec3(-0.100000001, -0.100000001, -0.100000001) + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat4.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat3.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = max(u_xlat22, 0.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.800000012;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = (-u_xlat0.x) * 0.800000012 + 1.0;
					    u_xlat17.x = u_xlat0.x * u_xlat21;
					    u_xlat3.y = float(0.0);
					    u_xlat17.y = float(0.0);
					    u_xlat0.xy = u_xlat10_6.xx * u_xlat17.xy;
					    u_xlat14.xy = u_xlat3.xy * _HighlightFunc_ST.xy + _HighlightFunc_ST.zw;
					    u_xlat10_3 = texture(_HighlightFunc, u_xlat14.xy);
					    u_xlat0.xy = u_xlat0.xy * _SkinFunc_copy_ST.xy + _SkinFunc_copy_ST.zw;
					    u_xlat10_0 = texture(_SkinFunc_copy, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat10_0.www * _SkinSubsurf.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat13.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat10_3.xyz * vec3(vec3(_highlightint, _highlightint, _highlightint)) + u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 _HighlightFunc_ST;
						vec4 _SkinSubsurf;
						vec4 _SkinFunc_copy_ST;
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _highlightint;
						float _FuncEffect;
						float _Metal;
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _HighlightFunc;
					uniform  sampler2D _SkinFunc_copy;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec4 u_xlat10_6;
					vec3 u_xlat13;
					vec3 u_xlat16_13;
					vec2 u_xlat14;
					vec2 u_xlat17;
					vec2 u_xlat18;
					float u_xlat21;
					float u_xlat22;
					int u_xlati22;
					float u_xlat23;
					float u_xlat16_23;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat21 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat21);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat4.y = 0.0;
					    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat5.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
					    u_xlat21 = dot(u_xlat5.xyz, u_xlat0.xyz);
					    u_xlat21 = max(u_xlat21, 0.0);
					    u_xlat22 = max(u_xlat21, 0.0199999996);
					    u_xlat21 = u_xlat21 * 0.5 + 0.5;
					    u_xlat22 = min(u_xlat22, 1.0);
					    u_xlat18.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat10_6 = texture(_ShadowMapTexture, u_xlat18.xy);
					    u_xlat4.x = u_xlat22 * u_xlat10_6.x;
					    u_xlat4.xy = u_xlat4.xy * _SkinFunc_ST.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_13.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_13.xyz + u_xlat10_4.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlati22 = unity_StereoEyeIndex;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati22].xyz;
					    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat22) + u_xlat5.xyz;
					    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
					    u_xlat22 = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = vec3(u_xlat22) * u_xlat5.xyz;
					    u_xlat22 = dot(u_xlat0.xyz, u_xlat5.xyz);
					    u_xlat22 = max(u_xlat22, 0.0);
					    u_xlat22 = u_xlat22 * 1.10000002;
					    u_xlat22 = log2(u_xlat22);
					    u_xlat22 = u_xlat22 * 80.0;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat22 = min(u_xlat22, 2.0);
					    u_xlat22 = u_xlat22 * u_xlat10_6.x;
					    u_xlat23 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat23 = u_xlat23 + u_xlat23;
					    u_xlat5.xyz = u_xlat0.xyz * (-vec3(u_xlat23)) + (-u_xlat4.xyz);
					    u_xlat10_5 = texture(_Cubemap, u_xlat5.xyz);
					    u_xlat16_5.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz;
					    u_xlat16_13.xyz = u_xlat16_5.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_23 = dot(u_xlat16_13.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_5.xyz = (-u_xlat16_5.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_23);
					    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_13.xyz;
					    u_xlat23 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat13.xyz = vec3(u_xlat23) + (-_LightColor0.xyz);
					    u_xlat13.xyz = vec3(_LightDesaturate) * u_xlat13.xyz + _LightColor0.xyz;
					    u_xlat13.xyz = max(u_xlat13.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat13.xyz = min(u_xlat13.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat5.xyz = u_xlat16_5.xyz * u_xlat13.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat5.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat22);
					    u_xlat2.xyz = (-u_xlat3.xyz) * u_xlat13.xyz + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat13.xyz;
					    u_xlat2.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat2.xyz + u_xlat3.xyz;
					    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
					    u_xlat22 = dot(u_xlat0.xyz, u_xlat4.xyz);
					    u_xlat0.xyz = vs_TEXCOORD3.xyz * vec3(-0.100000001, -0.100000001, -0.100000001) + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat4.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat3.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = max(u_xlat22, 0.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.800000012;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = (-u_xlat0.x) * 0.800000012 + 1.0;
					    u_xlat17.x = u_xlat0.x * u_xlat21;
					    u_xlat3.y = float(0.0);
					    u_xlat17.y = float(0.0);
					    u_xlat0.xy = u_xlat10_6.xx * u_xlat17.xy;
					    u_xlat14.xy = u_xlat3.xy * _HighlightFunc_ST.xy + _HighlightFunc_ST.zw;
					    u_xlat10_3 = texture(_HighlightFunc, u_xlat14.xy);
					    u_xlat0.xy = u_xlat0.xy * _SkinFunc_copy_ST.xy + _SkinFunc_copy_ST.zw;
					    u_xlat10_0 = texture(_SkinFunc_copy, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat10_0.www * _SkinSubsurf.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat13.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat10_3.xyz * vec3(vec3(_highlightint, _highlightint, _highlightint)) + u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 _HighlightFunc_ST;
						vec4 _SkinSubsurf;
						vec4 _SkinFunc_copy_ST;
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _highlightint;
						float _FuncEffect;
						float _Metal;
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
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_9[2];
					};
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _HighlightFunc;
					uniform  sampler2D _SkinFunc_copy;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec4 u_xlat10_6;
					vec3 u_xlat13;
					vec3 u_xlat16_13;
					vec2 u_xlat14;
					vec2 u_xlat17;
					vec2 u_xlat18;
					float u_xlat21;
					float u_xlat22;
					float u_xlat23;
					float u_xlat16_23;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat21 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat21);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat4.y = 0.0;
					    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat5.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
					    u_xlat21 = dot(u_xlat5.xyz, u_xlat0.xyz);
					    u_xlat21 = max(u_xlat21, 0.0);
					    u_xlat22 = max(u_xlat21, 0.0199999996);
					    u_xlat21 = u_xlat21 * 0.5 + 0.5;
					    u_xlat22 = min(u_xlat22, 1.0);
					    u_xlat18.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat10_6 = texture(_ShadowMapTexture, u_xlat18.xy);
					    u_xlat4.x = u_xlat22 * u_xlat10_6.x;
					    u_xlat4.xy = u_xlat4.xy * _SkinFunc_ST.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_13.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_13.xyz + u_xlat10_4.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat22) + u_xlat5.xyz;
					    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
					    u_xlat22 = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = vec3(u_xlat22) * u_xlat5.xyz;
					    u_xlat22 = dot(u_xlat0.xyz, u_xlat5.xyz);
					    u_xlat22 = max(u_xlat22, 0.0);
					    u_xlat22 = u_xlat22 * 1.10000002;
					    u_xlat22 = log2(u_xlat22);
					    u_xlat22 = u_xlat22 * 80.0;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat22 = min(u_xlat22, 2.0);
					    u_xlat22 = u_xlat22 * u_xlat10_6.x;
					    u_xlat23 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat23 = u_xlat23 + u_xlat23;
					    u_xlat5.xyz = u_xlat0.xyz * (-vec3(u_xlat23)) + (-u_xlat4.xyz);
					    u_xlat10_5 = texture(_Cubemap, u_xlat5.xyz);
					    u_xlat16_5.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz;
					    u_xlat16_13.xyz = u_xlat16_5.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_23 = dot(u_xlat16_13.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_5.xyz = (-u_xlat16_5.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_23);
					    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_13.xyz;
					    u_xlat23 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat13.xyz = vec3(u_xlat23) + (-_LightColor0.xyz);
					    u_xlat13.xyz = vec3(_LightDesaturate) * u_xlat13.xyz + _LightColor0.xyz;
					    u_xlat13.xyz = max(u_xlat13.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat13.xyz = min(u_xlat13.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat5.xyz = u_xlat16_5.xyz * u_xlat13.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat5.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat22);
					    u_xlat2.xyz = (-u_xlat3.xyz) * u_xlat13.xyz + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat13.xyz;
					    u_xlat2.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat2.xyz + u_xlat3.xyz;
					    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
					    u_xlat22 = dot(u_xlat0.xyz, u_xlat4.xyz);
					    u_xlat0.xyz = vs_TEXCOORD3.xyz * vec3(-0.100000001, -0.100000001, -0.100000001) + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat4.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat3.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = max(u_xlat22, 0.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.800000012;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = (-u_xlat0.x) * 0.800000012 + 1.0;
					    u_xlat17.x = u_xlat0.x * u_xlat21;
					    u_xlat3.y = float(0.0);
					    u_xlat17.y = float(0.0);
					    u_xlat0.xy = u_xlat10_6.xx * u_xlat17.xy;
					    u_xlat14.xy = u_xlat3.xy * _HighlightFunc_ST.xy + _HighlightFunc_ST.zw;
					    u_xlat10_3 = texture(_HighlightFunc, u_xlat14.xy);
					    u_xlat0.xy = u_xlat0.xy * _SkinFunc_copy_ST.xy + _SkinFunc_copy_ST.zw;
					    u_xlat10_0 = texture(_SkinFunc_copy, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat10_0.www * _SkinSubsurf.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat13.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat10_3.xyz * vec3(vec3(_highlightint, _highlightint, _highlightint)) + u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 _HighlightFunc_ST;
						vec4 _SkinSubsurf;
						vec4 _SkinFunc_copy_ST;
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _highlightint;
						float _FuncEffect;
						float _Metal;
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _HighlightFunc;
					uniform  sampler2D _SkinFunc_copy;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec4 u_xlat10_6;
					vec3 u_xlat13;
					vec3 u_xlat16_13;
					vec2 u_xlat14;
					vec2 u_xlat17;
					vec2 u_xlat18;
					float u_xlat21;
					float u_xlat22;
					int u_xlati22;
					float u_xlat23;
					float u_xlat16_23;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat21 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat21);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat4.y = 0.0;
					    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat5.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
					    u_xlat21 = dot(u_xlat5.xyz, u_xlat0.xyz);
					    u_xlat21 = max(u_xlat21, 0.0);
					    u_xlat22 = max(u_xlat21, 0.0199999996);
					    u_xlat21 = u_xlat21 * 0.5 + 0.5;
					    u_xlat22 = min(u_xlat22, 1.0);
					    u_xlat18.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat10_6 = texture(_ShadowMapTexture, u_xlat18.xy);
					    u_xlat4.x = u_xlat22 * u_xlat10_6.x;
					    u_xlat4.xy = u_xlat4.xy * _SkinFunc_ST.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_13.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_13.xyz + u_xlat10_4.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlati22 = unity_StereoEyeIndex;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati22].xyz;
					    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat22) + u_xlat5.xyz;
					    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
					    u_xlat22 = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = vec3(u_xlat22) * u_xlat5.xyz;
					    u_xlat22 = dot(u_xlat0.xyz, u_xlat5.xyz);
					    u_xlat22 = max(u_xlat22, 0.0);
					    u_xlat22 = u_xlat22 * 1.10000002;
					    u_xlat22 = log2(u_xlat22);
					    u_xlat22 = u_xlat22 * 80.0;
					    u_xlat22 = exp2(u_xlat22);
					    u_xlat22 = min(u_xlat22, 2.0);
					    u_xlat22 = u_xlat22 * u_xlat10_6.x;
					    u_xlat23 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat23 = u_xlat23 + u_xlat23;
					    u_xlat5.xyz = u_xlat0.xyz * (-vec3(u_xlat23)) + (-u_xlat4.xyz);
					    u_xlat10_5 = texture(_Cubemap, u_xlat5.xyz);
					    u_xlat16_5.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz;
					    u_xlat16_13.xyz = u_xlat16_5.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_23 = dot(u_xlat16_13.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_5.xyz = (-u_xlat16_5.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_23);
					    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_13.xyz;
					    u_xlat23 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat13.xyz = vec3(u_xlat23) + (-_LightColor0.xyz);
					    u_xlat13.xyz = vec3(_LightDesaturate) * u_xlat13.xyz + _LightColor0.xyz;
					    u_xlat13.xyz = max(u_xlat13.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat13.xyz = min(u_xlat13.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat5.xyz = u_xlat16_5.xyz * u_xlat13.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat5.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat22);
					    u_xlat2.xyz = (-u_xlat3.xyz) * u_xlat13.xyz + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat13.xyz;
					    u_xlat2.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat2.xyz + u_xlat3.xyz;
					    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
					    u_xlat22 = dot(u_xlat0.xyz, u_xlat4.xyz);
					    u_xlat0.xyz = vs_TEXCOORD3.xyz * vec3(-0.100000001, -0.100000001, -0.100000001) + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat4.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat3.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = max(u_xlat22, 0.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.800000012;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = (-u_xlat0.x) * 0.800000012 + 1.0;
					    u_xlat17.x = u_xlat0.x * u_xlat21;
					    u_xlat3.y = float(0.0);
					    u_xlat17.y = float(0.0);
					    u_xlat0.xy = u_xlat10_6.xx * u_xlat17.xy;
					    u_xlat14.xy = u_xlat3.xy * _HighlightFunc_ST.xy + _HighlightFunc_ST.zw;
					    u_xlat10_3 = texture(_HighlightFunc, u_xlat14.xy);
					    u_xlat0.xy = u_xlat0.xy * _SkinFunc_copy_ST.xy + _SkinFunc_copy_ST.zw;
					    u_xlat10_0 = texture(_SkinFunc_copy, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat10_0.www * _SkinSubsurf.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat13.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat10_3.xyz * vec3(vec3(_highlightint, _highlightint, _highlightint)) + u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
		Pass {
			Name "FORWARD_DELTA"
			Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Overlay+999999999" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
			Blend One One, One One
			GpuProgramID 154633
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
						vec4 unused_0_2[10];
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
						vec4 unused_0_2[10];
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
						vec4 unused_0_2[10];
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
						vec4 unused_0_2[10];
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
						vec4 unused_0_2[10];
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
						vec4 unused_0_2[10];
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
						vec4 unused_0_2[10];
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
						vec4 unused_0_2[10];
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
						vec4 unused_0_2[10];
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
						vec4 unused_0_2[10];
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
						vec4 unused_0_2[10];
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
						vec4 unused_0_2[10];
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
						vec4 unused_0_2[10];
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
						vec4 unused_0_2[10];
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
						vec4 unused_0_2[10];
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
						vec4 unused_0_2[10];
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
						vec4 unused_0_2[10];
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
						vec4 unused_0_2[10];
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
						vec4 unused_0_2[10];
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
						vec4 unused_0_2[10];
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
						vec4 unused_0_2[10];
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
						vec4 unused_0_2[10];
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
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
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_9[2];
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					vec2 u_xlat5;
					vec4 u_xlat10_5;
					vec3 u_xlat10;
					vec3 u_xlat16_10;
					float u_xlat18;
					float u_xlat19;
					float u_xlat16_19;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = max(u_xlat18, 0.0199999996);
					    u_xlat18 = min(u_xlat18, 1.0);
					    u_xlat19 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_4 = texture(_LightTexture0, vec2(u_xlat19));
					    u_xlat5.x = u_xlat18 * u_xlat10_4.x;
					    u_xlat5.y = 0.0;
					    u_xlat10.xy = u_xlat5.xy * _SkinFunc_ST.xy + _SkinFunc_ST.zw;
					    u_xlat10_5 = texture(_SkinFunc, u_xlat10.xy);
					    u_xlat16_10.xyz = (-u_xlat10_5.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat10.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_10.xyz + u_xlat10_5.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat10.xyz;
					    u_xlat10.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat18 = dot(u_xlat10.xyz, u_xlat10.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = u_xlat10.xyz * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat10.xyz = vec3(u_xlat18) * u_xlat10.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = u_xlat18 * 1.10000002;
					    u_xlat18 = log2(u_xlat18);
					    u_xlat18 = u_xlat18 * 80.0;
					    u_xlat18 = exp2(u_xlat18);
					    u_xlat18 = min(u_xlat18, 2.0);
					    u_xlat18 = u_xlat18 * u_xlat10_4.x;
					    u_xlat19 = dot((-u_xlat10.xyz), u_xlat0.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat19)) + (-u_xlat10.xyz);
					    u_xlat10_3 = texture(_Cubemap, u_xlat0.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_3.xyz;
					    u_xlat19 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat3.xyz = vec3(u_xlat19) + (-_LightColor0.xyz);
					    u_xlat3.xyz = vec3(_LightDesaturate) * u_xlat3.xyz + _LightColor0.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat18);
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					vec2 u_xlat5;
					vec4 u_xlat10_5;
					vec3 u_xlat10;
					vec3 u_xlat16_10;
					float u_xlat18;
					int u_xlati18;
					float u_xlat19;
					float u_xlat16_19;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = max(u_xlat18, 0.0199999996);
					    u_xlat18 = min(u_xlat18, 1.0);
					    u_xlat19 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_4 = texture(_LightTexture0, vec2(u_xlat19));
					    u_xlat18 = u_xlat18 * u_xlat10_4.x;
					    u_xlat5.x = u_xlat18 * _SkinFunc_ST.x;
					    u_xlat5.y = 0.0;
					    u_xlat10.xy = u_xlat5.xy + _SkinFunc_ST.zw;
					    u_xlat10_5 = texture(_SkinFunc, u_xlat10.xy);
					    u_xlat16_10.xyz = (-u_xlat10_5.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat10.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_10.xyz + u_xlat10_5.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat10.xyz;
					    u_xlati18 = unity_StereoEyeIndex;
					    u_xlat10.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati18].xyz;
					    u_xlat18 = dot(u_xlat10.xyz, u_xlat10.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = u_xlat10.xyz * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat10.xyz = vec3(u_xlat18) * u_xlat10.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = u_xlat18 * 1.10000002;
					    u_xlat18 = log2(u_xlat18);
					    u_xlat18 = u_xlat18 * 80.0;
					    u_xlat18 = exp2(u_xlat18);
					    u_xlat18 = min(u_xlat18, 2.0);
					    u_xlat18 = u_xlat18 * u_xlat10_4.x;
					    u_xlat19 = dot((-u_xlat10.xyz), u_xlat0.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat19)) + (-u_xlat10.xyz);
					    u_xlat10_3 = texture(_Cubemap, u_xlat0.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_3.xyz;
					    u_xlat19 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat3.xyz = vec3(u_xlat19) + (-_LightColor0.xyz);
					    u_xlat3.xyz = vec3(_LightDesaturate) * u_xlat3.xyz + _LightColor0.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat18);
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
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
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_9[2];
					};
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat16_4;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					vec3 u_xlat16_5;
					float u_xlat18;
					float u_xlat16_18;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = max(u_xlat18, 0.0199999996);
					    u_xlat18 = min(u_xlat18, 1.0);
					    u_xlat4.x = u_xlat18 * _SkinFunc_ST.x;
					    u_xlat4.y = 0.0;
					    u_xlat4.xy = u_xlat4.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_5.xyz + u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat18 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat5.xyz = vec3(u_xlat18) * u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat18 = dot((-u_xlat5.xyz), u_xlat0.xyz);
					    u_xlat18 = u_xlat18 + u_xlat18;
					    u_xlat4.xyz = u_xlat0.xyz * (-vec3(u_xlat18)) + (-u_xlat5.xyz);
					    u_xlat10_4 = texture(_Cubemap, u_xlat4.xyz);
					    u_xlat16_4.xyz = u_xlat10_4.xyz * u_xlat10_4.xyz;
					    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_18 = dot(u_xlat16_5.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_4.xyz = (-u_xlat16_4.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_18);
					    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_5.xyz;
					    u_xlat18 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat5.xyz = vec3(u_xlat18) + (-_LightColor0.xyz);
					    u_xlat5.xyz = vec3(_LightDesaturate) * u_xlat5.xyz + _LightColor0.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat5.xyz = min(u_xlat5.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat4.xyz = u_xlat16_4.xyz * u_xlat5.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = u_xlat0.x * 1.10000002;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 80.0;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = min(u_xlat0.x, 2.0);
					    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + u_xlat0.xxx;
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat5.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat16_4;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					vec3 u_xlat16_5;
					float u_xlat18;
					float u_xlat16_18;
					int u_xlati18;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = max(u_xlat18, 0.0199999996);
					    u_xlat18 = min(u_xlat18, 1.0);
					    u_xlat4.x = u_xlat18 * _SkinFunc_ST.x;
					    u_xlat4.y = 0.0;
					    u_xlat4.xy = u_xlat4.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_5.xyz + u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
					    u_xlati18 = unity_StereoEyeIndex;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati18].xyz;
					    u_xlat18 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat5.xyz = vec3(u_xlat18) * u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat18 = dot((-u_xlat5.xyz), u_xlat0.xyz);
					    u_xlat18 = u_xlat18 + u_xlat18;
					    u_xlat4.xyz = u_xlat0.xyz * (-vec3(u_xlat18)) + (-u_xlat5.xyz);
					    u_xlat10_4 = texture(_Cubemap, u_xlat4.xyz);
					    u_xlat16_4.xyz = u_xlat10_4.xyz * u_xlat10_4.xyz;
					    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_18 = dot(u_xlat16_5.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_4.xyz = (-u_xlat16_4.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_18);
					    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_5.xyz;
					    u_xlat18 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat5.xyz = vec3(u_xlat18) + (-_LightColor0.xyz);
					    u_xlat5.xyz = vec3(_LightDesaturate) * u_xlat5.xyz + _LightColor0.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat5.xyz = min(u_xlat5.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat4.xyz = u_xlat16_4.xyz * u_xlat5.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = u_xlat0.x * 1.10000002;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 80.0;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = min(u_xlat0.x, 2.0);
					    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + u_xlat0.xxx;
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat5.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
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
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_9[2];
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					float u_xlat18;
					bool u_xlatb18;
					float u_xlat19;
					float u_xlat16_19;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat3.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat3.xy = u_xlat3.xy + vec2(0.5, 0.5);
					    u_xlat10_3 = texture(_LightTexture0, u_xlat3.xy);
					    u_xlatb18 = 0.0<vs_TEXCOORD5.z;
					    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
					    u_xlat18 = u_xlat10_3.w * u_xlat18;
					    u_xlat19 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_3 = texture(_LightTextureB0, vec2(u_xlat19));
					    u_xlat18 = u_xlat18 * u_xlat10_3.x;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = max(u_xlat19, 0.0199999996);
					    u_xlat19 = min(u_xlat19, 1.0);
					    u_xlat19 = u_xlat18 * u_xlat19;
					    u_xlat4.x = u_xlat19 * _SkinFunc_ST.x;
					    u_xlat4.y = 0.0;
					    u_xlat4.xy = u_xlat4.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_5.xyz + u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat19 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat19) + u_xlat3.xyz;
					    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = u_xlat19 * 1.10000002;
					    u_xlat19 = log2(u_xlat19);
					    u_xlat19 = u_xlat19 * 80.0;
					    u_xlat19 = exp2(u_xlat19);
					    u_xlat19 = min(u_xlat19, 2.0);
					    u_xlat18 = u_xlat18 * u_xlat19;
					    u_xlat19 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat19)) + (-u_xlat4.xyz);
					    u_xlat10_3 = texture(_Cubemap, u_xlat0.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_3.xyz;
					    u_xlat19 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat3.xyz = vec3(u_xlat19) + (-_LightColor0.xyz);
					    u_xlat3.xyz = vec3(_LightDesaturate) * u_xlat3.xyz + _LightColor0.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat18);
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					float u_xlat18;
					bool u_xlatb18;
					float u_xlat19;
					float u_xlat16_19;
					int u_xlati19;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat3.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat3.xy = u_xlat3.xy + vec2(0.5, 0.5);
					    u_xlat10_3 = texture(_LightTexture0, u_xlat3.xy);
					    u_xlatb18 = 0.0<vs_TEXCOORD5.z;
					    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
					    u_xlat18 = u_xlat10_3.w * u_xlat18;
					    u_xlat19 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_3 = texture(_LightTextureB0, vec2(u_xlat19));
					    u_xlat18 = u_xlat18 * u_xlat10_3.x;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = max(u_xlat19, 0.0199999996);
					    u_xlat19 = min(u_xlat19, 1.0);
					    u_xlat4.x = u_xlat18 * u_xlat19;
					    u_xlat4.y = 0.0;
					    u_xlat4.xy = u_xlat4.xy * _SkinFunc_ST.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_5.xyz + u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
					    u_xlati19 = unity_StereoEyeIndex;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati19].xyz;
					    u_xlat19 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat19) + u_xlat3.xyz;
					    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = u_xlat19 * 1.10000002;
					    u_xlat19 = log2(u_xlat19);
					    u_xlat19 = u_xlat19 * 80.0;
					    u_xlat19 = exp2(u_xlat19);
					    u_xlat19 = min(u_xlat19, 2.0);
					    u_xlat18 = u_xlat18 * u_xlat19;
					    u_xlat19 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat19)) + (-u_xlat4.xyz);
					    u_xlat10_3 = texture(_Cubemap, u_xlat0.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_3.xyz;
					    u_xlat19 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat3.xyz = vec3(u_xlat19) + (-_LightColor0.xyz);
					    u_xlat3.xyz = vec3(_LightDesaturate) * u_xlat3.xyz + _LightColor0.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat18);
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
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
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_9[2];
					};
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					float u_xlat18;
					float u_xlat19;
					float u_xlat16_19;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = max(u_xlat18, 0.0199999996);
					    u_xlat18 = min(u_xlat18, 1.0);
					    u_xlat19 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_4 = texture(_LightTextureB0, vec2(u_xlat19));
					    u_xlat10_5 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
					    u_xlat16_19 = u_xlat10_4.x * u_xlat10_5.w;
					    u_xlat4.x = u_xlat18 * u_xlat16_19;
					    u_xlat4.y = 0.0;
					    u_xlat4.xy = u_xlat4.xy * _SkinFunc_ST.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_5.xyz + u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat18 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat4.xyz = vec3(u_xlat18) * u_xlat4.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = u_xlat18 * 1.10000002;
					    u_xlat18 = log2(u_xlat18);
					    u_xlat18 = u_xlat18 * 80.0;
					    u_xlat18 = exp2(u_xlat18);
					    u_xlat18 = min(u_xlat18, 2.0);
					    u_xlat18 = u_xlat18 * u_xlat16_19;
					    u_xlat19 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat19)) + (-u_xlat4.xyz);
					    u_xlat10_3 = texture(_Cubemap, u_xlat0.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_3.xyz;
					    u_xlat19 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat3.xyz = vec3(u_xlat19) + (-_LightColor0.xyz);
					    u_xlat3.xyz = vec3(_LightDesaturate) * u_xlat3.xyz + _LightColor0.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat18);
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					float u_xlat18;
					int u_xlati18;
					float u_xlat19;
					float u_xlat16_19;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = max(u_xlat18, 0.0199999996);
					    u_xlat18 = min(u_xlat18, 1.0);
					    u_xlat19 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_4 = texture(_LightTextureB0, vec2(u_xlat19));
					    u_xlat10_5 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
					    u_xlat16_19 = u_xlat10_4.x * u_xlat10_5.w;
					    u_xlat18 = u_xlat18 * u_xlat16_19;
					    u_xlat4.x = u_xlat18 * _SkinFunc_ST.x;
					    u_xlat4.y = 0.0;
					    u_xlat4.xy = u_xlat4.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_5.xyz + u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
					    u_xlati18 = unity_StereoEyeIndex;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati18].xyz;
					    u_xlat18 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat4.xyz = vec3(u_xlat18) * u_xlat4.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = u_xlat18 * 1.10000002;
					    u_xlat18 = log2(u_xlat18);
					    u_xlat18 = u_xlat18 * 80.0;
					    u_xlat18 = exp2(u_xlat18);
					    u_xlat18 = min(u_xlat18, 2.0);
					    u_xlat18 = u_xlat18 * u_xlat16_19;
					    u_xlat19 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat19)) + (-u_xlat4.xyz);
					    u_xlat10_3 = texture(_Cubemap, u_xlat0.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_3.xyz;
					    u_xlat19 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat3.xyz = vec3(u_xlat19) + (-_LightColor0.xyz);
					    u_xlat3.xyz = vec3(_LightDesaturate) * u_xlat3.xyz + _LightColor0.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat18);
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
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
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_9[2];
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD5;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec3 u_xlat16_4;
					vec4 u_xlat10_4;
					vec4 u_xlat10_5;
					float u_xlat18;
					float u_xlat19;
					float u_xlat16_19;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = max(u_xlat18, 0.0199999996);
					    u_xlat18 = min(u_xlat18, 1.0);
					    u_xlat10_4 = texture(_LightTexture0, vs_TEXCOORD5.xy);
					    u_xlat4.x = u_xlat18 * u_xlat10_4.w;
					    u_xlat4.y = 0.0;
					    u_xlat4.xy = u_xlat4.xy * _SkinFunc_ST.xy + _SkinFunc_ST.zw;
					    u_xlat10_5 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_4.xyz = (-u_xlat10_5.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_4.xyz + u_xlat10_5.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat18 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat4.xyz = vec3(u_xlat18) * u_xlat4.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = u_xlat18 * 1.10000002;
					    u_xlat18 = log2(u_xlat18);
					    u_xlat18 = u_xlat18 * 80.0;
					    u_xlat18 = exp2(u_xlat18);
					    u_xlat18 = min(u_xlat18, 2.0);
					    u_xlat18 = u_xlat18 * u_xlat10_4.w;
					    u_xlat19 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat19)) + (-u_xlat4.xyz);
					    u_xlat10_3 = texture(_Cubemap, u_xlat0.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_3.xyz;
					    u_xlat19 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat3.xyz = vec3(u_xlat19) + (-_LightColor0.xyz);
					    u_xlat3.xyz = vec3(_LightDesaturate) * u_xlat3.xyz + _LightColor0.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat18);
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD5;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec3 u_xlat16_4;
					vec4 u_xlat10_4;
					vec4 u_xlat10_5;
					float u_xlat18;
					int u_xlati18;
					float u_xlat19;
					float u_xlat16_19;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = max(u_xlat18, 0.0199999996);
					    u_xlat18 = min(u_xlat18, 1.0);
					    u_xlat10_4 = texture(_LightTexture0, vs_TEXCOORD5.xy);
					    u_xlat18 = u_xlat18 * u_xlat10_4.w;
					    u_xlat4.x = u_xlat18 * _SkinFunc_ST.x;
					    u_xlat4.y = 0.0;
					    u_xlat4.xy = u_xlat4.xy + _SkinFunc_ST.zw;
					    u_xlat10_5 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_4.xyz = (-u_xlat10_5.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_4.xyz + u_xlat10_5.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
					    u_xlati18 = unity_StereoEyeIndex;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati18].xyz;
					    u_xlat18 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat4.xyz = vec3(u_xlat18) * u_xlat4.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = u_xlat18 * 1.10000002;
					    u_xlat18 = log2(u_xlat18);
					    u_xlat18 = u_xlat18 * 80.0;
					    u_xlat18 = exp2(u_xlat18);
					    u_xlat18 = min(u_xlat18, 2.0);
					    u_xlat18 = u_xlat18 * u_xlat10_4.w;
					    u_xlat19 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat19)) + (-u_xlat4.xyz);
					    u_xlat10_3 = texture(_Cubemap, u_xlat0.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_3.xyz;
					    u_xlat19 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat3.xyz = vec3(u_xlat19) + (-_LightColor0.xyz);
					    u_xlat3.xyz = vec3(_LightDesaturate) * u_xlat3.xyz + _LightColor0.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat18);
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
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
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_9[2];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  sampler2D _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD5;
					in  vec4 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					float u_xlat18;
					bool u_xlatb18;
					float u_xlat19;
					float u_xlat16_19;
					float u_xlat10_19;
					float u_xlat20;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat3.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat3.xy = u_xlat3.xy + vec2(0.5, 0.5);
					    u_xlat10_3 = texture(_LightTexture0, u_xlat3.xy);
					    u_xlatb18 = 0.0<vs_TEXCOORD5.z;
					    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
					    u_xlat18 = u_xlat10_3.w * u_xlat18;
					    u_xlat19 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_3 = texture(_LightTextureB0, vec2(u_xlat19));
					    u_xlat18 = u_xlat18 * u_xlat10_3.x;
					    u_xlat3.xyz = vs_TEXCOORD6.xyz / vs_TEXCOORD6.www;
					    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat10_19 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat20 = (-_LightShadowData.x) + 1.0;
					    u_xlat19 = u_xlat10_19 * u_xlat20 + _LightShadowData.x;
					    u_xlat18 = u_xlat18 * u_xlat19;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = max(u_xlat19, 0.0199999996);
					    u_xlat19 = min(u_xlat19, 1.0);
					    u_xlat19 = u_xlat18 * u_xlat19;
					    u_xlat4.x = u_xlat19 * _SkinFunc_ST.x;
					    u_xlat4.y = 0.0;
					    u_xlat4.xy = u_xlat4.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_5.xyz + u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat19 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat19) + u_xlat3.xyz;
					    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = u_xlat19 * 1.10000002;
					    u_xlat19 = log2(u_xlat19);
					    u_xlat19 = u_xlat19 * 80.0;
					    u_xlat19 = exp2(u_xlat19);
					    u_xlat19 = min(u_xlat19, 2.0);
					    u_xlat18 = u_xlat18 * u_xlat19;
					    u_xlat19 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat19)) + (-u_xlat4.xyz);
					    u_xlat10_3 = texture(_Cubemap, u_xlat0.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_3.xyz;
					    u_xlat19 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat3.xyz = vec3(u_xlat19) + (-_LightColor0.xyz);
					    u_xlat3.xyz = vec3(_LightDesaturate) * u_xlat3.xyz + _LightColor0.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat18);
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_2_0[24];
						vec4 _LightShadowData;
						vec4 unused_2_2;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  sampler2D _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD5;
					in  vec4 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					float u_xlat18;
					bool u_xlatb18;
					float u_xlat19;
					float u_xlat16_19;
					float u_xlat10_19;
					int u_xlati19;
					float u_xlat20;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat3.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat3.xy = u_xlat3.xy + vec2(0.5, 0.5);
					    u_xlat10_3 = texture(_LightTexture0, u_xlat3.xy);
					    u_xlatb18 = 0.0<vs_TEXCOORD5.z;
					    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
					    u_xlat18 = u_xlat10_3.w * u_xlat18;
					    u_xlat19 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_3 = texture(_LightTextureB0, vec2(u_xlat19));
					    u_xlat18 = u_xlat18 * u_xlat10_3.x;
					    u_xlat3.xyz = vs_TEXCOORD6.xyz / vs_TEXCOORD6.www;
					    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat10_19 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat20 = (-_LightShadowData.x) + 1.0;
					    u_xlat19 = u_xlat10_19 * u_xlat20 + _LightShadowData.x;
					    u_xlat18 = u_xlat18 * u_xlat19;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = max(u_xlat19, 0.0199999996);
					    u_xlat19 = min(u_xlat19, 1.0);
					    u_xlat19 = u_xlat18 * u_xlat19;
					    u_xlat4.x = u_xlat19 * _SkinFunc_ST.x;
					    u_xlat4.y = 0.0;
					    u_xlat4.xy = u_xlat4.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_5.xyz + u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
					    u_xlati19 = unity_StereoEyeIndex;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati19].xyz;
					    u_xlat19 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat19) + u_xlat3.xyz;
					    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = u_xlat19 * 1.10000002;
					    u_xlat19 = log2(u_xlat19);
					    u_xlat19 = u_xlat19 * 80.0;
					    u_xlat19 = exp2(u_xlat19);
					    u_xlat19 = min(u_xlat19, 2.0);
					    u_xlat18 = u_xlat18 * u_xlat19;
					    u_xlat19 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat19)) + (-u_xlat4.xyz);
					    u_xlat10_3 = texture(_Cubemap, u_xlat0.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_3.xyz;
					    u_xlat19 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat3.xyz = vec3(u_xlat19) + (-_LightColor0.xyz);
					    u_xlat3.xyz = vec3(_LightDesaturate) * u_xlat3.xyz + _LightColor0.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat18);
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_7[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
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
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_9[2];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  sampler2D _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD5;
					in  vec4 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					float u_xlat10_0;
					vec4 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat16_6;
					float u_xlat10_6;
					bool u_xlatb6;
					float u_xlat12;
					float u_xlat10_12;
					vec2 u_xlat13;
					float u_xlat19;
					float u_xlat16_19;
					float u_xlat20;
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
					    u_xlat6.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat6.xyz = u_xlat6.xyz * u_xlat1.xxx;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
					    u_xlat2.x = dot(u_xlat6.xyz, u_xlat1.xyz);
					    u_xlat2.x = max(u_xlat2.x, 0.0);
					    u_xlat2.x = max(u_xlat2.x, 0.0199999996);
					    u_xlat2.x = min(u_xlat2.x, 1.0);
					    u_xlat2.x = u_xlat0.x * u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * _SkinFunc_ST.x;
					    u_xlat2.y = 0.0;
					    u_xlat2.xy = u_xlat2.xy + _SkinFunc_ST.zw;
					    u_xlat10_2 = texture(_SkinFunc, u_xlat2.xy);
					    u_xlat16_3.xyz = (-u_xlat10_2.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_3.xyz + u_xlat10_2.xyz;
					    u_xlat20 = u_xlat1.y * u_xlat1.y;
					    u_xlat20 = u_xlat1.x * u_xlat1.x + (-u_xlat20);
					    u_xlat3 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat3);
					    u_xlat4.y = dot(unity_SHBg, u_xlat3);
					    u_xlat4.z = dot(unity_SHBb, u_xlat3);
					    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat20) + u_xlat4.xyz;
					    u_xlat1.w = 4.80000019;
					    u_xlat4.x = dot(unity_SHAr, u_xlat1);
					    u_xlat4.y = dot(unity_SHAg, u_xlat1);
					    u_xlat4.z = dot(unity_SHAb, u_xlat1);
					    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat19 = dot(u_xlat3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat4.xyz = (-u_xlat3.xyz) + vec3(u_xlat19);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_4 = texture(_Diffuse, u_xlat4.xy);
					    u_xlat5.xyz = (-u_xlat10_4.xyz) + _color.xyz;
					    u_xlat4.xyz = vec3(_Color) * u_xlat5.xyz + u_xlat10_4.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz;
					    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat6.xyz = u_xlat3.xyz * vec3(u_xlat19) + u_xlat6.xyz;
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat19);
					    u_xlat6.x = dot(u_xlat1.xyz, u_xlat6.xyz);
					    u_xlat6.x = max(u_xlat6.x, 0.0);
					    u_xlat6.x = u_xlat6.x * 1.10000002;
					    u_xlat6.x = log2(u_xlat6.x);
					    u_xlat6.x = u_xlat6.x * 80.0;
					    u_xlat6.x = exp2(u_xlat6.x);
					    u_xlat6.x = min(u_xlat6.x, 2.0);
					    u_xlat0.x = u_xlat6.x * u_xlat0.x;
					    u_xlat6.x = dot((-u_xlat3.xyz), u_xlat1.xyz);
					    u_xlat6.x = u_xlat6.x + u_xlat6.x;
					    u_xlat6.xyz = u_xlat1.xyz * (-u_xlat6.xxx) + (-u_xlat3.xyz);
					    u_xlat10_1 = texture(_Cubemap, u_xlat6.xyz);
					    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
					    u_xlat16_1.xyz = u_xlat16_6.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_6.xyz = (-u_xlat16_6.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_1.xyz;
					    u_xlat1.x = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat1.xyz = u_xlat1.xxx + (-_LightColor0.xyz);
					    u_xlat1.xyz = vec3(_LightDesaturate) * u_xlat1.xyz + _LightColor0.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat6.xyz = u_xlat16_6.xyz * u_xlat1.xyz;
					    u_xlat6.xyz = u_xlat4.xyz * u_xlat6.xyz;
					    u_xlat0.xyz = u_xlat6.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + u_xlat0.xxx;
					    u_xlat0.xyz = (-u_xlat2.xyz) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_7[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_2_0[24];
						vec4 _LightShadowData;
						vec4 unused_2_2;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  sampler2D _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD5;
					in  vec4 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					float u_xlat10_0;
					vec4 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat16_6;
					float u_xlat10_6;
					bool u_xlatb6;
					float u_xlat12;
					float u_xlat10_12;
					vec2 u_xlat13;
					float u_xlat19;
					float u_xlat16_19;
					int u_xlati19;
					float u_xlat20;
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
					    u_xlat6.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat6.xyz = u_xlat6.xyz * u_xlat1.xxx;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
					    u_xlat2.x = dot(u_xlat6.xyz, u_xlat1.xyz);
					    u_xlat2.x = max(u_xlat2.x, 0.0);
					    u_xlat2.x = max(u_xlat2.x, 0.0199999996);
					    u_xlat2.x = min(u_xlat2.x, 1.0);
					    u_xlat2.x = u_xlat0.x * u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * _SkinFunc_ST.x;
					    u_xlat2.y = 0.0;
					    u_xlat2.xy = u_xlat2.xy + _SkinFunc_ST.zw;
					    u_xlat10_2 = texture(_SkinFunc, u_xlat2.xy);
					    u_xlat16_3.xyz = (-u_xlat10_2.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_3.xyz + u_xlat10_2.xyz;
					    u_xlat20 = u_xlat1.y * u_xlat1.y;
					    u_xlat20 = u_xlat1.x * u_xlat1.x + (-u_xlat20);
					    u_xlat3 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat3);
					    u_xlat4.y = dot(unity_SHBg, u_xlat3);
					    u_xlat4.z = dot(unity_SHBb, u_xlat3);
					    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat20) + u_xlat4.xyz;
					    u_xlat1.w = 4.80000019;
					    u_xlat4.x = dot(unity_SHAr, u_xlat1);
					    u_xlat4.y = dot(unity_SHAg, u_xlat1);
					    u_xlat4.z = dot(unity_SHAb, u_xlat1);
					    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat19 = dot(u_xlat3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat4.xyz = (-u_xlat3.xyz) + vec3(u_xlat19);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat4.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_4 = texture(_Diffuse, u_xlat4.xy);
					    u_xlat5.xyz = (-u_xlat10_4.xyz) + _color.xyz;
					    u_xlat4.xyz = vec3(_Color) * u_xlat5.xyz + u_xlat10_4.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz;
					    u_xlati19 = unity_StereoEyeIndex;
					    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati19].xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat6.xyz = u_xlat3.xyz * vec3(u_xlat19) + u_xlat6.xyz;
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat19);
					    u_xlat6.x = dot(u_xlat1.xyz, u_xlat6.xyz);
					    u_xlat6.x = max(u_xlat6.x, 0.0);
					    u_xlat6.x = u_xlat6.x * 1.10000002;
					    u_xlat6.x = log2(u_xlat6.x);
					    u_xlat6.x = u_xlat6.x * 80.0;
					    u_xlat6.x = exp2(u_xlat6.x);
					    u_xlat6.x = min(u_xlat6.x, 2.0);
					    u_xlat0.x = u_xlat6.x * u_xlat0.x;
					    u_xlat6.x = dot((-u_xlat3.xyz), u_xlat1.xyz);
					    u_xlat6.x = u_xlat6.x + u_xlat6.x;
					    u_xlat6.xyz = u_xlat1.xyz * (-u_xlat6.xxx) + (-u_xlat3.xyz);
					    u_xlat10_1 = texture(_Cubemap, u_xlat6.xyz);
					    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
					    u_xlat16_1.xyz = u_xlat16_6.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_6.xyz = (-u_xlat16_6.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_1.xyz;
					    u_xlat1.x = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat1.xyz = u_xlat1.xxx + (-_LightColor0.xyz);
					    u_xlat1.xyz = vec3(_LightDesaturate) * u_xlat1.xyz + _LightColor0.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat6.xyz = u_xlat16_6.xyz * u_xlat1.xyz;
					    u_xlat6.xyz = u_xlat4.xyz * u_xlat6.xyz;
					    u_xlat0.xyz = u_xlat6.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + u_xlat0.xxx;
					    u_xlat0.xyz = (-u_xlat2.xyz) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
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
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_9[2];
					};
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					vec4 u_xlat10_4;
					vec2 u_xlat5;
					vec4 u_xlat10_5;
					vec3 u_xlat10;
					vec3 u_xlat16_10;
					float u_xlat18;
					float u_xlat19;
					float u_xlat16_19;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = max(u_xlat18, 0.0199999996);
					    u_xlat18 = min(u_xlat18, 1.0);
					    u_xlat4.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
					    u_xlat5.x = u_xlat18 * u_xlat10_4.x;
					    u_xlat5.y = 0.0;
					    u_xlat10.xy = u_xlat5.xy * _SkinFunc_ST.xy + _SkinFunc_ST.zw;
					    u_xlat10_5 = texture(_SkinFunc, u_xlat10.xy);
					    u_xlat16_10.xyz = (-u_xlat10_5.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat10.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_10.xyz + u_xlat10_5.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat10.xyz;
					    u_xlat10.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat18 = dot(u_xlat10.xyz, u_xlat10.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = u_xlat10.xyz * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat10.xyz = vec3(u_xlat18) * u_xlat10.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = u_xlat18 * 1.10000002;
					    u_xlat18 = log2(u_xlat18);
					    u_xlat18 = u_xlat18 * 80.0;
					    u_xlat18 = exp2(u_xlat18);
					    u_xlat18 = min(u_xlat18, 2.0);
					    u_xlat18 = u_xlat18 * u_xlat10_4.x;
					    u_xlat19 = dot((-u_xlat10.xyz), u_xlat0.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat19)) + (-u_xlat10.xyz);
					    u_xlat10_3 = texture(_Cubemap, u_xlat0.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_3.xyz;
					    u_xlat19 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat3.xyz = vec3(u_xlat19) + (-_LightColor0.xyz);
					    u_xlat3.xyz = vec3(_LightDesaturate) * u_xlat3.xyz + _LightColor0.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat18);
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					vec4 u_xlat10_4;
					vec2 u_xlat5;
					vec4 u_xlat10_5;
					vec3 u_xlat10;
					vec3 u_xlat16_10;
					float u_xlat18;
					int u_xlati18;
					float u_xlat19;
					float u_xlat16_19;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = max(u_xlat18, 0.0199999996);
					    u_xlat18 = min(u_xlat18, 1.0);
					    u_xlat4.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
					    u_xlat5.x = u_xlat18 * u_xlat10_4.x;
					    u_xlat5.y = 0.0;
					    u_xlat10.xy = u_xlat5.xy * _SkinFunc_ST.xy + _SkinFunc_ST.zw;
					    u_xlat10_5 = texture(_SkinFunc, u_xlat10.xy);
					    u_xlat16_10.xyz = (-u_xlat10_5.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat10.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_10.xyz + u_xlat10_5.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat10.xyz;
					    u_xlati18 = unity_StereoEyeIndex;
					    u_xlat10.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati18].xyz;
					    u_xlat18 = dot(u_xlat10.xyz, u_xlat10.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = u_xlat10.xyz * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat10.xyz = vec3(u_xlat18) * u_xlat10.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = u_xlat18 * 1.10000002;
					    u_xlat18 = log2(u_xlat18);
					    u_xlat18 = u_xlat18 * 80.0;
					    u_xlat18 = exp2(u_xlat18);
					    u_xlat18 = min(u_xlat18, 2.0);
					    u_xlat18 = u_xlat18 * u_xlat10_4.x;
					    u_xlat19 = dot((-u_xlat10.xyz), u_xlat0.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat19)) + (-u_xlat10.xyz);
					    u_xlat10_3 = texture(_Cubemap, u_xlat0.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_3.xyz;
					    u_xlat19 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat3.xyz = vec3(u_xlat19) + (-_LightColor0.xyz);
					    u_xlat3.xyz = vec3(_LightDesaturate) * u_xlat3.xyz + _LightColor0.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat18);
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
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
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_9[2];
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD5;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					float u_xlat18;
					float u_xlat19;
					float u_xlat16_19;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = max(u_xlat18, 0.0199999996);
					    u_xlat18 = min(u_xlat18, 1.0);
					    u_xlat4.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
					    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
					    u_xlat10_5 = texture(_LightTexture0, vs_TEXCOORD5.xy);
					    u_xlat16_19 = u_xlat10_4.x * u_xlat10_5.w;
					    u_xlat18 = u_xlat18 * u_xlat16_19;
					    u_xlat4.x = u_xlat18 * _SkinFunc_ST.x;
					    u_xlat4.y = 0.0;
					    u_xlat4.xy = u_xlat4.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_5.xyz + u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat18 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat4.xyz = vec3(u_xlat18) * u_xlat4.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = u_xlat18 * 1.10000002;
					    u_xlat18 = log2(u_xlat18);
					    u_xlat18 = u_xlat18 * 80.0;
					    u_xlat18 = exp2(u_xlat18);
					    u_xlat18 = min(u_xlat18, 2.0);
					    u_xlat18 = u_xlat18 * u_xlat16_19;
					    u_xlat19 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat19)) + (-u_xlat4.xyz);
					    u_xlat10_3 = texture(_Cubemap, u_xlat0.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_3.xyz;
					    u_xlat19 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat3.xyz = vec3(u_xlat19) + (-_LightColor0.xyz);
					    u_xlat3.xyz = vec3(_LightDesaturate) * u_xlat3.xyz + _LightColor0.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat18);
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD5;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					float u_xlat18;
					int u_xlati18;
					float u_xlat19;
					float u_xlat16_19;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = max(u_xlat18, 0.0199999996);
					    u_xlat18 = min(u_xlat18, 1.0);
					    u_xlat4.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
					    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
					    u_xlat10_5 = texture(_LightTexture0, vs_TEXCOORD5.xy);
					    u_xlat16_19 = u_xlat10_4.x * u_xlat10_5.w;
					    u_xlat4.x = u_xlat18 * u_xlat16_19;
					    u_xlat4.y = 0.0;
					    u_xlat4.xy = u_xlat4.xy * _SkinFunc_ST.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_5.xyz + u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
					    u_xlati18 = unity_StereoEyeIndex;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati18].xyz;
					    u_xlat18 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat4.xyz = vec3(u_xlat18) * u_xlat4.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = u_xlat18 * 1.10000002;
					    u_xlat18 = log2(u_xlat18);
					    u_xlat18 = u_xlat18 * 80.0;
					    u_xlat18 = exp2(u_xlat18);
					    u_xlat18 = min(u_xlat18, 2.0);
					    u_xlat18 = u_xlat18 * u_xlat16_19;
					    u_xlat19 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat19)) + (-u_xlat4.xyz);
					    u_xlat10_3 = texture(_Cubemap, u_xlat0.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_3.xyz;
					    u_xlat19 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat3.xyz = vec3(u_xlat19) + (-_LightColor0.xyz);
					    u_xlat3.xyz = vec3(_LightDesaturate) * u_xlat3.xyz + _LightColor0.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat18);
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1;
						vec4 _LightProjectionParams;
						vec4 unused_2_3[36];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_11[2];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					uniform  samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  samplerCube _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					float u_xlat18;
					float u_xlat10_18;
					float u_xlat19;
					float u_xlat16_19;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat18 = max(abs(vs_TEXCOORD6.y), abs(vs_TEXCOORD6.x));
					    u_xlat18 = max(u_xlat18, abs(vs_TEXCOORD6.z));
					    u_xlat18 = u_xlat18 + (-_LightProjectionParams.z);
					    u_xlat18 = max(u_xlat18, 9.99999975e-06);
					    u_xlat18 = u_xlat18 * _LightProjectionParams.w;
					    u_xlat18 = _LightProjectionParams.y / u_xlat18;
					    u_xlat18 = u_xlat18 + (-_LightProjectionParams.x);
					    u_xlat18 = (-u_xlat18) + 1.0;
					    vec4 txVec0 = vec4(vs_TEXCOORD6.xyz,u_xlat18);
					    u_xlat10_18 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat19 = (-_LightShadowData.x) + 1.0;
					    u_xlat18 = u_xlat10_18 * u_xlat19 + _LightShadowData.x;
					    u_xlat19 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_3 = texture(_LightTexture0, vec2(u_xlat19));
					    u_xlat18 = u_xlat18 * u_xlat10_3.x;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = max(u_xlat19, 0.0199999996);
					    u_xlat19 = min(u_xlat19, 1.0);
					    u_xlat4.x = u_xlat18 * u_xlat19;
					    u_xlat4.y = 0.0;
					    u_xlat4.xy = u_xlat4.xy * _SkinFunc_ST.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_5.xyz + u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat19 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat19) + u_xlat3.xyz;
					    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = u_xlat19 * 1.10000002;
					    u_xlat19 = log2(u_xlat19);
					    u_xlat19 = u_xlat19 * 80.0;
					    u_xlat19 = exp2(u_xlat19);
					    u_xlat19 = min(u_xlat19, 2.0);
					    u_xlat18 = u_xlat18 * u_xlat19;
					    u_xlat19 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat19)) + (-u_xlat4.xyz);
					    u_xlat10_3 = texture(_Cubemap, u_xlat0.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_3.xyz;
					    u_xlat19 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat3.xyz = vec3(u_xlat19) + (-_LightColor0.xyz);
					    u_xlat3.xyz = vec3(_LightDesaturate) * u_xlat3.xyz + _LightColor0.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat18);
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1;
						vec4 _LightProjectionParams;
						vec4 unused_1_3[36];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_11[2];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_2_0[24];
						vec4 _LightShadowData;
						vec4 unused_2_2;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					uniform  samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  samplerCube _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					float u_xlat18;
					float u_xlat10_18;
					float u_xlat19;
					float u_xlat16_19;
					int u_xlati19;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat18 = max(abs(vs_TEXCOORD6.y), abs(vs_TEXCOORD6.x));
					    u_xlat18 = max(u_xlat18, abs(vs_TEXCOORD6.z));
					    u_xlat18 = u_xlat18 + (-_LightProjectionParams.z);
					    u_xlat18 = max(u_xlat18, 9.99999975e-06);
					    u_xlat18 = u_xlat18 * _LightProjectionParams.w;
					    u_xlat18 = _LightProjectionParams.y / u_xlat18;
					    u_xlat18 = u_xlat18 + (-_LightProjectionParams.x);
					    u_xlat18 = (-u_xlat18) + 1.0;
					    vec4 txVec0 = vec4(vs_TEXCOORD6.xyz,u_xlat18);
					    u_xlat10_18 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat19 = (-_LightShadowData.x) + 1.0;
					    u_xlat18 = u_xlat10_18 * u_xlat19 + _LightShadowData.x;
					    u_xlat19 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_3 = texture(_LightTexture0, vec2(u_xlat19));
					    u_xlat18 = u_xlat18 * u_xlat10_3.x;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = max(u_xlat19, 0.0199999996);
					    u_xlat19 = min(u_xlat19, 1.0);
					    u_xlat4.x = u_xlat18 * u_xlat19;
					    u_xlat4.y = 0.0;
					    u_xlat4.xy = u_xlat4.xy * _SkinFunc_ST.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_5.xyz + u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
					    u_xlati19 = unity_StereoEyeIndex;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati19].xyz;
					    u_xlat19 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat19) + u_xlat3.xyz;
					    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = u_xlat19 * 1.10000002;
					    u_xlat19 = log2(u_xlat19);
					    u_xlat19 = u_xlat19 * 80.0;
					    u_xlat19 = exp2(u_xlat19);
					    u_xlat19 = min(u_xlat19, 2.0);
					    u_xlat18 = u_xlat18 * u_xlat19;
					    u_xlat19 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat19)) + (-u_xlat4.xyz);
					    u_xlat10_3 = texture(_Cubemap, u_xlat0.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_3.xyz;
					    u_xlat19 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat3.xyz = vec3(u_xlat19) + (-_LightColor0.xyz);
					    u_xlat3.xyz = vec3(_LightDesaturate) * u_xlat3.xyz + _LightColor0.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat18);
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1;
						vec4 _LightProjectionParams;
						vec4 unused_2_3[36];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_11[2];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					uniform  samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  samplerCube _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					float u_xlat18;
					float u_xlat19;
					float u_xlat16_19;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat18 = max(abs(vs_TEXCOORD6.y), abs(vs_TEXCOORD6.x));
					    u_xlat18 = max(u_xlat18, abs(vs_TEXCOORD6.z));
					    u_xlat18 = u_xlat18 + (-_LightProjectionParams.z);
					    u_xlat18 = max(u_xlat18, 9.99999975e-06);
					    u_xlat18 = u_xlat18 * _LightProjectionParams.w;
					    u_xlat18 = _LightProjectionParams.y / u_xlat18;
					    u_xlat18 = u_xlat18 + (-_LightProjectionParams.x);
					    u_xlat18 = (-u_xlat18) + 1.0;
					    u_xlat3.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
					    vec4 txVec0 = vec4(u_xlat3.xyz,u_xlat18);
					    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat4.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
					    vec4 txVec1 = vec4(u_xlat4.xyz,u_xlat18);
					    u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
					    u_xlat4.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
					    vec4 txVec2 = vec4(u_xlat4.xyz,u_xlat18);
					    u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
					    u_xlat4.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
					    vec4 txVec3 = vec4(u_xlat4.xyz,u_xlat18);
					    u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
					    u_xlat18 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
					    u_xlat19 = (-_LightShadowData.x) + 1.0;
					    u_xlat18 = u_xlat18 * u_xlat19 + _LightShadowData.x;
					    u_xlat19 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_3 = texture(_LightTexture0, vec2(u_xlat19));
					    u_xlat18 = u_xlat18 * u_xlat10_3.x;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = max(u_xlat19, 0.0199999996);
					    u_xlat19 = min(u_xlat19, 1.0);
					    u_xlat19 = u_xlat18 * u_xlat19;
					    u_xlat4.x = u_xlat19 * _SkinFunc_ST.x;
					    u_xlat4.y = 0.0;
					    u_xlat4.xy = u_xlat4.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_5.xyz + u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat19 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat19) + u_xlat3.xyz;
					    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = u_xlat19 * 1.10000002;
					    u_xlat19 = log2(u_xlat19);
					    u_xlat19 = u_xlat19 * 80.0;
					    u_xlat19 = exp2(u_xlat19);
					    u_xlat19 = min(u_xlat19, 2.0);
					    u_xlat18 = u_xlat18 * u_xlat19;
					    u_xlat19 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat19)) + (-u_xlat4.xyz);
					    u_xlat10_3 = texture(_Cubemap, u_xlat0.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_3.xyz;
					    u_xlat19 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat3.xyz = vec3(u_xlat19) + (-_LightColor0.xyz);
					    u_xlat3.xyz = vec3(_LightDesaturate) * u_xlat3.xyz + _LightColor0.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat18);
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1;
						vec4 _LightProjectionParams;
						vec4 unused_1_3[36];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_11[2];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_2_0[24];
						vec4 _LightShadowData;
						vec4 unused_2_2;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					uniform  samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  samplerCube _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					float u_xlat18;
					float u_xlat19;
					float u_xlat16_19;
					int u_xlati19;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat18 = max(abs(vs_TEXCOORD6.y), abs(vs_TEXCOORD6.x));
					    u_xlat18 = max(u_xlat18, abs(vs_TEXCOORD6.z));
					    u_xlat18 = u_xlat18 + (-_LightProjectionParams.z);
					    u_xlat18 = max(u_xlat18, 9.99999975e-06);
					    u_xlat18 = u_xlat18 * _LightProjectionParams.w;
					    u_xlat18 = _LightProjectionParams.y / u_xlat18;
					    u_xlat18 = u_xlat18 + (-_LightProjectionParams.x);
					    u_xlat18 = (-u_xlat18) + 1.0;
					    u_xlat3.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
					    vec4 txVec0 = vec4(u_xlat3.xyz,u_xlat18);
					    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat4.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
					    vec4 txVec1 = vec4(u_xlat4.xyz,u_xlat18);
					    u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
					    u_xlat4.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
					    vec4 txVec2 = vec4(u_xlat4.xyz,u_xlat18);
					    u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
					    u_xlat4.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
					    vec4 txVec3 = vec4(u_xlat4.xyz,u_xlat18);
					    u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
					    u_xlat18 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
					    u_xlat19 = (-_LightShadowData.x) + 1.0;
					    u_xlat18 = u_xlat18 * u_xlat19 + _LightShadowData.x;
					    u_xlat19 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_3 = texture(_LightTexture0, vec2(u_xlat19));
					    u_xlat18 = u_xlat18 * u_xlat10_3.x;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = max(u_xlat19, 0.0199999996);
					    u_xlat19 = min(u_xlat19, 1.0);
					    u_xlat19 = u_xlat18 * u_xlat19;
					    u_xlat4.x = u_xlat19 * _SkinFunc_ST.x;
					    u_xlat4.y = 0.0;
					    u_xlat4.xy = u_xlat4.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_5.xyz + u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
					    u_xlati19 = unity_StereoEyeIndex;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati19].xyz;
					    u_xlat19 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat19) + u_xlat3.xyz;
					    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = u_xlat19 * 1.10000002;
					    u_xlat19 = log2(u_xlat19);
					    u_xlat19 = u_xlat19 * 80.0;
					    u_xlat19 = exp2(u_xlat19);
					    u_xlat19 = min(u_xlat19, 2.0);
					    u_xlat18 = u_xlat18 * u_xlat19;
					    u_xlat19 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat19)) + (-u_xlat4.xyz);
					    u_xlat10_3 = texture(_Cubemap, u_xlat0.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_3.xyz;
					    u_xlat19 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat3.xyz = vec3(u_xlat19) + (-_LightColor0.xyz);
					    u_xlat3.xyz = vec3(_LightDesaturate) * u_xlat3.xyz + _LightColor0.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat18);
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1;
						vec4 _LightProjectionParams;
						vec4 unused_2_3[36];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_11[2];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					uniform  samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  samplerCube _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					float u_xlat18;
					float u_xlat10_18;
					float u_xlat19;
					float u_xlat16_19;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat18 = max(abs(vs_TEXCOORD6.y), abs(vs_TEXCOORD6.x));
					    u_xlat18 = max(u_xlat18, abs(vs_TEXCOORD6.z));
					    u_xlat18 = u_xlat18 + (-_LightProjectionParams.z);
					    u_xlat18 = max(u_xlat18, 9.99999975e-06);
					    u_xlat18 = u_xlat18 * _LightProjectionParams.w;
					    u_xlat18 = _LightProjectionParams.y / u_xlat18;
					    u_xlat18 = u_xlat18 + (-_LightProjectionParams.x);
					    u_xlat18 = (-u_xlat18) + 1.0;
					    vec4 txVec0 = vec4(vs_TEXCOORD6.xyz,u_xlat18);
					    u_xlat10_18 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat19 = (-_LightShadowData.x) + 1.0;
					    u_xlat18 = u_xlat10_18 * u_xlat19 + _LightShadowData.x;
					    u_xlat19 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_3 = texture(_LightTextureB0, vec2(u_xlat19));
					    u_xlat10_4 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
					    u_xlat16_19 = u_xlat10_3.x * u_xlat10_4.w;
					    u_xlat18 = u_xlat18 * u_xlat16_19;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = max(u_xlat19, 0.0199999996);
					    u_xlat19 = min(u_xlat19, 1.0);
					    u_xlat4.x = u_xlat18 * u_xlat19;
					    u_xlat4.y = 0.0;
					    u_xlat4.xy = u_xlat4.xy * _SkinFunc_ST.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_5.xyz + u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat19 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat19) + u_xlat3.xyz;
					    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = u_xlat19 * 1.10000002;
					    u_xlat19 = log2(u_xlat19);
					    u_xlat19 = u_xlat19 * 80.0;
					    u_xlat19 = exp2(u_xlat19);
					    u_xlat19 = min(u_xlat19, 2.0);
					    u_xlat18 = u_xlat18 * u_xlat19;
					    u_xlat19 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat19)) + (-u_xlat4.xyz);
					    u_xlat10_3 = texture(_Cubemap, u_xlat0.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_3.xyz;
					    u_xlat19 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat3.xyz = vec3(u_xlat19) + (-_LightColor0.xyz);
					    u_xlat3.xyz = vec3(_LightDesaturate) * u_xlat3.xyz + _LightColor0.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat18);
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1;
						vec4 _LightProjectionParams;
						vec4 unused_1_3[36];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_11[2];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_2_0[24];
						vec4 _LightShadowData;
						vec4 unused_2_2;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					uniform  samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  samplerCube _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					float u_xlat18;
					float u_xlat10_18;
					float u_xlat19;
					float u_xlat16_19;
					int u_xlati19;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat18 = max(abs(vs_TEXCOORD6.y), abs(vs_TEXCOORD6.x));
					    u_xlat18 = max(u_xlat18, abs(vs_TEXCOORD6.z));
					    u_xlat18 = u_xlat18 + (-_LightProjectionParams.z);
					    u_xlat18 = max(u_xlat18, 9.99999975e-06);
					    u_xlat18 = u_xlat18 * _LightProjectionParams.w;
					    u_xlat18 = _LightProjectionParams.y / u_xlat18;
					    u_xlat18 = u_xlat18 + (-_LightProjectionParams.x);
					    u_xlat18 = (-u_xlat18) + 1.0;
					    vec4 txVec0 = vec4(vs_TEXCOORD6.xyz,u_xlat18);
					    u_xlat10_18 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat19 = (-_LightShadowData.x) + 1.0;
					    u_xlat18 = u_xlat10_18 * u_xlat19 + _LightShadowData.x;
					    u_xlat19 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_3 = texture(_LightTextureB0, vec2(u_xlat19));
					    u_xlat10_4 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
					    u_xlat16_19 = u_xlat10_3.x * u_xlat10_4.w;
					    u_xlat18 = u_xlat18 * u_xlat16_19;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = max(u_xlat19, 0.0199999996);
					    u_xlat19 = min(u_xlat19, 1.0);
					    u_xlat4.x = u_xlat18 * u_xlat19;
					    u_xlat4.y = 0.0;
					    u_xlat4.xy = u_xlat4.xy * _SkinFunc_ST.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_5.xyz + u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
					    u_xlati19 = unity_StereoEyeIndex;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati19].xyz;
					    u_xlat19 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat19) + u_xlat3.xyz;
					    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = u_xlat19 * 1.10000002;
					    u_xlat19 = log2(u_xlat19);
					    u_xlat19 = u_xlat19 * 80.0;
					    u_xlat19 = exp2(u_xlat19);
					    u_xlat19 = min(u_xlat19, 2.0);
					    u_xlat18 = u_xlat18 * u_xlat19;
					    u_xlat19 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat19)) + (-u_xlat4.xyz);
					    u_xlat10_3 = texture(_Cubemap, u_xlat0.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_3.xyz;
					    u_xlat19 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat3.xyz = vec3(u_xlat19) + (-_LightColor0.xyz);
					    u_xlat3.xyz = vec3(_LightDesaturate) * u_xlat3.xyz + _LightColor0.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat18);
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1;
						vec4 _LightProjectionParams;
						vec4 unused_2_3[36];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_11[2];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					uniform  samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  samplerCube _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					float u_xlat18;
					float u_xlat19;
					float u_xlat16_19;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat18 = max(abs(vs_TEXCOORD6.y), abs(vs_TEXCOORD6.x));
					    u_xlat18 = max(u_xlat18, abs(vs_TEXCOORD6.z));
					    u_xlat18 = u_xlat18 + (-_LightProjectionParams.z);
					    u_xlat18 = max(u_xlat18, 9.99999975e-06);
					    u_xlat18 = u_xlat18 * _LightProjectionParams.w;
					    u_xlat18 = _LightProjectionParams.y / u_xlat18;
					    u_xlat18 = u_xlat18 + (-_LightProjectionParams.x);
					    u_xlat18 = (-u_xlat18) + 1.0;
					    u_xlat3.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
					    vec4 txVec0 = vec4(u_xlat3.xyz,u_xlat18);
					    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat4.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
					    vec4 txVec1 = vec4(u_xlat4.xyz,u_xlat18);
					    u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
					    u_xlat4.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
					    vec4 txVec2 = vec4(u_xlat4.xyz,u_xlat18);
					    u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
					    u_xlat4.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
					    vec4 txVec3 = vec4(u_xlat4.xyz,u_xlat18);
					    u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
					    u_xlat18 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
					    u_xlat19 = (-_LightShadowData.x) + 1.0;
					    u_xlat18 = u_xlat18 * u_xlat19 + _LightShadowData.x;
					    u_xlat19 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_3 = texture(_LightTextureB0, vec2(u_xlat19));
					    u_xlat10_4 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
					    u_xlat16_19 = u_xlat10_3.x * u_xlat10_4.w;
					    u_xlat18 = u_xlat18 * u_xlat16_19;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = max(u_xlat19, 0.0199999996);
					    u_xlat19 = min(u_xlat19, 1.0);
					    u_xlat19 = u_xlat18 * u_xlat19;
					    u_xlat4.x = u_xlat19 * _SkinFunc_ST.x;
					    u_xlat4.y = 0.0;
					    u_xlat4.xy = u_xlat4.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_5.xyz + u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat19 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat19) + u_xlat3.xyz;
					    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = u_xlat19 * 1.10000002;
					    u_xlat19 = log2(u_xlat19);
					    u_xlat19 = u_xlat19 * 80.0;
					    u_xlat19 = exp2(u_xlat19);
					    u_xlat19 = min(u_xlat19, 2.0);
					    u_xlat18 = u_xlat18 * u_xlat19;
					    u_xlat19 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat19)) + (-u_xlat4.xyz);
					    u_xlat10_3 = texture(_Cubemap, u_xlat0.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_3.xyz;
					    u_xlat19 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat3.xyz = vec3(u_xlat19) + (-_LightColor0.xyz);
					    u_xlat3.xyz = vec3(_LightDesaturate) * u_xlat3.xyz + _LightColor0.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat18);
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
						vec4 _Diffuse_ST;
						vec4 _SkinFunc_ST;
						vec4 unused_0_5[3];
						float _Color;
						vec4 _color;
						float _LightDesaturate;
						float _FuncEffect;
						float _Metal;
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1;
						vec4 _LightProjectionParams;
						vec4 unused_1_3[36];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_11[2];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_2_0[24];
						vec4 _LightShadowData;
						vec4 unused_2_2;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler2D _Diffuse;
					uniform  sampler2D _SkinFunc;
					uniform  samplerCube _Cubemap;
					uniform  samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
					uniform  samplerCube _ShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					float u_xlat18;
					float u_xlat19;
					float u_xlat16_19;
					int u_xlati19;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.x = u_xlat0.y * u_xlat0.y;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.w = 4.80000019;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.300000012, 0.300000012, 0.300000012));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2 = texture(_Diffuse, u_xlat2.xy);
					    u_xlat3.xyz = (-u_xlat10_2.xyz) + _color.xyz;
					    u_xlat2.xyz = vec3(_Color) * u_xlat3.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat18 = max(abs(vs_TEXCOORD6.y), abs(vs_TEXCOORD6.x));
					    u_xlat18 = max(u_xlat18, abs(vs_TEXCOORD6.z));
					    u_xlat18 = u_xlat18 + (-_LightProjectionParams.z);
					    u_xlat18 = max(u_xlat18, 9.99999975e-06);
					    u_xlat18 = u_xlat18 * _LightProjectionParams.w;
					    u_xlat18 = _LightProjectionParams.y / u_xlat18;
					    u_xlat18 = u_xlat18 + (-_LightProjectionParams.x);
					    u_xlat18 = (-u_xlat18) + 1.0;
					    u_xlat3.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
					    vec4 txVec0 = vec4(u_xlat3.xyz,u_xlat18);
					    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat4.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
					    vec4 txVec1 = vec4(u_xlat4.xyz,u_xlat18);
					    u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
					    u_xlat4.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
					    vec4 txVec2 = vec4(u_xlat4.xyz,u_xlat18);
					    u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
					    u_xlat4.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
					    vec4 txVec3 = vec4(u_xlat4.xyz,u_xlat18);
					    u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
					    u_xlat18 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
					    u_xlat19 = (-_LightShadowData.x) + 1.0;
					    u_xlat18 = u_xlat18 * u_xlat19 + _LightShadowData.x;
					    u_xlat19 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					    u_xlat10_3 = texture(_LightTextureB0, vec2(u_xlat19));
					    u_xlat10_4 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
					    u_xlat16_19 = u_xlat10_3.x * u_xlat10_4.w;
					    u_xlat18 = u_xlat18 * u_xlat16_19;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = max(u_xlat19, 0.0199999996);
					    u_xlat19 = min(u_xlat19, 1.0);
					    u_xlat19 = u_xlat18 * u_xlat19;
					    u_xlat4.x = u_xlat19 * _SkinFunc_ST.x;
					    u_xlat4.y = 0.0;
					    u_xlat4.xy = u_xlat4.xy + _SkinFunc_ST.zw;
					    u_xlat10_4 = texture(_SkinFunc, u_xlat4.xy);
					    u_xlat16_5.xyz = (-u_xlat10_4.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = vec3(vec3(_FuncEffect, _FuncEffect, _FuncEffect)) * u_xlat16_5.xyz + u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
					    u_xlati19 = unity_StereoEyeIndex;
					    u_xlat4.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati19].xyz;
					    u_xlat19 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat19) + u_xlat3.xyz;
					    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    u_xlat19 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat19 = max(u_xlat19, 0.0);
					    u_xlat19 = u_xlat19 * 1.10000002;
					    u_xlat19 = log2(u_xlat19);
					    u_xlat19 = u_xlat19 * 80.0;
					    u_xlat19 = exp2(u_xlat19);
					    u_xlat19 = min(u_xlat19, 2.0);
					    u_xlat18 = u_xlat18 * u_xlat19;
					    u_xlat19 = dot((-u_xlat4.xyz), u_xlat0.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat19)) + (-u_xlat4.xyz);
					    u_xlat10_3 = texture(_Cubemap, u_xlat0.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(40.0, 40.0, 40.0);
					    u_xlat16_19 = dot(u_xlat16_3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) * vec3(40.0, 40.0, 40.0) + vec3(u_xlat16_19);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.699999988, 0.699999988, 0.699999988) + u_xlat16_3.xyz;
					    u_xlat19 = dot(_LightColor0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					    u_xlat3.xyz = vec3(u_xlat19) + (-_LightColor0.xyz);
					    u_xlat3.xyz = vec3(_LightDesaturate) * u_xlat3.xyz + _LightColor0.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.400000006, 0.400000006, 0.400000006));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Metal, _Metal, _Metal)) + vec3(u_xlat18);
					    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
					    SV_Target0.xyz = vec3(vec3(_Metal, _Metal, _Metal)) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
			}
		}
	}
	Fallback "Diffuse"
	CustomEditor "ShaderForgeMaterialInspector"
}