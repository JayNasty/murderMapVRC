Shader "Yukio's Shaders/Fur Shader [Low]" {
	Properties {
		[Header(Textures)] _MainTex ("Fur Texture (RGB)", 2D) = "white" {}
		[NoScaleOffset] _SkinTex ("Skin Texture (RGB)", 2D) = "white" {}
		[NoScaleOffset] _HeightMap ("Height Map (Gray) ", 2D) = "white" {}
		[Header(Fur Color Properties)] _FurColor ("Fur Color", Vector) = (1,1,1,1)
		_Brightness ("Fur Brightness", Range(0, 1)) = 0.25
		_HeightMapBrightness ("Height Map Brightness", Range(0, 1)) = 0.25
		_FurTransparency ("Fur Transparency", Range(0, 1)) = 1
		[Header(Skin Color Properties)] [Toggle] _EnableSkin ("Enable Skin Layer", Float) = 0
		_SkinColor ("Skin Color", Vector) = (1,1,1,1)
		_SkinBrightness ("Skin Brightness", Range(0, 1)) = 0.25
		_SkinTransparency ("Skin Transparency", Range(0, 1)) = 1
		[Header(Fur Properties)] _FurLength ("Fur Length", Range(0, 1)) = 0.25
		_FurStiff ("Fur Stiffness", Range(0, 1)) = 0.1
		_Gravity ("Gravity Direction", Vector) = (0,0,0,0)
		[Header(Depth Shadow Properties)] [Enum(None,0, Normal, 1, Invert, 2)] _Shadows ("Depth Shadows", Float) = 0
		_ShadowStrength ("Depth Shadow Strength", Range(0, 1)) = 0.5
		[Header(Randomized Wind Properties)] _WindSpeed ("Wind Speed", Range(0, 1)) = 0
		_WindStrength ("Wind Strength", Range(0, 1)) = 0
		[Header(Velocity Properties)] [Toggle] _CullVelocity ("Cull Velocity Angle", Float) = 0
		_CullAngle ("Cull Angle", Range(-1, 1)) = 0
		[HideInInspector] _Velocity ("Velocity", Vector) = (0,0,0,0)
	}
	SubShader {
		Tags { "DisableBatching" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Tags { "DisableBatching" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			Cull Off
			GpuProgramID 49996
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[9];
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
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[9];
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
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 _SkinColor;
						float _FurTransparency;
						float _SkinTransparency;
						float _Brightness;
						float _SkinBrightness;
						float _HeightMapBrightness;
						vec4 unused_0_8;
						vec4 _Velocity;
						vec4 unused_0_10;
						float _EnableSkin;
						float _Shadows;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _SkinTex;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					bool u_xlatb3;
					float u_xlat6;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat3 = dot(u_xlat1, u_xlat1);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat1 = vec4(u_xlat3) * u_xlat1;
					    u_xlat3 = dot((-_Velocity), (-_Velocity));
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat2 = vec4(u_xlat3) * (-_Velocity);
					    u_xlat3 = dot(u_xlat1, u_xlat2);
					    u_xlatb3 = _CullAngle<u_xlat3;
					    u_xlatb0 = u_xlatb3 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_EnableSkin);
					    if(u_xlatb0){
					        u_xlat10_0 = texture(_SkinTex, vs_TEXCOORD0.xy);
					        u_xlat1.xyz = vs_COLOR0.xyz * _SkinColor.xyz;
					        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					        u_xlat9 = _SkinBrightness * 5.0;
					        SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					        SV_Target0.w = max(_SkinTransparency, 0.0);
					        return;
					    } else {
					        u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					        u_xlat6 = _HeightMapBrightness + _HeightMapBrightness;
					        u_xlat0.xy = vec2(u_xlat6) * u_xlat10_0.xy;
					        u_xlatb0 = 0.0>=u_xlat0.x;
					        u_xlatb3 = u_xlat0.y<0.0;
					        u_xlatb0 = u_xlatb3 || u_xlatb0;
					        if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					        u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					        u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					        u_xlatb9 = _Shadows==1.0;
					        u_xlat0.xyz = (bool(u_xlatb9)) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xyz;
					        u_xlat9 = _Brightness * 5.0;
					        SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					        SV_Target0.w = max(_FurTransparency, 0.0);
					        return;
					    //ENDIF
					    }
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 _SkinColor;
						float _FurTransparency;
						float _SkinTransparency;
						float _Brightness;
						float _SkinBrightness;
						float _HeightMapBrightness;
						vec4 unused_0_8;
						vec4 _Velocity;
						vec4 unused_0_10;
						float _EnableSkin;
						float _Shadows;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _SkinTex;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					bool u_xlatb3;
					float u_xlat6;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat3 = dot(u_xlat1, u_xlat1);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat1 = vec4(u_xlat3) * u_xlat1;
					    u_xlat3 = dot((-_Velocity), (-_Velocity));
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat2 = vec4(u_xlat3) * (-_Velocity);
					    u_xlat3 = dot(u_xlat1, u_xlat2);
					    u_xlatb3 = _CullAngle<u_xlat3;
					    u_xlatb0 = u_xlatb3 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_EnableSkin);
					    if(u_xlatb0){
					        u_xlat10_0 = texture(_SkinTex, vs_TEXCOORD0.xy);
					        u_xlat1.xyz = vs_COLOR0.xyz * _SkinColor.xyz;
					        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					        u_xlat9 = _SkinBrightness * 5.0;
					        SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					        SV_Target0.w = max(_SkinTransparency, 0.0);
					        return;
					    } else {
					        u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					        u_xlat6 = _HeightMapBrightness + _HeightMapBrightness;
					        u_xlat0.xy = vec2(u_xlat6) * u_xlat10_0.xy;
					        u_xlatb0 = 0.0>=u_xlat0.x;
					        u_xlatb3 = u_xlat0.y<0.0;
					        u_xlatb0 = u_xlatb3 || u_xlatb0;
					        if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					        u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					        u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					        u_xlatb9 = _Shadows==1.0;
					        u_xlat0.xyz = (bool(u_xlatb9)) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xyz;
					        u_xlat9 = _Brightness * 5.0;
					        SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					        SV_Target0.w = max(_FurTransparency, 0.0);
					        return;
					    //ENDIF
					    }
					    return;
					}"
				}
			}
		}
		Pass {
			Tags { "DisableBatching" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			Cull Off
			GpuProgramID 121807
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat6 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat6) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat6 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat6 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat6 = (-_FurStiff) + 1.0;
					    u_xlat6 = u_xlat6 * 5.0;
					    u_xlat1.x = log2(_FurLength);
					    u_xlat6 = u_xlat6 * u_xlat1.x;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat6 = dot(u_xlat0, u_xlat0);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_FurLength, _FurLength, _FurLength));
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					float u_xlat4;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat9 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat9 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat9 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat9 = (-_FurStiff) + 1.0;
					    u_xlat9 = u_xlat9 * 5.0;
					    u_xlat1.x = _FurLength * 1.0;
					    u_xlat4 = log2(u_xlat1.x);
					    u_xlat9 = u_xlat9 * u_xlat4;
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat9 = dot(u_xlat0, u_xlat0);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
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
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.0500000007;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -8.64385605;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -4.32192802;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.0500000007);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.949999988;
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.0500000007;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -8.64385605;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -4.32192802;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.0500000007);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.949999988;
					    return;
					}"
				}
			}
		}
		Pass {
			Tags { "DisableBatching" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			Cull Off
			GpuProgramID 160030
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat6 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat6) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat6 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat6 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat6 = (-_FurStiff) + 1.0;
					    u_xlat6 = u_xlat6 * 5.0;
					    u_xlat1.x = _FurLength * 2.0;
					    u_xlat3 = log2(u_xlat1.x);
					    u_xlat6 = u_xlat6 * u_xlat3;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat6 = dot(u_xlat0, u_xlat0);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					float u_xlat4;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat9 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat9 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat9 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat9 = (-_FurStiff) + 1.0;
					    u_xlat9 = u_xlat9 * 5.0;
					    u_xlat1.x = _FurLength * 2.0;
					    u_xlat4 = log2(u_xlat1.x);
					    u_xlat9 = u_xlat9 * u_xlat4;
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat9 = dot(u_xlat0, u_xlat0);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
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
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.100000001;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -6.64385605;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -3.32192802;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.100000001);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.899999976;
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.100000001;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -6.64385605;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -3.32192802;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.100000001);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.899999976;
					    return;
					}"
				}
			}
		}
		Pass {
			Tags { "DisableBatching" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			Cull Off
			GpuProgramID 204945
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat6 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat6) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat6 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat6 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat6 = (-_FurStiff) + 1.0;
					    u_xlat6 = u_xlat6 * 5.0;
					    u_xlat1.x = _FurLength * 3.0;
					    u_xlat3 = log2(u_xlat1.x);
					    u_xlat6 = u_xlat6 * u_xlat3;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat6 = dot(u_xlat0, u_xlat0);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					float u_xlat4;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat9 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat9 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat9 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat9 = (-_FurStiff) + 1.0;
					    u_xlat9 = u_xlat9 * 5.0;
					    u_xlat1.x = _FurLength * 3.0;
					    u_xlat4 = log2(u_xlat1.x);
					    u_xlat9 = u_xlat9 * u_xlat4;
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat9 = dot(u_xlat0, u_xlat0);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
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
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.150000006;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -5.47393084;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -2.73696542;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.150000006);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.850000024;
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.150000006;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -5.47393084;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -2.73696542;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.150000006);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.850000024;
					    return;
					}"
				}
			}
		}
		Pass {
			Tags { "DisableBatching" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			Cull Off
			GpuProgramID 308308
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat6 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat6) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat6 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat6 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat6 = (-_FurStiff) + 1.0;
					    u_xlat6 = u_xlat6 * 5.0;
					    u_xlat1.x = _FurLength * 4.0;
					    u_xlat3 = log2(u_xlat1.x);
					    u_xlat6 = u_xlat6 * u_xlat3;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat6 = dot(u_xlat0, u_xlat0);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					float u_xlat4;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat9 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat9 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat9 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat9 = (-_FurStiff) + 1.0;
					    u_xlat9 = u_xlat9 * 5.0;
					    u_xlat1.x = _FurLength * 4.0;
					    u_xlat4 = log2(u_xlat1.x);
					    u_xlat9 = u_xlat9 * u_xlat4;
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat9 = dot(u_xlat0, u_xlat0);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
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
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.200000003;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -4.64385605;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -2.32192802;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.200000003);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.800000012;
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.200000003;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -4.64385605;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -2.32192802;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.200000003);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.800000012;
					    return;
					}"
				}
			}
		}
		Pass {
			Tags { "DisableBatching" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			Cull Off
			GpuProgramID 390786
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat6 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat6) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat6 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat6 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat6 = (-_FurStiff) + 1.0;
					    u_xlat6 = u_xlat6 * 5.0;
					    u_xlat1.x = _FurLength * 5.0;
					    u_xlat3 = log2(u_xlat1.x);
					    u_xlat6 = u_xlat6 * u_xlat3;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat6 = dot(u_xlat0, u_xlat0);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					float u_xlat4;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat9 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat9 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat9 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat9 = (-_FurStiff) + 1.0;
					    u_xlat9 = u_xlat9 * 5.0;
					    u_xlat1.x = _FurLength * 5.0;
					    u_xlat4 = log2(u_xlat1.x);
					    u_xlat9 = u_xlat9 * u_xlat4;
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat9 = dot(u_xlat0, u_xlat0);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
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
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.25;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -4.0;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -2.0;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.25);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.75;
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.25;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -4.0;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -2.0;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.25);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.75;
					    return;
					}"
				}
			}
		}
		Pass {
			Tags { "DisableBatching" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			Cull Off
			GpuProgramID 423033
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat6 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat6) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat6 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat6 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat6 = (-_FurStiff) + 1.0;
					    u_xlat6 = u_xlat6 * 5.0;
					    u_xlat1.x = _FurLength * 6.0;
					    u_xlat3 = log2(u_xlat1.x);
					    u_xlat6 = u_xlat6 * u_xlat3;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat6 = dot(u_xlat0, u_xlat0);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					float u_xlat4;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat9 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat9 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat9 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat9 = (-_FurStiff) + 1.0;
					    u_xlat9 = u_xlat9 * 5.0;
					    u_xlat1.x = _FurLength * 6.0;
					    u_xlat4 = log2(u_xlat1.x);
					    u_xlat9 = u_xlat9 * u_xlat4;
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat9 = dot(u_xlat0, u_xlat0);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
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
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.300000012;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -3.47393107;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -1.73696554;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.300000012);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.699999988;
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.300000012;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -3.47393107;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -1.73696554;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.300000012);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.699999988;
					    return;
					}"
				}
			}
		}
		Pass {
			Tags { "DisableBatching" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			Cull Off
			GpuProgramID 497527
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat6 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat6) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat6 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat6 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat6 = (-_FurStiff) + 1.0;
					    u_xlat6 = u_xlat6 * 5.0;
					    u_xlat1.x = _FurLength * 7.0;
					    u_xlat3 = log2(u_xlat1.x);
					    u_xlat6 = u_xlat6 * u_xlat3;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat6 = dot(u_xlat0, u_xlat0);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					float u_xlat4;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat9 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat9 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat9 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat9 = (-_FurStiff) + 1.0;
					    u_xlat9 = u_xlat9 * 5.0;
					    u_xlat1.x = _FurLength * 7.0;
					    u_xlat4 = log2(u_xlat1.x);
					    u_xlat9 = u_xlat9 * u_xlat4;
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat9 = dot(u_xlat0, u_xlat0);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
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
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.349999994;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -3.02914643;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -1.51457322;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.349999994);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.649999976;
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.349999994;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -3.02914643;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -1.51457322;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.349999994);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.649999976;
					    return;
					}"
				}
			}
		}
		Pass {
			Tags { "DisableBatching" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			Cull Off
			GpuProgramID 534898
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat6 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat6) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat6 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat6 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat6 = (-_FurStiff) + 1.0;
					    u_xlat6 = u_xlat6 * 5.0;
					    u_xlat1.x = _FurLength * 8.0;
					    u_xlat3 = log2(u_xlat1.x);
					    u_xlat6 = u_xlat6 * u_xlat3;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat6 = dot(u_xlat0, u_xlat0);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					float u_xlat4;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat9 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat9 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat9 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat9 = (-_FurStiff) + 1.0;
					    u_xlat9 = u_xlat9 * 5.0;
					    u_xlat1.x = _FurLength * 8.0;
					    u_xlat4 = log2(u_xlat1.x);
					    u_xlat9 = u_xlat9 * u_xlat4;
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat9 = dot(u_xlat0, u_xlat0);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
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
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.400000006;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -2.64385605;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -1.32192802;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.400000006);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.600000024;
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.400000006;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -2.64385605;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -1.32192802;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.400000006);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.600000024;
					    return;
					}"
				}
			}
		}
		Pass {
			Tags { "DisableBatching" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			Cull Off
			GpuProgramID 626877
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat6 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat6) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat6 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat6 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat6 = (-_FurStiff) + 1.0;
					    u_xlat6 = u_xlat6 * 5.0;
					    u_xlat1.x = _FurLength * 9.0;
					    u_xlat3 = log2(u_xlat1.x);
					    u_xlat6 = u_xlat6 * u_xlat3;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat6 = dot(u_xlat0, u_xlat0);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					float u_xlat4;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat9 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat9 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat9 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat9 = (-_FurStiff) + 1.0;
					    u_xlat9 = u_xlat9 * 5.0;
					    u_xlat1.x = _FurLength * 9.0;
					    u_xlat4 = log2(u_xlat1.x);
					    u_xlat9 = u_xlat9 * u_xlat4;
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat9 = dot(u_xlat0, u_xlat0);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
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
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.449999988;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -2.30400634;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -1.15200317;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.449999988);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.550000012;
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.449999988;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -2.30400634;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -1.15200317;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.449999988);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.550000012;
					    return;
					}"
				}
			}
		}
		Pass {
			Tags { "DisableBatching" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			Cull Off
			GpuProgramID 712612
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat6 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat6) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat6 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat6 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat6 = (-_FurStiff) + 1.0;
					    u_xlat6 = u_xlat6 * 5.0;
					    u_xlat1.x = _FurLength * 10.0;
					    u_xlat3 = log2(u_xlat1.x);
					    u_xlat6 = u_xlat6 * u_xlat3;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat6 = dot(u_xlat0, u_xlat0);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					float u_xlat4;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat9 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat9 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat9 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat9 = (-_FurStiff) + 1.0;
					    u_xlat9 = u_xlat9 * 5.0;
					    u_xlat1.x = _FurLength * 10.0;
					    u_xlat4 = log2(u_xlat1.x);
					    u_xlat9 = u_xlat9 * u_xlat4;
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat9 = dot(u_xlat0, u_xlat0);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
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
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.5;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -2.0;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = exp2((-u_xlat12));
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.5);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.5;
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.5;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -2.0;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = exp2((-u_xlat12));
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.5);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.5;
					    return;
					}"
				}
			}
		}
		Pass {
			Tags { "DisableBatching" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			Cull Off
			GpuProgramID 767263
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat6 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat6) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat6 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat6 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat6 = (-_FurStiff) + 1.0;
					    u_xlat6 = u_xlat6 * 5.0;
					    u_xlat1.x = _FurLength * 11.0;
					    u_xlat3 = log2(u_xlat1.x);
					    u_xlat6 = u_xlat6 * u_xlat3;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat6 = dot(u_xlat0, u_xlat0);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					float u_xlat4;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat9 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat9 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat9 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat9 = (-_FurStiff) + 1.0;
					    u_xlat9 = u_xlat9 * 5.0;
					    u_xlat1.x = _FurLength * 11.0;
					    u_xlat4 = log2(u_xlat1.x);
					    u_xlat9 = u_xlat9 * u_xlat4;
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat9 = dot(u_xlat0, u_xlat0);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
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
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.550000012;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -1.72499287;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -0.862496436;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.550000012);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.449999988;
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.550000012;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -1.72499287;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -0.862496436;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.550000012);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.449999988;
					    return;
					}"
				}
			}
		}
		Pass {
			Tags { "DisableBatching" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			Cull Off
			GpuProgramID 794590
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat6 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat6) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat6 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat6 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat6 = (-_FurStiff) + 1.0;
					    u_xlat6 = u_xlat6 * 5.0;
					    u_xlat1.x = _FurLength * 12.0;
					    u_xlat3 = log2(u_xlat1.x);
					    u_xlat6 = u_xlat6 * u_xlat3;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat6 = dot(u_xlat0, u_xlat0);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					float u_xlat4;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat9 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat9 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat9 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat9 = (-_FurStiff) + 1.0;
					    u_xlat9 = u_xlat9 * 5.0;
					    u_xlat1.x = _FurLength * 12.0;
					    u_xlat4 = log2(u_xlat1.x);
					    u_xlat9 = u_xlat9 * u_xlat4;
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat9 = dot(u_xlat0, u_xlat0);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
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
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.600000024;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -1.47393107;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -0.736965537;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.600000024);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.400000006;
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.600000024;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -1.47393107;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -0.736965537;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.600000024);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.400000006;
					    return;
					}"
				}
			}
		}
		Pass {
			Tags { "DisableBatching" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			Cull Off
			GpuProgramID 879085
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat6 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat6) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat6 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat6 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat6 = (-_FurStiff) + 1.0;
					    u_xlat6 = u_xlat6 * 5.0;
					    u_xlat1.x = _FurLength * 13.0;
					    u_xlat3 = log2(u_xlat1.x);
					    u_xlat6 = u_xlat6 * u_xlat3;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat6 = dot(u_xlat0, u_xlat0);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					float u_xlat4;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat9 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat9 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat9 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat9 = (-_FurStiff) + 1.0;
					    u_xlat9 = u_xlat9 * 5.0;
					    u_xlat1.x = _FurLength * 13.0;
					    u_xlat4 = log2(u_xlat1.x);
					    u_xlat9 = u_xlat9 * u_xlat4;
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat9 = dot(u_xlat0, u_xlat0);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
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
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.649999976;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -1.2429769;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -0.621488452;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.649999976);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.349999994;
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.649999976;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -1.2429769;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -0.621488452;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.649999976);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.349999994;
					    return;
					}"
				}
			}
		}
		Pass {
			Tags { "DisableBatching" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			Cull Off
			GpuProgramID 955360
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat6 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat6) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat6 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat6 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat6 = (-_FurStiff) + 1.0;
					    u_xlat6 = u_xlat6 * 5.0;
					    u_xlat1.x = _FurLength * 14.0;
					    u_xlat3 = log2(u_xlat1.x);
					    u_xlat6 = u_xlat6 * u_xlat3;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat6 = dot(u_xlat0, u_xlat0);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					float u_xlat4;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat9 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat9 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat9 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat9 = (-_FurStiff) + 1.0;
					    u_xlat9 = u_xlat9 * 5.0;
					    u_xlat1.x = _FurLength * 14.0;
					    u_xlat4 = log2(u_xlat1.x);
					    u_xlat9 = u_xlat9 * u_xlat4;
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat9 = dot(u_xlat0, u_xlat0);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
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
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.699999988;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -1.02914643;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -0.514573216;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.699999988);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.300000012;
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.699999988;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -1.02914643;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -0.514573216;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.699999988);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.300000012;
					    return;
					}"
				}
			}
		}
		Pass {
			Tags { "DisableBatching" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			Cull Off
			GpuProgramID 1018500
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat6 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat6) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat6 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat6 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat6 = (-_FurStiff) + 1.0;
					    u_xlat6 = u_xlat6 * 5.0;
					    u_xlat1.x = _FurLength * 15.0;
					    u_xlat3 = log2(u_xlat1.x);
					    u_xlat6 = u_xlat6 * u_xlat3;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat6 = dot(u_xlat0, u_xlat0);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					float u_xlat4;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat9 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat9 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat9 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat9 = (-_FurStiff) + 1.0;
					    u_xlat9 = u_xlat9 * 5.0;
					    u_xlat1.x = _FurLength * 15.0;
					    u_xlat4 = log2(u_xlat1.x);
					    u_xlat9 = u_xlat9 * u_xlat4;
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat9 = dot(u_xlat0, u_xlat0);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
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
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.75;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -0.830075026;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -0.415037513;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.75);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.25;
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.75;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -0.830075026;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -0.415037513;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.75);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.25;
					    return;
					}"
				}
			}
		}
		Pass {
			Tags { "DisableBatching" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			Cull Off
			GpuProgramID 1075964
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat6 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat6) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat6 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat6 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat6 = (-_FurStiff) + 1.0;
					    u_xlat6 = u_xlat6 * 5.0;
					    u_xlat1.x = _FurLength * 16.0;
					    u_xlat3 = log2(u_xlat1.x);
					    u_xlat6 = u_xlat6 * u_xlat3;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat6 = dot(u_xlat0, u_xlat0);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					float u_xlat4;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat9 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat9 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat9 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat9 = (-_FurStiff) + 1.0;
					    u_xlat9 = u_xlat9 * 5.0;
					    u_xlat1.x = _FurLength * 16.0;
					    u_xlat4 = log2(u_xlat1.x);
					    u_xlat9 = u_xlat9 * u_xlat4;
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat9 = dot(u_xlat0, u_xlat0);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
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
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.800000012;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -0.643856168;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -0.321928084;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.800000012);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.200000003;
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.800000012;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -0.643856168;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -0.321928084;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.800000012);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.200000003;
					    return;
					}"
				}
			}
		}
		Pass {
			Tags { "DisableBatching" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			Cull Off
			GpuProgramID 1176986
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat6 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat6) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat6 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat6 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat6 = (-_FurStiff) + 1.0;
					    u_xlat6 = u_xlat6 * 5.0;
					    u_xlat1.x = _FurLength * 17.0;
					    u_xlat3 = log2(u_xlat1.x);
					    u_xlat6 = u_xlat6 * u_xlat3;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat6 = dot(u_xlat0, u_xlat0);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					float u_xlat4;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat9 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat9 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat9 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat9 = (-_FurStiff) + 1.0;
					    u_xlat9 = u_xlat9 * 5.0;
					    u_xlat1.x = _FurLength * 17.0;
					    u_xlat4 = log2(u_xlat1.x);
					    u_xlat9 = u_xlat9 * u_xlat4;
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat9 = dot(u_xlat0, u_xlat0);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
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
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.850000024;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -0.468930423;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -0.234465212;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.850000024);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.150000006;
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.850000024;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -0.468930423;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -0.234465212;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.850000024);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.150000006;
					    return;
					}"
				}
			}
		}
		Pass {
			Tags { "DisableBatching" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			Cull Off
			GpuProgramID 1182979
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat6 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat6) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat6 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat6 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat6 = (-_FurStiff) + 1.0;
					    u_xlat6 = u_xlat6 * 5.0;
					    u_xlat1.x = _FurLength * 18.0;
					    u_xlat3 = log2(u_xlat1.x);
					    u_xlat6 = u_xlat6 * u_xlat3;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat6 = dot(u_xlat0, u_xlat0);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					float u_xlat4;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat9 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat9 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat9 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat9 = (-_FurStiff) + 1.0;
					    u_xlat9 = u_xlat9 * 5.0;
					    u_xlat1.x = _FurLength * 18.0;
					    u_xlat4 = log2(u_xlat1.x);
					    u_xlat9 = u_xlat9 * u_xlat4;
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat9 = dot(u_xlat0, u_xlat0);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
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
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.899999976;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -0.304006249;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -0.152003124;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.899999976);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.100000001;
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.899999976;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -0.304006249;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -0.152003124;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.899999976);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.100000001;
					    return;
					}"
				}
			}
		}
		Pass {
			Tags { "DisableBatching" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			Cull Off
			GpuProgramID 1289099
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat6 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat6) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat6 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat6 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat6 = (-_FurStiff) + 1.0;
					    u_xlat6 = u_xlat6 * 5.0;
					    u_xlat1.x = _FurLength * 19.0;
					    u_xlat3 = log2(u_xlat1.x);
					    u_xlat6 = u_xlat6 * u_xlat3;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat6 = dot(u_xlat0, u_xlat0);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4[4];
						vec4 _Gravity;
						vec4 _Velocity;
						float _WindStrength;
						float _WindSpeed;
						float _FurLength;
						float _FurStiff;
						vec4 unused_0_11[2];
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
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					float u_xlat4;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xyz = _Gravity.yyy * unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = unity_WorldToObject[0].xyz * _Gravity.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * _Gravity.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * _Gravity.www + u_xlat0.xyz;
					    u_xlat9 = _WindSpeed * _Time.y;
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(10.0, 2.5, 4.5) + in_POSITION0.xyy;
					    u_xlat9 = cos(u_xlat1.y);
					    u_xlat1.xy = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xy * vec2(_WindStrength);
					    u_xlat1.y = u_xlat9 * _WindStrength;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_Velocity.xyz);
					    u_xlat9 = (-_FurStiff) + 1.0;
					    u_xlat9 = u_xlat9 * 5.0;
					    u_xlat1.x = _FurLength * 19.0;
					    u_xlat4 = log2(u_xlat1.x);
					    u_xlat9 = u_xlat9 * u_xlat4;
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + in_NORMAL0.xyz;
					    u_xlat0.w = in_NORMAL0.w;
					    u_xlat9 = dot(u_xlat0, u_xlat0);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
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
					    u_xlat0 = in_NORMAL0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_NORMAL0.wwww + u_xlat0;
					    vs_COLOR0 = _LightColor0 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.949999988;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -0.148001194;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -0.074000597;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.949999988);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.0500000007;
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
						vec4 unused_0_0[5];
						vec4 _FurColor;
						vec4 unused_0_2;
						float _FurTransparency;
						float _Brightness;
						float _HeightMapBrightness;
						vec4 unused_0_6;
						vec4 _Velocity;
						vec4 unused_0_8;
						float _Shadows;
						float _ShadowStrength;
						float _CullVelocity;
						float _CullAngle;
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[4];
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HeightMap;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CullVelocity);
					    u_xlat1 = vs_TEXCOORD1.yyyy * unity_WorldToObject[1];
					    u_xlat1 = unity_WorldToObject[0] * vs_TEXCOORD1.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToObject[2] * vs_TEXCOORD1.zzzz + u_xlat1;
					    u_xlat1 = unity_WorldToObject[3] * vs_TEXCOORD1.wwww + u_xlat1;
					    u_xlat4 = dot(u_xlat1, u_xlat1);
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1;
					    u_xlat4 = dot((-_Velocity), (-_Velocity));
					    u_xlat4 = inversesqrt(u_xlat4);
					    u_xlat2 = vec4(u_xlat4) * (-_Velocity);
					    u_xlat4 = dot(u_xlat1, u_xlat2);
					    u_xlatb4 = _CullAngle<u_xlat4;
					    u_xlatb0 = u_xlatb4 && u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_HeightMap, vs_TEXCOORD0.xy);
					    u_xlat8 = _HeightMapBrightness + _HeightMapBrightness;
					    u_xlat0.xy = vec2(u_xlat8) * u_xlat10_0.xy;
					    u_xlatb0 = 0.0>=u_xlat0.x;
					    u_xlatb4 = u_xlat0.y<0.949999988;
					    u_xlatb0 = u_xlatb4 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = vs_COLOR0.xyz * _FurColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat12 = _ShadowStrength * -0.148001194;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb2.xy = equal(vec4(vec4(_Shadows, _Shadows, _Shadows, _Shadows)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
					    u_xlat12 = (-_ShadowStrength) * 2.0 + 2.0;
					    u_xlat12 = u_xlat12 * -0.074000597;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.y) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = vec2(_Brightness, _FurTransparency) * vec2(5.0, 0.949999988);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.x = max(u_xlat1.y, _FurTransparency);
					    SV_Target0.w = u_xlat0.x * 0.0500000007;
					    return;
					}"
				}
			}
		}
	}
}