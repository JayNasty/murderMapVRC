Shader "Doppels shaders/ScreenFX/Dope Shader Corpse" {
	Properties {
		[Header (Main settings)] [Space] _fs ("Effects Start fading range", Float) = 4
		_fe ("Effects End range", Float) = 5
		[Toggle] Ufps ("Use For Particle System", Float) = 0
		_Dir ("Angle limit for centering effects", Range(0, 1)) = 0.3
		_Alpha ("Global alpha", Range(0, 1)) = 1
		[Header (Shake)] [Space] [Toggle] SHAKE ("Shake", Float) = 0
		[Toggle] _Usernd ("Use Random", Float) = 0
		_AmplitudeX ("Amplitude X", Range(0, 100)) = 5
		_AmplitudeY ("Amplitude Y", Range(0, 100)) = 3
		_xsp ("X Frequency", Range(-100, 100)) = 53
		_ysp ("Y Frequency", Range(-100, 100)) = 75
		_Amplitudefix ("Amplitude fix", Range(0, 1)) = 1
		[Header (Rotator)] [Space] [Toggle] ROTATOR ("Rotator", Float) = 0
		[Toggle] _rotcntr ("Centering", Float) = 0
		_rotamp ("Rotation amplitude", Range(-100, 100)) = 0
		_rotoffset ("Rotation offset", Float) = 0
		_rotspeed ("Rotation speed", Range(0, 100)) = 0
		[Header (Zoom)] [Space] [KeywordEnum(OFF, SIMPLE, CENTERING, CENTERING SIMPLE, FISHEYE)] ZOOM ("Zoom mode", Float) = 0
		_Zoom ("Zoom", Range(-1, 1)) = 0
		[Header (Pixelation)] [Space] [Toggle] PIX ("Pixelation", Float) = 0
		_pix ("Value", Range(0, 100)) = 0
		[Header (Swirl Effect)] [Space] [Toggle] SWIRL ("Swirl", Float) = 0
		_srad ("Swirl radius", Range(0, 100)) = 0
		_sangle ("Swirl angle", Range(-100, 100)) = 0
		_sspeed ("Swirl speed", Range(0, 100)) = 0
		[Header (Shockwave Effect)] [Space] [Toggle] SHOCKWAVE ("Shockwave effect", Float) = 0
		[Toggle] _wcntr ("Centering", Float) = 0
		_woffset ("Shockwave Offset", Float) = 0
		_wspeed ("Shockwave Speed", Range(0, 100)) = 0
		_wpower ("Shockwave Power", Range(0, 100)) = 0
		_wx ("Wave params x", Float) = 10
		_wy ("Wave params y", Float) = 0.8
		_wz ("Wave params z", Float) = 0.1
		[Header (Girlscam)] [Space] [Toggle] GIRLSCAM ("Girlscam", Float) = 0
		_Girlscam ("Girlscam", Range(0, 100)) = 0
		_Girlscamcount ("Count", Range(0, 1)) = 1
		[Toggle] _Moving ("Moving", Float) = 0
		[Header (Waves)] [Space] [Toggle] WAVES ("Waves", Float) = 0
		_Waves ("Waves", Range(0, 100)) = 0
		_WavesPower ("Power", Range(0, 100)) = 1
		_WavesSpeed ("Speed", Range(0, 100)) = 0
		[Header (World Distortion)] [Space] [Toggle] WORLD_DISTORTION ("World Distortion", Float) = 0
		_nmapscale ("Scale", Range(0, 1)) = 0.1
		_nmaptile ("Tilling", Float) = 0.8
		_dspeed ("Speed", Range(0, 3)) = 0.3
		[Header (Glitch)] [Space] [Toggle] GLITCH ("Glitch", Float) = 0
		_gAmt ("Amplitude", Range(0, 100)) = 50
		_gOffsetx ("Offset X", Range(0, 100)) = 50
		_gOffsety ("Offset Y", Range(0, 100)) = 0
		_gcOffset ("Color Offset", Range(0, 100)) = 20
		_gSpeed ("Speed", Range(0, 100)) = 30
		[Header (This Makes Lags)] [Space] [KeywordEnum(OFF, RADIAL, CHROMATIC ABERRATION, STAR, HORISONTAL, CIRCULAR, RGB, BLOOM)] Blur ("Blur mode", Float) = 0
		[Toggle] CENTERING_BLUR ("Centering", Float) = 0
		_samples ("Samples", Range(1, 256)) = 8
		_ds ("Displace", Range(0, 1)) = 0.05
		_BRspeed ("Rotator Speed", Float) = 0
		_BRoffset ("Rotator Offset", Float) = 0
		[Space] _falloff ("Chrom Aber/Radial Blur Falloff", Range(0, 100)) = 0
		_Threshold ("Gamma for bloom", Range(0, 5)) = 0.3
		[Space] [Header (Rays)] [Toggle] UFPASS ("Use First Pass", Float) = 0
		[Header (Egde Glow)] [Space] [Toggle] EDGEGLOW ("Edge glow", Float) = 0
		_egoffset ("Offset", Range(0, 100)) = 5
		_egpow ("Power", Range(0, 100)) = 20
		_egcol ("Color", Vector) = (0,0.4,1,1)
		[Header (Egdy Space)] [Space] [Toggle] EDGYSPACE ("Edgy space", Float) = 0
		_egspoffset ("Offset", Range(0, 100)) = 5
		_egspcol ("Color", Range(0, 1)) = 0
		[Header (Color Grading)] [Space] [Toggle] COLOR_GRADING ("Color grading", Float) = 0
		[Space] _Colorm ("Color multiply", Vector) = (1,1,1,1)
		[Space] _ColorR ("Color multiply Right", Vector) = (1,1,1,1)
		_ColorL ("Color multiply Left", Vector) = (1,1,1,1)
		[Space] _HDR ("HDR", Range(0, 1)) = 0
		_HDRMultiplyer ("HDR Multiplyer", Range(0, 10)) = 1
		[Space] _Contrast ("Contrast", Range(0, 1)) = 0
		[Space] _grsc ("Grayscale", Range(0, 1)) = 0
		_brightColor ("Bright Color", Vector) = (1,1,1,1)
		_darkColor ("Dark Color", Vector) = (0,0,0,0)
		_threshold ("Threshold", Range(0, 1)) = 1
		_softness ("Softness", Range(0, 1)) = 1
		[Header (HSV Color Selection)] [Space] [Toggle] COLSEL ("HSV color selection", Float) = 0
		_Colsela ("Color Selection Alpha", Range(0, 1)) = 1
		_TargetColor ("Select color (RGB)", Vector) = (0,0.4,1,1)
		_HueRange ("Hue range", Range(0, 0.5)) = 0.1
		_SaturationRange ("Saturation range", Range(0, 1)) = 0.5
		_LightnessRange ("Lightness range", Range(0, 1)) = 0.5
		_HueSmoothRange ("Hue fade", Range(0, 0.5)) = 0.1
		_SaturationSmoothRange ("Saturation fade", Range(0, 1)) = 0.5
		_LightnessSmoothRange ("Lightness fade", Range(0, 1)) = 0.5
		[Header (Hue options)] [Space] [KeywordEnum(OFF, WORLD SNOISE DEPTH, DEPTH, VIEWDIR, LINES, CIRCLES, CENTERING CIRCLES)] Hue ("Hue mode", Float) = 0
		_HUEa ("HUE Alpha", Range(0, 1)) = 0
		_TileHue ("Tile Hue", Float) = 1
		_HUE ("HUE Offset", Float) = 0
		_HUESpeed ("HUE Speed", Float) = 0.3
		[Toggle] _volume ("Volume", Float) = 0
		[Header (Effects)] [Space] [Toggle] NOISE ("Noise", Float) = 0
		_nspeed ("Noise speed", Range(0, 1)) = 1
		_ncol ("Color", Vector) = (0,0,0,1)
		_Noise ("Noise", Range(0, 1)) = 0.5
		_TillingY ("Tilling Y", Range(0, 1)) = 0.5
		_TillingX ("Tilling X", Range(0, 1)) = 0.1
		[Space] [Toggle] VIGNETTE ("Vignette", Float) = 0
		[Toggle] _Vignettecntr ("Centering", Float) = 0
		_Vignette ("Vignette", Range(0, 1)) = 0
		_Vignettesmtf ("Smooth", Range(0, 1)) = 1
		_Speedvg ("Blinking speed", Range(0, 10)) = 3
		[Space] _bars ("Black Bars", Range(0, 100)) = 0
		[Toggle] _smb ("Use Smooth", Float) = 0
		[Space] [Toggle] LINES ("Lines", Float) = 0
		_lines ("Lines", Range(0, 1)) = 0
		_linescount ("Lines count", Range(1, 500)) = 30
		_linesspeed ("Lines speed", Range(0, 1)) = 0.1
		[Space] [Toggle] STRIPES ("Stripes", Float) = 0
		_stripes ("Stripes", Range(0, 1)) = 0.2
		_stripesspeed ("Stripes speed", Range(0, 1)) = 0.25
		_stripescount ("Stripes count", Range(0, 100)) = 4
		[Toggle] _usen ("Use noise", Range(0, 1)) = 0
		[Space] [Toggle] RFOG ("Fog", Float) = 0
		_Fog ("Fog", Range(0, 1)) = 0.1
		_FogColor ("FogColor", Vector) = (1,1,1,1)
		_Smooth ("Smooth", Range(1, 100)) = 1
	}
	SubShader {
		Tags { "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "QUEUE" = "Geometry+2145285568" "RenderType" = "Overlay" }
		GrabPass {
			"_corpsegp1"
		}
		Pass {
			Tags { "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "QUEUE" = "Geometry+2145285568" "RenderType" = "Overlay" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZTest Always
			ZWrite Off
			Cull Front
			GpuProgramID 31677
			Program "vp" {
				SubProgram "d3d11 " {
					Keywords { "BLUR_OFF" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						float _fe;
						float _fs;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityPerCameraRare {
						vec4 unused_2_0[18];
						mat4x4 unity_CameraToWorld;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_2[2];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out float vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat3;
					bool u_xlatb3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_CameraToWorld[1];
					    u_xlat0 = unity_CameraToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_CameraToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = unity_CameraToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToObject[1].xyz;
					    u_xlat1.xyz = unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.xyz = _WorldSpaceCameraPos.xyz + (-unity_ObjectToWorld[3].xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlatb3 = u_xlat1.x>=_fe;
					    u_xlat1.x = u_xlat1.x + (-_fs);
					    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
					    u_xlat0 = (-u_xlat0) * u_xlat3.xxxx + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat3.xyz = u_xlat0.xwy * vec3(0.5, 0.5, -0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat3.yy + u_xlat3.xz;
					    u_xlat0.x = (-_fs) + _fe;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    vs_TEXCOORD1 = (-u_xlat0.x) * u_xlat1.x + 1.0;
					    vs_TEXCOORD1 = clamp(vs_TEXCOORD1, 0.0, 1.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" "BLUR_OFF" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						float _fe;
						float _fs;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[28];
						mat4x4 unity_StereoCameraToWorld[2];
						vec4 unused_2_4[4];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_6;
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_2_8;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out float vs_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					int u_xlati4;
					bool u_xlatb4;
					vec2 u_xlat7;
					void main()
					{
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat1 = in_POSITION0.yyyy * unity_StereoCameraToWorld[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat1 = unity_StereoCameraToWorld[u_xlati0 / 4][u_xlati0 % 4] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_StereoCameraToWorld[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = unity_StereoCameraToWorld[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * in_POSITION0.wwww + u_xlat1;
					    u_xlat3.xyz = u_xlat1.yyy * unity_WorldToObject[1].xyz;
					    u_xlat3.xyz = unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = unity_WorldToObject[3].xyz * u_xlat1.www + u_xlat3.xyz;
					    u_xlat1 = u_xlat3.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat3.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * u_xlat3.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    u_xlat0 = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    u_xlat1.xyz = unity_StereoWorldSpaceCameraPos[0].xyz + unity_StereoWorldSpaceCameraPos[1].xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + (-unity_ObjectToWorld[3].xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlatb4 = u_xlat1.x>=_fe;
					    u_xlat1.x = u_xlat1.x + (-_fs);
					    u_xlat4.x = u_xlatb4 ? 1.0 : float(0.0);
					    u_xlat0 = (-u_xlat0) * u_xlat4.xxxx + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat4.xyz = u_xlat0.xwy * vec3(0.5, 0.5, -0.5);
					    u_xlat0.xy = u_xlat4.yy + u_xlat4.xz;
					    u_xlati4 = unity_StereoEyeIndex;
					    u_xlat7.xy = u_xlat0.ww * unity_StereoScaleOffset[u_xlati4].zw;
					    vs_TEXCOORD0.xy = u_xlat0.xy * unity_StereoScaleOffset[u_xlati4].xy + u_xlat7.xy;
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    u_xlat0.x = (-_fs) + _fe;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    vs_TEXCOORD1 = (-u_xlat0.x) * u_xlat1.x + 1.0;
					    vs_TEXCOORD1 = clamp(vs_TEXCOORD1, 0.0, 1.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BLUR_RGB" "CENTERING_BLUR_ON" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						float _fe;
						float _fs;
						vec4 unused_0_3[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityPerCameraRare {
						vec4 unused_2_0[18];
						mat4x4 unity_CameraToWorld;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_2[2];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out float vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat3;
					bool u_xlatb3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_CameraToWorld[1];
					    u_xlat0 = unity_CameraToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_CameraToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = unity_CameraToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToObject[1].xyz;
					    u_xlat1.xyz = unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.xyz = _WorldSpaceCameraPos.xyz + (-unity_ObjectToWorld[3].xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlatb3 = u_xlat1.x>=_fe;
					    u_xlat1.x = u_xlat1.x + (-_fs);
					    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
					    u_xlat0 = (-u_xlat0) * u_xlat3.xxxx + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat3.xyz = u_xlat0.xwy * vec3(0.5, 0.5, -0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat3.yy + u_xlat3.xz;
					    u_xlat0.x = (-_fs) + _fe;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    vs_TEXCOORD1 = (-u_xlat0.x) * u_xlat1.x + 1.0;
					    vs_TEXCOORD1 = clamp(vs_TEXCOORD1, 0.0, 1.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" "BLUR_RGB" "CENTERING_BLUR_ON" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						float _fe;
						float _fs;
						vec4 unused_0_3[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[28];
						mat4x4 unity_StereoCameraToWorld[2];
						vec4 unused_2_4[4];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_6;
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_2_8;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out float vs_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					int u_xlati4;
					bool u_xlatb4;
					vec2 u_xlat7;
					void main()
					{
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat1 = in_POSITION0.yyyy * unity_StereoCameraToWorld[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat1 = unity_StereoCameraToWorld[u_xlati0 / 4][u_xlati0 % 4] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_StereoCameraToWorld[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = unity_StereoCameraToWorld[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * in_POSITION0.wwww + u_xlat1;
					    u_xlat3.xyz = u_xlat1.yyy * unity_WorldToObject[1].xyz;
					    u_xlat3.xyz = unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = unity_WorldToObject[3].xyz * u_xlat1.www + u_xlat3.xyz;
					    u_xlat1 = u_xlat3.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat3.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * u_xlat3.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    u_xlat0 = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    u_xlat1.xyz = unity_StereoWorldSpaceCameraPos[0].xyz + unity_StereoWorldSpaceCameraPos[1].xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + (-unity_ObjectToWorld[3].xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlatb4 = u_xlat1.x>=_fe;
					    u_xlat1.x = u_xlat1.x + (-_fs);
					    u_xlat4.x = u_xlatb4 ? 1.0 : float(0.0);
					    u_xlat0 = (-u_xlat0) * u_xlat4.xxxx + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat4.xyz = u_xlat0.xwy * vec3(0.5, 0.5, -0.5);
					    u_xlat0.xy = u_xlat4.yy + u_xlat4.xz;
					    u_xlati4 = unity_StereoEyeIndex;
					    u_xlat7.xy = u_xlat0.ww * unity_StereoScaleOffset[u_xlati4].zw;
					    vs_TEXCOORD0.xy = u_xlat0.xy * unity_StereoScaleOffset[u_xlati4].xy + u_xlat7.xy;
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    u_xlat0.x = (-_fs) + _fe;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    vs_TEXCOORD1 = (-u_xlat0.x) * u_xlat1.x + 1.0;
					    vs_TEXCOORD1 = clamp(vs_TEXCOORD1, 0.0, 1.0);
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					Keywords { "BLUR_OFF" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _Alpha;
					};
					layout(std140) uniform UnityPerCameraRare {
						vec4 unused_1_0[6];
						mat4x4 unity_CameraProjection;
						vec4 unused_1_2[12];
					};
					uniform  sampler2D _corpsegp1;
					in  vec4 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					bool u_xlatb1;
					void main()
					{
					    u_xlatb0 = unity_CameraProjection[0].z!=0.0;
					    u_xlatb1 = unity_CameraProjection[1].z!=0.0;
					    u_xlatb0 = u_xlatb1 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0 = texture(_corpsegp1, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    SV_Target0.w = _Alpha;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" "BLUR_OFF" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _Alpha;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_1_0[32];
						mat4x4 unity_StereoCameraProjection[2];
						vec4 unused_1_2[32];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _corpsegp1;
					in  vec4 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					int u_xlati0;
					bool u_xlatb0;
					bool u_xlatb1;
					void main()
					{
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlatb1 = 0.0!=unity_StereoCameraProjection[u_xlati0 / 4][u_xlati0 % 4].z;
					    u_xlatb0 = 0.0!=unity_StereoCameraProjection[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4].z;
					    u_xlatb0 = u_xlatb0 || u_xlatb1;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0 = texture(_corpsegp1, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    SV_Target0.w = _Alpha;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BLUR_RGB" "CENTERING_BLUR_ON" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _Alpha;
						int _samples;
						float _ds;
						float _BRspeed;
						float _BRoffset;
						float _falloff;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[5];
						vec4 _ScreenParams;
						vec4 unused_1_3[2];
					};
					layout(std140) uniform UnityPerCameraRare {
						vec4 unused_2_0[6];
						mat4x4 unity_CameraProjection;
						vec4 unused_2_2[12];
					};
					uniform  sampler2D _corpsegp1;
					in  vec4 vs_TEXCOORD0;
					in  float vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					bool u_xlatb2;
					vec2 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat10_5;
					vec4 u_xlat10_6;
					vec4 u_xlat10_7;
					bool u_xlatb8;
					float u_xlat9;
					float u_xlat16;
					int u_xlati16;
					int u_xlati17;
					vec2 u_xlat19;
					float u_xlat24;
					bool u_xlatb24;
					float u_xlat25;
					void main()
					{
					    u_xlatb0 = unity_CameraProjection[0].z!=0.0;
					    u_xlatb8 = unity_CameraProjection[1].z!=0.0;
					    u_xlatb0 = u_xlatb8 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat16 = vs_TEXCOORD1 * _ds;
					    u_xlat24 = _BRoffset * 6.28318548;
					    u_xlat1.x = (-_falloff) * 0.00999999978 + 1.0;
					    u_xlat1.x = _falloff * 0.0500000007 + (-u_xlat1.x);
					    u_xlat9 = float(_samples);
					    u_xlat9 = u_xlat9 * 0.25 + 3.0;
					    u_xlati17 = int(u_xlat9);
					    u_xlat16 = u_xlat16 * 0.0500000007;
					    u_xlat9 = trunc(u_xlat9);
					    u_xlat16 = u_xlat16 / u_xlat9;
					    u_xlat25 = _Time.y * 0.03125;
					    u_xlatb2 = u_xlat25>=(-u_xlat25);
					    u_xlat25 = fract(abs(u_xlat25));
					    u_xlat25 = (u_xlatb2) ? u_xlat25 : (-u_xlat25);
					    u_xlat2.xy = vec2(u_xlat25) * vec2(32.0, 32.0) + u_xlat0.xy;
					    u_xlat25 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					    u_xlat25 = sin(u_xlat25);
					    u_xlat25 = u_xlat25 * 47758.5469;
					    u_xlat25 = fract(u_xlat25);
					    u_xlat1.x = u_xlat25 * u_xlat1.x;
					    u_xlat16 = u_xlat1.x * u_xlat16 + u_xlat16;
					    u_xlat1.x = _ScreenParams.x / _ScreenParams.y;
					    u_xlat16 = u_xlat16 * u_xlat1.x;
					    u_xlat24 = _Time.y * _BRspeed + u_xlat24;
					    u_xlat1.x = sin(u_xlat24);
					    u_xlat2.x = cos(u_xlat24);
					    u_xlat3.x = u_xlat16 * u_xlat1.x;
					    u_xlat3.y = u_xlat16 * u_xlat2.x;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati17 ; u_xlati_loop_1++)
					    {
					        u_xlat24 = float(u_xlati_loop_1);
					        u_xlat4.xyz = vec3(u_xlat24) * vec3(0.99000001, 0.660000026, 0.330000013);
					        u_xlat5 = u_xlat4.xxyy * u_xlat3.xyxy + u_xlat0.xyxy;
					        u_xlat1.xw = u_xlat4.zz * u_xlat3.xy + u_xlat0.xy;
					        u_xlat19.xy = (-u_xlat4.zz) * u_xlat3.xy + u_xlat0.xy;
					        u_xlat4 = (-u_xlat4.xxyy) * u_xlat3.xyxy + u_xlat0.xyxy;
					        u_xlat10_6 = texture(_corpsegp1, u_xlat5.xy);
					        u_xlat10_5 = texture(_corpsegp1, u_xlat5.zw);
					        u_xlat5.x = u_xlat10_5.x + u_xlat10_6.x;
					        u_xlat10_6 = texture(_corpsegp1, u_xlat1.xw);
					        u_xlat10_7 = texture(_corpsegp1, u_xlat19.xy);
					        u_xlat5.y = u_xlat10_6.y + u_xlat10_7.y;
					        u_xlat10_6 = texture(_corpsegp1, u_xlat4.xy);
					        u_xlat10_4 = texture(_corpsegp1, u_xlat4.zw);
					        u_xlat5.z = u_xlat10_4.z + u_xlat10_6.z;
					        u_xlat2.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    }
					    SV_Target0.xyz = u_xlat2.xyz / vec3(u_xlat9);
					    SV_Target0.w = _Alpha;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" "BLUR_RGB" "CENTERING_BLUR_ON" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _Alpha;
						int _samples;
						float _ds;
						float _BRspeed;
						float _BRoffset;
						float _falloff;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
						vec4 _ScreenParams;
						vec4 unused_1_3[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[32];
						mat4x4 unity_StereoCameraProjection[2];
						vec4 unused_2_2[32];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _corpsegp1;
					in  vec4 vs_TEXCOORD0;
					in  float vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					int u_xlati0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					bool u_xlatb2;
					vec2 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat10_5;
					vec4 u_xlat10_6;
					vec4 u_xlat10_7;
					bool u_xlatb8;
					float u_xlat9;
					float u_xlat16;
					int u_xlati16;
					int u_xlati17;
					vec2 u_xlat19;
					float u_xlat24;
					bool u_xlatb24;
					float u_xlat25;
					void main()
					{
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlatb8 = 0.0!=unity_StereoCameraProjection[u_xlati0 / 4][u_xlati0 % 4].z;
					    u_xlatb0 = 0.0!=unity_StereoCameraProjection[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4].z;
					    u_xlatb0 = u_xlatb0 || u_xlatb8;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat16 = vs_TEXCOORD1 * _ds;
					    u_xlat24 = _BRoffset * 6.28318548;
					    u_xlat1.x = (-_falloff) * 0.00999999978 + 1.0;
					    u_xlat1.x = _falloff * 0.0500000007 + (-u_xlat1.x);
					    u_xlat9 = float(_samples);
					    u_xlat9 = u_xlat9 * 0.25 + 3.0;
					    u_xlati17 = int(u_xlat9);
					    u_xlat16 = u_xlat16 * 0.0500000007;
					    u_xlat9 = trunc(u_xlat9);
					    u_xlat16 = u_xlat16 / u_xlat9;
					    u_xlat25 = _Time.y * 0.03125;
					    u_xlatb2 = u_xlat25>=(-u_xlat25);
					    u_xlat25 = fract(abs(u_xlat25));
					    u_xlat25 = (u_xlatb2) ? u_xlat25 : (-u_xlat25);
					    u_xlat2.xy = vec2(u_xlat25) * vec2(32.0, 32.0) + u_xlat0.xy;
					    u_xlat25 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					    u_xlat25 = sin(u_xlat25);
					    u_xlat25 = u_xlat25 * 47758.5469;
					    u_xlat25 = fract(u_xlat25);
					    u_xlat1.x = u_xlat25 * u_xlat1.x;
					    u_xlat16 = u_xlat1.x * u_xlat16 + u_xlat16;
					    u_xlat1.x = _ScreenParams.x / _ScreenParams.y;
					    u_xlat16 = dot(u_xlat1.xx, vec2(u_xlat16));
					    u_xlat24 = _Time.y * _BRspeed + u_xlat24;
					    u_xlat1.x = sin(u_xlat24);
					    u_xlat2.x = cos(u_xlat24);
					    u_xlat3.x = u_xlat16 * u_xlat1.x;
					    u_xlat3.y = u_xlat16 * u_xlat2.x;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati17 ; u_xlati_loop_1++)
					    {
					        u_xlat24 = float(u_xlati_loop_1);
					        u_xlat4.xyz = vec3(u_xlat24) * vec3(0.99000001, 0.660000026, 0.330000013);
					        u_xlat5 = u_xlat4.xxyy * u_xlat3.xyxy + u_xlat0.xyxy;
					        u_xlat1.xw = u_xlat4.zz * u_xlat3.xy + u_xlat0.xy;
					        u_xlat19.xy = (-u_xlat4.zz) * u_xlat3.xy + u_xlat0.xy;
					        u_xlat4 = (-u_xlat4.xxyy) * u_xlat3.xyxy + u_xlat0.xyxy;
					        u_xlat10_6 = texture(_corpsegp1, u_xlat5.xy);
					        u_xlat10_5 = texture(_corpsegp1, u_xlat5.zw);
					        u_xlat5.x = u_xlat10_5.x + u_xlat10_6.x;
					        u_xlat10_6 = texture(_corpsegp1, u_xlat1.xw);
					        u_xlat10_7 = texture(_corpsegp1, u_xlat19.xy);
					        u_xlat5.y = u_xlat10_6.y + u_xlat10_7.y;
					        u_xlat10_6 = texture(_corpsegp1, u_xlat4.xy);
					        u_xlat10_4 = texture(_corpsegp1, u_xlat4.zw);
					        u_xlat5.z = u_xlat10_4.z + u_xlat10_6.z;
					        u_xlat2.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    }
					    SV_Target0.xyz = u_xlat2.xyz / vec3(u_xlat9);
					    SV_Target0.w = _Alpha;
					    return;
					}"
				}
			}
		}
		GrabPass {
			"_corpsegp2"
		}
		Pass {
			Tags { "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "QUEUE" = "Geometry+2145285568" "RenderType" = "Overlay" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZTest Always
			ZWrite Off
			Cull Front
			GpuProgramID 112843
			Program "vp" {
				SubProgram "d3d11 " {
					Keywords { "BLUR_OFF" "HUE_OFF" "ZOOM_OFF" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						float _fe;
						float _fs;
						vec4 unused_0_3;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityPerCameraRare {
						vec4 unused_2_0[18];
						mat4x4 unity_CameraToWorld;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[9];
						mat4x4 unity_MatrixV;
						vec4 unused_4_2[4];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_4[2];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out float vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					bool u_xlatb4;
					void main()
					{
					    u_xlat0.xyz = _WorldSpaceCameraPos.xyz + (-unity_ObjectToWorld[3].xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlatb4 = u_xlat0.x>=_fe;
					    u_xlat0.x = u_xlat0.x + (-_fs);
					    u_xlat4.x = u_xlatb4 ? 1.0 : float(0.0);
					    u_xlat1 = in_POSITION0.yyyy * unity_CameraToWorld[1];
					    u_xlat1 = unity_CameraToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_CameraToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = unity_CameraToWorld[3] * in_POSITION0.wwww + u_xlat1;
					    u_xlat2.xyz = u_xlat1.yyy * unity_WorldToObject[1].xyz;
					    u_xlat2.xyz = unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_WorldToObject[3].xyz * u_xlat1.www + u_xlat2.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_ObjectToWorld[1];
					    u_xlat3 = unity_ObjectToWorld[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat2 = unity_ObjectToWorld[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = u_xlat2 + unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat3 = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    u_xlat3 = (-u_xlat3) * u_xlat4.xxxx + u_xlat3;
					    gl_Position = u_xlat3;
					    u_xlat4.xyz = u_xlat3.xwy * vec3(0.5, 0.5, -0.5);
					    vs_TEXCOORD0.zw = u_xlat3.zw;
					    vs_TEXCOORD0.xy = u_xlat4.yy + u_xlat4.xz;
					    u_xlat3 = u_xlat1.yyyy * unity_WorldToObject[1];
					    u_xlat3 = unity_WorldToObject[0] * u_xlat1.xxxx + u_xlat3;
					    u_xlat3 = unity_WorldToObject[2] * u_xlat1.zzzz + u_xlat3;
					    u_xlat1 = unity_WorldToObject[3] * u_xlat1.wwww + u_xlat3;
					    u_xlat4.xyz = u_xlat1.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat4.xyz = unity_ObjectToWorld[0].xyz * u_xlat1.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = unity_ObjectToWorld[2].xyz * u_xlat1.zzz + u_xlat4.xyz;
					    u_xlat4.xyz = unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat4.xyz;
					    vs_TEXCOORD2.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat4.x = (-_fs) + _fe;
					    u_xlat4.x = float(1.0) / u_xlat4.x;
					    vs_TEXCOORD1 = (-u_xlat4.x) * u_xlat0.x + 1.0;
					    vs_TEXCOORD1 = clamp(vs_TEXCOORD1, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat2.yyy * unity_MatrixV[1].xyz;
					    u_xlat0.xyz = unity_MatrixV[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_MatrixV[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_MatrixV[3].xyz * u_xlat2.www + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" "BLUR_OFF" "HUE_OFF" "ZOOM_OFF" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						float _fe;
						float _fs;
						vec4 unused_0_3;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[8];
						mat4x4 unity_StereoMatrixV[2];
						vec4 unused_2_2[12];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_4[28];
						mat4x4 unity_StereoCameraToWorld[2];
						vec4 unused_2_6[4];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_8;
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_2_10;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out float vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					int u_xlati3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					bool u_xlatb5;
					vec3 u_xlat8;
					int u_xlati10;
					void main()
					{
					    u_xlat0.xyz = unity_StereoWorldSpaceCameraPos[0].xyz + unity_StereoWorldSpaceCameraPos[1].xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + (-unity_ObjectToWorld[3].xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlatb5 = u_xlat0.x>=_fe;
					    u_xlat0.x = u_xlat0.x + (-_fs);
					    u_xlat5.x = u_xlatb5 ? 1.0 : float(0.0);
					    u_xlati10 = unity_StereoEyeIndex << 2;
					    u_xlat1 = in_POSITION0.yyyy * unity_StereoCameraToWorld[(u_xlati10 + 1) / 4][(u_xlati10 + 1) % 4];
					    u_xlat1 = unity_StereoCameraToWorld[u_xlati10 / 4][u_xlati10 % 4] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_StereoCameraToWorld[(u_xlati10 + 2) / 4][(u_xlati10 + 2) % 4] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = unity_StereoCameraToWorld[(u_xlati10 + 3) / 4][(u_xlati10 + 3) % 4] * in_POSITION0.wwww + u_xlat1;
					    u_xlat2.xyz = u_xlat1.yyy * unity_WorldToObject[1].xyz;
					    u_xlat2.xyz = unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_WorldToObject[3].xyz * u_xlat1.www + u_xlat2.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_ObjectToWorld[1];
					    u_xlat3 = unity_ObjectToWorld[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat2 = unity_ObjectToWorld[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = u_xlat2 + unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat2.yyyy * unity_StereoMatrixVP[(u_xlati10 + 1) / 4][(u_xlati10 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati10 / 4][u_xlati10 % 4] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati10 + 2) / 4][(u_xlati10 + 2) % 4] * u_xlat2.zzzz + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati10 + 3) / 4][(u_xlati10 + 3) % 4] * u_xlat2.wwww + u_xlat3;
					    u_xlat3 = (-u_xlat3) * u_xlat5.xxxx + u_xlat3;
					    gl_Position = u_xlat3;
					    u_xlat4.xyz = u_xlat3.xwy * vec3(0.5, 0.5, -0.5);
					    u_xlat5.xz = u_xlat4.yy + u_xlat4.xz;
					    u_xlati3 = unity_StereoEyeIndex;
					    u_xlat4.xy = u_xlat3.ww * unity_StereoScaleOffset[u_xlati3].zw;
					    vs_TEXCOORD0.zw = u_xlat3.zw;
					    vs_TEXCOORD0.xy = u_xlat5.xz * unity_StereoScaleOffset[u_xlati3].xy + u_xlat4.xy;
					    u_xlat4 = u_xlat1.yyyy * unity_WorldToObject[1];
					    u_xlat4 = unity_WorldToObject[0] * u_xlat1.xxxx + u_xlat4;
					    u_xlat4 = unity_WorldToObject[2] * u_xlat1.zzzz + u_xlat4;
					    u_xlat1 = unity_WorldToObject[3] * u_xlat1.wwww + u_xlat4;
					    u_xlat8.xyz = u_xlat1.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat8.xyz = unity_ObjectToWorld[0].xyz * u_xlat1.xxx + u_xlat8.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * u_xlat1.zzz + u_xlat8.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = (-u_xlat1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati3].xyz;
					    u_xlat5.x = (-_fs) + _fe;
					    u_xlat5.x = float(1.0) / u_xlat5.x;
					    vs_TEXCOORD1 = (-u_xlat5.x) * u_xlat0.x + 1.0;
					    vs_TEXCOORD1 = clamp(vs_TEXCOORD1, 0.0, 1.0);
					    u_xlat0.xyw = u_xlat2.yyy * unity_StereoMatrixV[(u_xlati10 + 1) / 4][(u_xlati10 + 1) % 4].xyz;
					    u_xlat0.xyw = unity_StereoMatrixV[u_xlati10 / 4][u_xlati10 % 4].xyz * u_xlat2.xxx + u_xlat0.xyw;
					    u_xlat0.xyw = unity_StereoMatrixV[(u_xlati10 + 2) / 4][(u_xlati10 + 2) % 4].xyz * u_xlat2.zzz + u_xlat0.xyw;
					    u_xlat0.xyz = unity_StereoMatrixV[(u_xlati10 + 3) / 4][(u_xlati10 + 3) % 4].xyz * u_xlat2.www + u_xlat0.xyw;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BLUR_RGB" "HUE_OFF" "WORLD_DISTORTION_ON" "EDGEGLOW_ON" "GIRLSCAM_ON" "ZOOM_SIMPLE" "SHOCKWAVE_ON" "COLOR_GRADING_ON" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						float _fe;
						float _fs;
						vec4 unused_0_3[13];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityPerCameraRare {
						vec4 unused_2_0[18];
						mat4x4 unity_CameraToWorld;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[9];
						mat4x4 unity_MatrixV;
						vec4 unused_4_2[4];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_4[2];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out float vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					bool u_xlatb4;
					void main()
					{
					    u_xlat0.xyz = _WorldSpaceCameraPos.xyz + (-unity_ObjectToWorld[3].xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlatb4 = u_xlat0.x>=_fe;
					    u_xlat0.x = u_xlat0.x + (-_fs);
					    u_xlat4.x = u_xlatb4 ? 1.0 : float(0.0);
					    u_xlat1 = in_POSITION0.yyyy * unity_CameraToWorld[1];
					    u_xlat1 = unity_CameraToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_CameraToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = unity_CameraToWorld[3] * in_POSITION0.wwww + u_xlat1;
					    u_xlat2.xyz = u_xlat1.yyy * unity_WorldToObject[1].xyz;
					    u_xlat2.xyz = unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_WorldToObject[3].xyz * u_xlat1.www + u_xlat2.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_ObjectToWorld[1];
					    u_xlat3 = unity_ObjectToWorld[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat2 = unity_ObjectToWorld[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = u_xlat2 + unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat3 = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    u_xlat3 = (-u_xlat3) * u_xlat4.xxxx + u_xlat3;
					    gl_Position = u_xlat3;
					    u_xlat4.xyz = u_xlat3.xwy * vec3(0.5, 0.5, -0.5);
					    vs_TEXCOORD0.zw = u_xlat3.zw;
					    vs_TEXCOORD0.xy = u_xlat4.yy + u_xlat4.xz;
					    u_xlat3 = u_xlat1.yyyy * unity_WorldToObject[1];
					    u_xlat3 = unity_WorldToObject[0] * u_xlat1.xxxx + u_xlat3;
					    u_xlat3 = unity_WorldToObject[2] * u_xlat1.zzzz + u_xlat3;
					    u_xlat1 = unity_WorldToObject[3] * u_xlat1.wwww + u_xlat3;
					    u_xlat4.xyz = u_xlat1.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat4.xyz = unity_ObjectToWorld[0].xyz * u_xlat1.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = unity_ObjectToWorld[2].xyz * u_xlat1.zzz + u_xlat4.xyz;
					    u_xlat4.xyz = unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat4.xyz;
					    vs_TEXCOORD2.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat4.x = (-_fs) + _fe;
					    u_xlat4.x = float(1.0) / u_xlat4.x;
					    vs_TEXCOORD1 = (-u_xlat4.x) * u_xlat0.x + 1.0;
					    vs_TEXCOORD1 = clamp(vs_TEXCOORD1, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat2.yyy * unity_MatrixV[1].xyz;
					    u_xlat0.xyz = unity_MatrixV[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_MatrixV[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_MatrixV[3].xyz * u_xlat2.www + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" "BLUR_RGB" "HUE_OFF" "WORLD_DISTORTION_ON" "EDGEGLOW_ON" "GIRLSCAM_ON" "ZOOM_SIMPLE" "SHOCKWAVE_ON" "COLOR_GRADING_ON" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						float _fe;
						float _fs;
						vec4 unused_0_3[13];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[8];
						mat4x4 unity_StereoMatrixV[2];
						vec4 unused_2_2[12];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_4[28];
						mat4x4 unity_StereoCameraToWorld[2];
						vec4 unused_2_6[4];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_8;
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_2_10;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out float vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					int u_xlati3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					bool u_xlatb5;
					vec3 u_xlat8;
					int u_xlati10;
					void main()
					{
					    u_xlat0.xyz = unity_StereoWorldSpaceCameraPos[0].xyz + unity_StereoWorldSpaceCameraPos[1].xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + (-unity_ObjectToWorld[3].xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlatb5 = u_xlat0.x>=_fe;
					    u_xlat0.x = u_xlat0.x + (-_fs);
					    u_xlat5.x = u_xlatb5 ? 1.0 : float(0.0);
					    u_xlati10 = unity_StereoEyeIndex << 2;
					    u_xlat1 = in_POSITION0.yyyy * unity_StereoCameraToWorld[(u_xlati10 + 1) / 4][(u_xlati10 + 1) % 4];
					    u_xlat1 = unity_StereoCameraToWorld[u_xlati10 / 4][u_xlati10 % 4] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_StereoCameraToWorld[(u_xlati10 + 2) / 4][(u_xlati10 + 2) % 4] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = unity_StereoCameraToWorld[(u_xlati10 + 3) / 4][(u_xlati10 + 3) % 4] * in_POSITION0.wwww + u_xlat1;
					    u_xlat2.xyz = u_xlat1.yyy * unity_WorldToObject[1].xyz;
					    u_xlat2.xyz = unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_WorldToObject[3].xyz * u_xlat1.www + u_xlat2.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_ObjectToWorld[1];
					    u_xlat3 = unity_ObjectToWorld[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat2 = unity_ObjectToWorld[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = u_xlat2 + unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat2.yyyy * unity_StereoMatrixVP[(u_xlati10 + 1) / 4][(u_xlati10 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati10 / 4][u_xlati10 % 4] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati10 + 2) / 4][(u_xlati10 + 2) % 4] * u_xlat2.zzzz + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati10 + 3) / 4][(u_xlati10 + 3) % 4] * u_xlat2.wwww + u_xlat3;
					    u_xlat3 = (-u_xlat3) * u_xlat5.xxxx + u_xlat3;
					    gl_Position = u_xlat3;
					    u_xlat4.xyz = u_xlat3.xwy * vec3(0.5, 0.5, -0.5);
					    u_xlat5.xz = u_xlat4.yy + u_xlat4.xz;
					    u_xlati3 = unity_StereoEyeIndex;
					    u_xlat4.xy = u_xlat3.ww * unity_StereoScaleOffset[u_xlati3].zw;
					    vs_TEXCOORD0.zw = u_xlat3.zw;
					    vs_TEXCOORD0.xy = u_xlat5.xz * unity_StereoScaleOffset[u_xlati3].xy + u_xlat4.xy;
					    u_xlat4 = u_xlat1.yyyy * unity_WorldToObject[1];
					    u_xlat4 = unity_WorldToObject[0] * u_xlat1.xxxx + u_xlat4;
					    u_xlat4 = unity_WorldToObject[2] * u_xlat1.zzzz + u_xlat4;
					    u_xlat1 = unity_WorldToObject[3] * u_xlat1.wwww + u_xlat4;
					    u_xlat8.xyz = u_xlat1.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat8.xyz = unity_ObjectToWorld[0].xyz * u_xlat1.xxx + u_xlat8.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * u_xlat1.zzz + u_xlat8.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = (-u_xlat1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati3].xyz;
					    u_xlat5.x = (-_fs) + _fe;
					    u_xlat5.x = float(1.0) / u_xlat5.x;
					    vs_TEXCOORD1 = (-u_xlat5.x) * u_xlat0.x + 1.0;
					    vs_TEXCOORD1 = clamp(vs_TEXCOORD1, 0.0, 1.0);
					    u_xlat0.xyw = u_xlat2.yyy * unity_StereoMatrixV[(u_xlati10 + 1) / 4][(u_xlati10 + 1) % 4].xyz;
					    u_xlat0.xyw = unity_StereoMatrixV[u_xlati10 / 4][u_xlati10 % 4].xyz * u_xlat2.xxx + u_xlat0.xyw;
					    u_xlat0.xyw = unity_StereoMatrixV[(u_xlati10 + 2) / 4][(u_xlati10 + 2) % 4].xyz * u_xlat2.zzz + u_xlat0.xyw;
					    u_xlat0.xyz = unity_StereoMatrixV[(u_xlati10 + 3) / 4][(u_xlati10 + 3) % 4].xyz * u_xlat2.www + u_xlat0.xyw;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BLUR_OFF" "EDGYSPACE_ON" "HUE_OFF" "EDGEGLOW_ON" "ZOOM_FISHEYE" "SHAKE_ON" "WAVES_ON" "COLOR_GRADING_ON" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						float _fe;
						float _fs;
						vec4 unused_0_3[12];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityPerCameraRare {
						vec4 unused_2_0[18];
						mat4x4 unity_CameraToWorld;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[9];
						mat4x4 unity_MatrixV;
						vec4 unused_4_2[4];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_4[2];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out float vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					bool u_xlatb4;
					void main()
					{
					    u_xlat0.xyz = _WorldSpaceCameraPos.xyz + (-unity_ObjectToWorld[3].xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlatb4 = u_xlat0.x>=_fe;
					    u_xlat0.x = u_xlat0.x + (-_fs);
					    u_xlat4.x = u_xlatb4 ? 1.0 : float(0.0);
					    u_xlat1 = in_POSITION0.yyyy * unity_CameraToWorld[1];
					    u_xlat1 = unity_CameraToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_CameraToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = unity_CameraToWorld[3] * in_POSITION0.wwww + u_xlat1;
					    u_xlat2.xyz = u_xlat1.yyy * unity_WorldToObject[1].xyz;
					    u_xlat2.xyz = unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_WorldToObject[3].xyz * u_xlat1.www + u_xlat2.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_ObjectToWorld[1];
					    u_xlat3 = unity_ObjectToWorld[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat2 = unity_ObjectToWorld[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = u_xlat2 + unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat3 = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    u_xlat3 = (-u_xlat3) * u_xlat4.xxxx + u_xlat3;
					    gl_Position = u_xlat3;
					    u_xlat4.xyz = u_xlat3.xwy * vec3(0.5, 0.5, -0.5);
					    vs_TEXCOORD0.zw = u_xlat3.zw;
					    vs_TEXCOORD0.xy = u_xlat4.yy + u_xlat4.xz;
					    u_xlat3 = u_xlat1.yyyy * unity_WorldToObject[1];
					    u_xlat3 = unity_WorldToObject[0] * u_xlat1.xxxx + u_xlat3;
					    u_xlat3 = unity_WorldToObject[2] * u_xlat1.zzzz + u_xlat3;
					    u_xlat1 = unity_WorldToObject[3] * u_xlat1.wwww + u_xlat3;
					    u_xlat4.xyz = u_xlat1.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat4.xyz = unity_ObjectToWorld[0].xyz * u_xlat1.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = unity_ObjectToWorld[2].xyz * u_xlat1.zzz + u_xlat4.xyz;
					    u_xlat4.xyz = unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat4.xyz;
					    vs_TEXCOORD2.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat4.x = (-_fs) + _fe;
					    u_xlat4.x = float(1.0) / u_xlat4.x;
					    vs_TEXCOORD1 = (-u_xlat4.x) * u_xlat0.x + 1.0;
					    vs_TEXCOORD1 = clamp(vs_TEXCOORD1, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat2.yyy * unity_MatrixV[1].xyz;
					    u_xlat0.xyz = unity_MatrixV[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_MatrixV[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_MatrixV[3].xyz * u_xlat2.www + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" "BLUR_OFF" "EDGYSPACE_ON" "HUE_OFF" "EDGEGLOW_ON" "ZOOM_FISHEYE" "SHAKE_ON" "WAVES_ON" "COLOR_GRADING_ON" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						float _fe;
						float _fs;
						vec4 unused_0_3[12];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[8];
						mat4x4 unity_StereoMatrixV[2];
						vec4 unused_2_2[12];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_4[28];
						mat4x4 unity_StereoCameraToWorld[2];
						vec4 unused_2_6[4];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_8;
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_2_10;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out float vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					int u_xlati3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					bool u_xlatb5;
					vec3 u_xlat8;
					int u_xlati10;
					void main()
					{
					    u_xlat0.xyz = unity_StereoWorldSpaceCameraPos[0].xyz + unity_StereoWorldSpaceCameraPos[1].xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + (-unity_ObjectToWorld[3].xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlatb5 = u_xlat0.x>=_fe;
					    u_xlat0.x = u_xlat0.x + (-_fs);
					    u_xlat5.x = u_xlatb5 ? 1.0 : float(0.0);
					    u_xlati10 = unity_StereoEyeIndex << 2;
					    u_xlat1 = in_POSITION0.yyyy * unity_StereoCameraToWorld[(u_xlati10 + 1) / 4][(u_xlati10 + 1) % 4];
					    u_xlat1 = unity_StereoCameraToWorld[u_xlati10 / 4][u_xlati10 % 4] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_StereoCameraToWorld[(u_xlati10 + 2) / 4][(u_xlati10 + 2) % 4] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = unity_StereoCameraToWorld[(u_xlati10 + 3) / 4][(u_xlati10 + 3) % 4] * in_POSITION0.wwww + u_xlat1;
					    u_xlat2.xyz = u_xlat1.yyy * unity_WorldToObject[1].xyz;
					    u_xlat2.xyz = unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_WorldToObject[3].xyz * u_xlat1.www + u_xlat2.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_ObjectToWorld[1];
					    u_xlat3 = unity_ObjectToWorld[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat2 = unity_ObjectToWorld[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = u_xlat2 + unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat2.yyyy * unity_StereoMatrixVP[(u_xlati10 + 1) / 4][(u_xlati10 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati10 / 4][u_xlati10 % 4] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati10 + 2) / 4][(u_xlati10 + 2) % 4] * u_xlat2.zzzz + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati10 + 3) / 4][(u_xlati10 + 3) % 4] * u_xlat2.wwww + u_xlat3;
					    u_xlat3 = (-u_xlat3) * u_xlat5.xxxx + u_xlat3;
					    gl_Position = u_xlat3;
					    u_xlat4.xyz = u_xlat3.xwy * vec3(0.5, 0.5, -0.5);
					    u_xlat5.xz = u_xlat4.yy + u_xlat4.xz;
					    u_xlati3 = unity_StereoEyeIndex;
					    u_xlat4.xy = u_xlat3.ww * unity_StereoScaleOffset[u_xlati3].zw;
					    vs_TEXCOORD0.zw = u_xlat3.zw;
					    vs_TEXCOORD0.xy = u_xlat5.xz * unity_StereoScaleOffset[u_xlati3].xy + u_xlat4.xy;
					    u_xlat4 = u_xlat1.yyyy * unity_WorldToObject[1];
					    u_xlat4 = unity_WorldToObject[0] * u_xlat1.xxxx + u_xlat4;
					    u_xlat4 = unity_WorldToObject[2] * u_xlat1.zzzz + u_xlat4;
					    u_xlat1 = unity_WorldToObject[3] * u_xlat1.wwww + u_xlat4;
					    u_xlat8.xyz = u_xlat1.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat8.xyz = unity_ObjectToWorld[0].xyz * u_xlat1.xxx + u_xlat8.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * u_xlat1.zzz + u_xlat8.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = (-u_xlat1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati3].xyz;
					    u_xlat5.x = (-_fs) + _fe;
					    u_xlat5.x = float(1.0) / u_xlat5.x;
					    vs_TEXCOORD1 = (-u_xlat5.x) * u_xlat0.x + 1.0;
					    vs_TEXCOORD1 = clamp(vs_TEXCOORD1, 0.0, 1.0);
					    u_xlat0.xyw = u_xlat2.yyy * unity_StereoMatrixV[(u_xlati10 + 1) / 4][(u_xlati10 + 1) % 4].xyz;
					    u_xlat0.xyw = unity_StereoMatrixV[u_xlati10 / 4][u_xlati10 % 4].xyz * u_xlat2.xxx + u_xlat0.xyw;
					    u_xlat0.xyw = unity_StereoMatrixV[(u_xlati10 + 2) / 4][(u_xlati10 + 2) % 4].xyz * u_xlat2.zzz + u_xlat0.xyw;
					    u_xlat0.xyz = unity_StereoMatrixV[(u_xlati10 + 3) / 4][(u_xlati10 + 3) % 4].xyz * u_xlat2.www + u_xlat0.xyw;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					Keywords { "BLUR_OFF" "HUE_OFF" "ZOOM_OFF" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _Alpha;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerCameraRare {
						vec4 unused_1_0[6];
						mat4x4 unity_CameraProjection;
						vec4 unused_1_2[12];
					};
					uniform  sampler2D _corpsegp2;
					in  vec4 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					bool u_xlatb1;
					void main()
					{
					    u_xlatb0 = unity_CameraProjection[0].z!=0.0;
					    u_xlatb1 = unity_CameraProjection[1].z!=0.0;
					    u_xlatb0 = u_xlatb1 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0 = texture(_corpsegp2, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    SV_Target0.w = _Alpha;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" "BLUR_OFF" "HUE_OFF" "ZOOM_OFF" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _Alpha;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_1_0[32];
						mat4x4 unity_StereoCameraProjection[2];
						vec4 unused_1_2[32];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _corpsegp2;
					in  vec4 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					int u_xlati0;
					bool u_xlatb0;
					bool u_xlatb1;
					void main()
					{
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlatb1 = 0.0!=unity_StereoCameraProjection[u_xlati0 / 4][u_xlati0 % 4].z;
					    u_xlatb0 = 0.0!=unity_StereoCameraProjection[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4].z;
					    u_xlatb0 = u_xlatb0 || u_xlatb1;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0 = texture(_corpsegp2, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    SV_Target0.w = _Alpha;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BLUR_RGB" "HUE_OFF" "WORLD_DISTORTION_ON" "EDGEGLOW_ON" "GIRLSCAM_ON" "ZOOM_SIMPLE" "SHOCKWAVE_ON" "COLOR_GRADING_ON" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _Alpha;
						float _Zoom;
						float _Dir;
						float _woffset;
						float _wpower;
						float _wspeed;
						int _wcntr;
						float _wx;
						float _wy;
						float _wz;
						float _Girlscam;
						float _Girlscamcount;
						int _Moving;
						float _nmapscale;
						float _nmaptile;
						float _dspeed;
						float _egoffset;
						float _egpow;
						vec4 _egcol;
						float _HDR;
						float _HDRMultiplyer;
						float _Contrast;
						float _grsc;
						vec4 _Colorm;
						vec4 _ColorL;
						vec4 _ColorR;
						vec4 _brightColor;
						vec4 _darkColor;
						float _threshold;
						float _softness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3;
						vec4 _ScreenParams;
						vec4 unused_1_5[2];
					};
					layout(std140) uniform UnityPerCameraRare {
						vec4 unused_2_0[6];
						mat4x4 unity_CameraProjection;
						vec4 unused_2_2[8];
						mat4x4 unity_CameraToWorld;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_3_1[6];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_2[2];
					};
					uniform  sampler2D _corpsegp2;
					in  vec4 vs_TEXCOORD0;
					in  float vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat16_2;
					bool u_xlatb2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec2 u_xlat16_5;
					vec4 u_xlat10_5;
					vec4 u_xlat6;
					vec4 u_xlat10_6;
					bvec3 u_xlatb6;
					vec4 u_xlat7;
					vec4 u_xlat10_7;
					bvec3 u_xlatb7;
					vec4 u_xlat8;
					vec4 u_xlat10_8;
					bvec3 u_xlatb8;
					vec4 u_xlat9;
					vec4 u_xlat10_9;
					vec4 u_xlat10;
					vec4 u_xlat10_10;
					vec4 u_xlat11;
					vec4 u_xlat12;
					vec4 u_xlat13;
					bvec4 u_xlatb13;
					vec4 u_xlat14;
					bvec4 u_xlatb14;
					vec4 u_xlat15;
					bvec4 u_xlatb15;
					vec4 u_xlat16;
					vec3 u_xlat17;
					vec2 u_xlat16_17;
					bool u_xlatb17;
					vec3 u_xlat18;
					float u_xlat19;
					vec3 u_xlat20;
					vec2 u_xlat34;
					vec2 u_xlat35;
					bool u_xlatb35;
					vec2 u_xlat36;
					vec2 u_xlat16_36;
					vec2 u_xlat39;
					float u_xlat51;
					float u_xlat52;
					bool u_xlatb52;
					float u_xlat54;
					bool u_xlatb54;
					void main()
					{
					    u_xlatb0 = unity_CameraProjection[0].z!=0.0;
					    u_xlatb17 = unity_CameraProjection[1].z!=0.0;
					    u_xlatb0 = u_xlatb17 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat1.xyz = unity_CameraToWorld[2].xyz + unity_CameraToWorld[3].xyz;
					    u_xlat1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat2.xyz = (-_WorldSpaceCameraPos.xyz) + unity_ObjectToWorld[3].xyz;
					    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat52 = inversesqrt(u_xlat52);
					    u_xlat3.xyz = vec3(u_xlat52) * u_xlat1.xyz;
					    u_xlat52 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat52 = inversesqrt(u_xlat52);
					    u_xlat2.xyz = vec3(u_xlat52) * u_xlat2.xyz;
					    u_xlat52 = dot(u_xlat3.xyz, u_xlat2.xyz);
					    u_xlatb2 = _Dir<u_xlat52;
					    u_xlat52 = u_xlat52 + (-_Dir);
					    u_xlat19 = (-_Dir) + 1.0;
					    u_xlat52 = u_xlat52 / u_xlat19;
					    u_xlat52 = u_xlatb2 ? u_xlat52 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(10000.0, 10000.0, 10000.0) + _WorldSpaceCameraPos.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * unity_MatrixVP[1].xwy;
					    u_xlat3.xyz = unity_MatrixVP[0].xwy * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = unity_MatrixVP[2].xwy * u_xlat1.zzz + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + unity_MatrixVP[3].xwy;
					    u_xlat3.xyz = u_xlat1.xyz * vec3(0.5, 0.5, -0.5);
					    u_xlat1.xz = u_xlat3.yy + u_xlat3.xz;
					    u_xlat1.xy = u_xlat1.xz / u_xlat1.yy;
					    u_xlat3.xyz = unity_ObjectToWorld[3].yyy * unity_MatrixVP[1].xwy;
					    u_xlat3.xyz = unity_MatrixVP[0].xwy * unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_MatrixVP[2].xwy * unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = unity_MatrixVP[3].xwy * unity_ObjectToWorld[3].www + u_xlat3.xyz;
					    u_xlat3.xzw = u_xlat3.xyz * vec3(0.5, 0.5, -0.5);
					    u_xlat36.xy = u_xlat3.zz + u_xlat3.xw;
					    u_xlat36.xy = u_xlat36.xy / u_xlat3.yy;
					    u_xlat35.x = vs_TEXCOORD1 * _Zoom;
					    u_xlat3.xy = (-u_xlat2.xy) + u_xlat1.xy;
					    u_xlat3.xz = u_xlat35.xx * u_xlat3.xy + u_xlat2.xy;
					    u_xlat2.xy = vec2(vs_TEXCOORD1) * vec2(_Girlscam, _nmapscale);
					    u_xlat35.x = u_xlat2.y * 0.0500000007;
					    u_xlat2.x = (-u_xlat2.x) * 0.000500000024 + 0.999899983;
					    u_xlat19 = float(_Moving);
					    u_xlat19 = u_xlat19 * _Time.y;
					    u_xlat19 = sin(u_xlat19);
					    u_xlat19 = u_xlat19 + 1.0;
					    u_xlat3.w = u_xlat19 * 5.0008297e-05 + u_xlat2.x;
					    u_xlat2.x = dot(u_xlat3.zw, vec2(112.989799, 778.232971));
					    u_xlat2.x = sin(u_xlat2.x);
					    u_xlat19 = u_xlat2.x * 57758.5508;
					    u_xlat19 = floor(u_xlat19);
					    u_xlat2.x = u_xlat2.x * 57758.5508 + (-u_xlat19);
					    u_xlat2.x = u_xlat2.x * 2.0 + -1.0;
					    u_xlat3.x = u_xlat3.x;
					    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					    u_xlat19 = (-u_xlat3.w) + 1.0;
					    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
					    u_xlat54 = u_xlat19 * 0.0500000007 + (-_Girlscamcount);
					    u_xlat54 = u_xlat54 + 1.0;
					    u_xlatb54 = abs(u_xlat2.x)>=u_xlat54;
					    u_xlat54 = u_xlatb54 ? 1.0 : float(0.0);
					    u_xlat19 = u_xlat19 * u_xlat54;
					    u_xlat2.x = u_xlat2.x * u_xlat19 + u_xlat3.x;
					    u_xlat19 = floor(u_xlat2.x);
					    u_xlat3.y = (-u_xlat19) + u_xlat2.x;
					    u_xlat4.xyz = _Time.yyy * vec3(vec3(_dspeed, _dspeed, _dspeed)) + u_xlat0.zyx;
					    u_xlat4.xyz = u_xlat4.zxy + vec3(22.9580002, 27.2350006, 21.7849998);
					    u_xlat0.w = u_xlat4.y;
					    u_xlat5.xyz = u_xlat0.xyw * vec3(_nmaptile);
					    u_xlat2.x = dot(u_xlat5.xyz, vec3(0.333333343, 0.333333343, 0.333333343));
					    u_xlat5.xyz = u_xlat0.xyw * vec3(_nmaptile) + u_xlat2.xxx;
					    u_xlat5.xyz = floor(u_xlat5.xyz);
					    u_xlat6.xyz = u_xlat0.xyw * vec3(_nmaptile) + (-u_xlat5.xyz);
					    u_xlat51 = dot(u_xlat5.xyz, vec3(0.166666672, 0.166666672, 0.166666672));
					    u_xlat6.xyz = vec3(u_xlat51) + u_xlat6.xyz;
					    u_xlatb7.xyz = greaterThanEqual(u_xlat6.zxyz, u_xlat6.xyzx).xyz;
					    u_xlat8.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0), vec3(u_xlatb7.yzx));
					    u_xlat7.x = (u_xlatb7.x) ? float(0.0) : float(1.0);
					    u_xlat7.y = (u_xlatb7.y) ? float(0.0) : float(1.0);
					    u_xlat7.z = (u_xlatb7.z) ? float(0.0) : float(1.0);
					    u_xlat9.xyz = min(u_xlat7.xyz, u_xlat8.xyz);
					    u_xlat7.xyz = max(u_xlat7.yzx, u_xlat8.yzx);
					    u_xlat8.xyz = u_xlat6.xyz + (-u_xlat9.xyz);
					    u_xlat8.xyz = u_xlat8.xyz + vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlat10.xyz = u_xlat6.xyz + (-u_xlat7.zxy);
					    u_xlat10.xyz = u_xlat10.xyz + vec3(0.333333343, 0.333333343, 0.333333343);
					    u_xlat11.xyz = u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat12.xyz = u_xlat5.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat12.xyz = floor(u_xlat12.xyz);
					    u_xlat5.xyz = (-u_xlat12.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat5.xyz;
					    u_xlat12.x = float(0.0);
					    u_xlat12.w = float(1.0);
					    u_xlat12.y = u_xlat9.z;
					    u_xlat12.z = u_xlat7.y;
					    u_xlat12 = u_xlat5.zzzz + u_xlat12;
					    u_xlat13 = u_xlat12 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat12 = u_xlat12 * u_xlat13;
					    u_xlat13 = u_xlat12 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat13 = floor(u_xlat13);
					    u_xlat12 = (-u_xlat13) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat12;
					    u_xlat12 = u_xlat5.yyyy + u_xlat12;
					    u_xlat13.x = float(0.0);
					    u_xlat13.w = float(1.0);
					    u_xlat13.y = u_xlat9.y;
					    u_xlat13.z = u_xlat7.x;
					    u_xlat12 = u_xlat12 + u_xlat13;
					    u_xlat13 = u_xlat12 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat12 = u_xlat12 * u_xlat13;
					    u_xlat13 = u_xlat12 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat13 = floor(u_xlat13);
					    u_xlat12 = (-u_xlat13) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat12;
					    u_xlat5 = u_xlat5.xxxx + u_xlat12;
					    u_xlat7.x = float(0.0);
					    u_xlat7.w = float(1.0);
					    u_xlat7.y = u_xlat9.x;
					    u_xlat5 = u_xlat5 + u_xlat7;
					    u_xlat7 = u_xlat5 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat5 = u_xlat5 * u_xlat7;
					    u_xlat7 = u_xlat5 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat7 = floor(u_xlat7);
					    u_xlat5 = (-u_xlat7) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat5;
					    u_xlat7 = u_xlat5 * vec4(0.0204081628, 0.0204081628, 0.0204081628, 0.0204081628);
					    u_xlat7 = floor(u_xlat7);
					    u_xlat5 = (-u_xlat7) * vec4(49.0, 49.0, 49.0, 49.0) + u_xlat5;
					    u_xlat7 = u_xlat5 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149);
					    u_xlat7 = floor(u_xlat7);
					    u_xlat5 = (-u_xlat7) * vec4(7.0, 7.0, 7.0, 7.0) + u_xlat5;
					    u_xlat7 = u_xlat7 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat7 = u_xlat7 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat5 = u_xlat5 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat5 = u_xlat5.xzyw * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat9 = -abs(u_xlat7) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat9 = -abs(u_xlat5.xzwy) + u_xlat9.xywz;
					    u_xlat12.xz = floor(u_xlat7.xy);
					    u_xlat12.yw = floor(u_xlat5.xz);
					    u_xlat12 = u_xlat12 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat13.xz = floor(u_xlat7.zw);
					    u_xlat13.yw = floor(u_xlat5.yw);
					    u_xlat13 = u_xlat13 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlatb14 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xywz);
					    u_xlat14.x = (u_xlatb14.x) ? float(-1.0) : float(-0.0);
					    u_xlat14.y = (u_xlatb14.y) ? float(-1.0) : float(-0.0);
					    u_xlat14.z = (u_xlatb14.z) ? float(-1.0) : float(-0.0);
					    u_xlat14.w = (u_xlatb14.w) ? float(-1.0) : float(-0.0);
					    u_xlat15.xz = u_xlat7.xy;
					    u_xlat15.yw = u_xlat5.xz;
					    u_xlat12 = u_xlat12.zwxy * u_xlat14.yyxx + u_xlat15.zwxy;
					    u_xlat5.xz = u_xlat7.zw;
					    u_xlat5 = u_xlat13 * u_xlat14.zzww + u_xlat5;
					    u_xlat7.xy = u_xlat12.zw;
					    u_xlat7.z = u_xlat9.x;
					    u_xlat13.x = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat12.z = u_xlat9.y;
					    u_xlat13.y = dot(u_xlat12.xyz, u_xlat12.xyz);
					    u_xlat14.xy = u_xlat5.xy;
					    u_xlat14.z = u_xlat9.w;
					    u_xlat13.z = dot(u_xlat14.xyz, u_xlat14.xyz);
					    u_xlat9.xy = u_xlat5.zw;
					    u_xlat13.w = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat5 = (-u_xlat13) * vec4(0.853734732, 0.853734732, 0.853734732, 0.853734732) + vec4(1.79284286, 1.79284286, 1.79284286, 1.79284286);
					    u_xlat7.xyz = u_xlat5.xxx * u_xlat7.xyz;
					    u_xlat12.xyz = u_xlat5.yyy * u_xlat12.xyz;
					    u_xlat5.xyz = u_xlat5.zzz * u_xlat14.xyz;
					    u_xlat9.xyz = u_xlat5.www * u_xlat9.xyz;
					    u_xlat13.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat13.y = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat13.z = dot(u_xlat10.xyz, u_xlat10.xyz);
					    u_xlat13.w = dot(u_xlat11.xyz, u_xlat11.xyz);
					    u_xlat13 = (-u_xlat13) + vec4(0.600000024, 0.600000024, 0.600000024, 0.600000024);
					    u_xlat13 = max(u_xlat13, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat13 = u_xlat13 * u_xlat13;
					    u_xlat13 = u_xlat13 * u_xlat13;
					    u_xlat6.x = dot(u_xlat6.xyz, u_xlat7.xyz);
					    u_xlat6.y = dot(u_xlat8.xyz, u_xlat12.xyz);
					    u_xlat6.z = dot(u_xlat10.xyz, u_xlat5.xyz);
					    u_xlat6.w = dot(u_xlat11.xyz, u_xlat9.xyz);
					    u_xlat51 = dot(u_xlat13, u_xlat6);
					    u_xlat5.xz = u_xlat0.xz;
					    u_xlat5.y = u_xlat4.z;
					    u_xlat6.xyz = u_xlat5.xyz * vec3(_nmaptile);
					    u_xlat2.x = dot(u_xlat6.xyz, vec3(0.333333343, 0.333333343, 0.333333343));
					    u_xlat6.xyz = u_xlat5.xyz * vec3(_nmaptile) + u_xlat2.xxx;
					    u_xlat6.xyz = floor(u_xlat6.xyz);
					    u_xlat7.xyz = u_xlat5.xyz * vec3(_nmaptile) + (-u_xlat6.xyz);
					    u_xlat2.x = dot(u_xlat6.xyz, vec3(0.166666672, 0.166666672, 0.166666672));
					    u_xlat7.xyz = u_xlat2.xxx + u_xlat7.xyz;
					    u_xlatb8.xyz = greaterThanEqual(u_xlat7.zxyz, u_xlat7.xyzx).xyz;
					    u_xlat9.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0), vec3(u_xlatb8.yzx));
					    u_xlat8.x = (u_xlatb8.x) ? float(0.0) : float(1.0);
					    u_xlat8.y = (u_xlatb8.y) ? float(0.0) : float(1.0);
					    u_xlat8.z = (u_xlatb8.z) ? float(0.0) : float(1.0);
					    u_xlat10.xyz = min(u_xlat8.xyz, u_xlat9.xyz);
					    u_xlat8.xyz = max(u_xlat8.yzx, u_xlat9.yzx);
					    u_xlat9.xyz = u_xlat7.xyz + (-u_xlat10.xyz);
					    u_xlat9.xyz = u_xlat9.xyz + vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlat11.xyz = u_xlat7.xyz + (-u_xlat8.zxy);
					    u_xlat11.xyz = u_xlat11.xyz + vec3(0.333333343, 0.333333343, 0.333333343);
					    u_xlat12.xyz = u_xlat7.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat13.xyz = u_xlat6.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat13.xyz = floor(u_xlat13.xyz);
					    u_xlat6.xyz = (-u_xlat13.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat6.xyz;
					    u_xlat13.x = float(0.0);
					    u_xlat13.w = float(1.0);
					    u_xlat13.y = u_xlat10.z;
					    u_xlat13.z = u_xlat8.y;
					    u_xlat13 = u_xlat6.zzzz + u_xlat13;
					    u_xlat14 = u_xlat13 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat13 = u_xlat13 * u_xlat14;
					    u_xlat14 = u_xlat13 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat14 = floor(u_xlat14);
					    u_xlat13 = (-u_xlat14) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat13;
					    u_xlat13 = u_xlat6.yyyy + u_xlat13;
					    u_xlat14.x = float(0.0);
					    u_xlat14.w = float(1.0);
					    u_xlat14.y = u_xlat10.y;
					    u_xlat14.z = u_xlat8.x;
					    u_xlat13 = u_xlat13 + u_xlat14;
					    u_xlat14 = u_xlat13 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat13 = u_xlat13 * u_xlat14;
					    u_xlat14 = u_xlat13 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat14 = floor(u_xlat14);
					    u_xlat13 = (-u_xlat14) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat13;
					    u_xlat6 = u_xlat6.xxxx + u_xlat13;
					    u_xlat8.x = float(0.0);
					    u_xlat8.w = float(1.0);
					    u_xlat8.y = u_xlat10.x;
					    u_xlat6 = u_xlat6 + u_xlat8;
					    u_xlat8 = u_xlat6 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat6 = u_xlat6 * u_xlat8;
					    u_xlat8 = u_xlat6 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat8 = floor(u_xlat8);
					    u_xlat6 = (-u_xlat8) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat6;
					    u_xlat8 = u_xlat6 * vec4(0.0204081628, 0.0204081628, 0.0204081628, 0.0204081628);
					    u_xlat8 = floor(u_xlat8);
					    u_xlat6 = (-u_xlat8) * vec4(49.0, 49.0, 49.0, 49.0) + u_xlat6;
					    u_xlat8 = u_xlat6 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149);
					    u_xlat8 = floor(u_xlat8);
					    u_xlat6 = (-u_xlat8) * vec4(7.0, 7.0, 7.0, 7.0) + u_xlat6;
					    u_xlat8 = u_xlat8 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat8 = u_xlat8 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat6 = u_xlat6 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat6 = u_xlat6.xzyw * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat10 = -abs(u_xlat8) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat10 = -abs(u_xlat6.xzwy) + u_xlat10.xywz;
					    u_xlat13.xz = floor(u_xlat8.xy);
					    u_xlat13.yw = floor(u_xlat6.xz);
					    u_xlat13 = u_xlat13 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat14.xz = floor(u_xlat8.zw);
					    u_xlat14.yw = floor(u_xlat6.yw);
					    u_xlat14 = u_xlat14 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlatb15 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat10.xywz);
					    u_xlat15.x = (u_xlatb15.x) ? float(-1.0) : float(-0.0);
					    u_xlat15.y = (u_xlatb15.y) ? float(-1.0) : float(-0.0);
					    u_xlat15.z = (u_xlatb15.z) ? float(-1.0) : float(-0.0);
					    u_xlat15.w = (u_xlatb15.w) ? float(-1.0) : float(-0.0);
					    u_xlat16.xz = u_xlat8.xy;
					    u_xlat16.yw = u_xlat6.xz;
					    u_xlat13 = u_xlat13.zwxy * u_xlat15.yyxx + u_xlat16.zwxy;
					    u_xlat6.xz = u_xlat8.zw;
					    u_xlat6 = u_xlat14 * u_xlat15.zzww + u_xlat6;
					    u_xlat8.xy = u_xlat13.zw;
					    u_xlat8.z = u_xlat10.x;
					    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat13.z = u_xlat10.y;
					    u_xlat14.y = dot(u_xlat13.xyz, u_xlat13.xyz);
					    u_xlat15.xy = u_xlat6.xy;
					    u_xlat15.z = u_xlat10.w;
					    u_xlat14.z = dot(u_xlat15.xyz, u_xlat15.xyz);
					    u_xlat10.xy = u_xlat6.zw;
					    u_xlat14.w = dot(u_xlat10.xyz, u_xlat10.xyz);
					    u_xlat6 = (-u_xlat14) * vec4(0.853734732, 0.853734732, 0.853734732, 0.853734732) + vec4(1.79284286, 1.79284286, 1.79284286, 1.79284286);
					    u_xlat8.xyz = u_xlat6.xxx * u_xlat8.xyz;
					    u_xlat13.xyz = u_xlat6.yyy * u_xlat13.xyz;
					    u_xlat6.xyz = u_xlat6.zzz * u_xlat15.xyz;
					    u_xlat10.xyz = u_xlat6.www * u_xlat10.xyz;
					    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat14.y = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat14.z = dot(u_xlat11.xyz, u_xlat11.xyz);
					    u_xlat14.w = dot(u_xlat12.xyz, u_xlat12.xyz);
					    u_xlat14 = (-u_xlat14) + vec4(0.600000024, 0.600000024, 0.600000024, 0.600000024);
					    u_xlat14 = max(u_xlat14, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat14 = u_xlat14 * u_xlat14;
					    u_xlat14 = u_xlat14 * u_xlat14;
					    u_xlat7.x = dot(u_xlat7.xyz, u_xlat8.xyz);
					    u_xlat7.y = dot(u_xlat9.xyz, u_xlat13.xyz);
					    u_xlat7.z = dot(u_xlat11.xyz, u_xlat6.xyz);
					    u_xlat7.w = dot(u_xlat12.xyz, u_xlat10.xyz);
					    u_xlat2.x = dot(u_xlat14, u_xlat7);
					    u_xlat2.x = u_xlat2.x * 42.0;
					    u_xlat4.yz = u_xlat0.yz;
					    u_xlat6.xyz = u_xlat4.xyz * vec3(_nmaptile);
					    u_xlat19 = dot(u_xlat6.xyz, vec3(0.333333343, 0.333333343, 0.333333343));
					    u_xlat6.xyz = u_xlat4.xyz * vec3(_nmaptile) + vec3(u_xlat19);
					    u_xlat6.xyz = floor(u_xlat6.xyz);
					    u_xlat7.xyz = u_xlat4.xyz * vec3(_nmaptile) + (-u_xlat6.xyz);
					    u_xlat19 = dot(u_xlat6.xyz, vec3(0.166666672, 0.166666672, 0.166666672));
					    u_xlat7.xyz = vec3(u_xlat19) + u_xlat7.xyz;
					    u_xlatb8.xyz = greaterThanEqual(u_xlat7.zxyz, u_xlat7.xyzx).xyz;
					    u_xlat9.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0), vec3(u_xlatb8.yzx));
					    u_xlat8.x = (u_xlatb8.x) ? float(0.0) : float(1.0);
					    u_xlat8.y = (u_xlatb8.y) ? float(0.0) : float(1.0);
					    u_xlat8.z = (u_xlatb8.z) ? float(0.0) : float(1.0);
					    u_xlat10.xyz = min(u_xlat8.xyz, u_xlat9.xyz);
					    u_xlat8.xyz = max(u_xlat8.yzx, u_xlat9.yzx);
					    u_xlat9.xyz = u_xlat7.xyz + (-u_xlat10.xyz);
					    u_xlat9.xyz = u_xlat9.xyz + vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlat11.xyz = u_xlat7.xyz + (-u_xlat8.zxy);
					    u_xlat11.xyz = u_xlat11.xyz + vec3(0.333333343, 0.333333343, 0.333333343);
					    u_xlat12.xyz = u_xlat7.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat13.xyz = u_xlat6.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat13.xyz = floor(u_xlat13.xyz);
					    u_xlat6.xyz = (-u_xlat13.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat6.xyz;
					    u_xlat13.x = float(0.0);
					    u_xlat13.w = float(1.0);
					    u_xlat13.y = u_xlat10.z;
					    u_xlat13.z = u_xlat8.y;
					    u_xlat13 = u_xlat6.zzzz + u_xlat13;
					    u_xlat14 = u_xlat13 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat13 = u_xlat13 * u_xlat14;
					    u_xlat14 = u_xlat13 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat14 = floor(u_xlat14);
					    u_xlat13 = (-u_xlat14) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat13;
					    u_xlat13 = u_xlat6.yyyy + u_xlat13;
					    u_xlat14.x = float(0.0);
					    u_xlat14.w = float(1.0);
					    u_xlat14.y = u_xlat10.y;
					    u_xlat14.z = u_xlat8.x;
					    u_xlat13 = u_xlat13 + u_xlat14;
					    u_xlat14 = u_xlat13 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat13 = u_xlat13 * u_xlat14;
					    u_xlat14 = u_xlat13 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat14 = floor(u_xlat14);
					    u_xlat13 = (-u_xlat14) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat13;
					    u_xlat6 = u_xlat6.xxxx + u_xlat13;
					    u_xlat8.x = float(0.0);
					    u_xlat8.w = float(1.0);
					    u_xlat8.y = u_xlat10.x;
					    u_xlat6 = u_xlat6 + u_xlat8;
					    u_xlat8 = u_xlat6 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat6 = u_xlat6 * u_xlat8;
					    u_xlat8 = u_xlat6 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat8 = floor(u_xlat8);
					    u_xlat6 = (-u_xlat8) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat6;
					    u_xlat8 = u_xlat6 * vec4(0.0204081628, 0.0204081628, 0.0204081628, 0.0204081628);
					    u_xlat8 = floor(u_xlat8);
					    u_xlat6 = (-u_xlat8) * vec4(49.0, 49.0, 49.0, 49.0) + u_xlat6;
					    u_xlat8 = u_xlat6 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149);
					    u_xlat8 = floor(u_xlat8);
					    u_xlat6 = (-u_xlat8) * vec4(7.0, 7.0, 7.0, 7.0) + u_xlat6;
					    u_xlat8 = u_xlat8 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat8 = u_xlat8 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat6 = u_xlat6 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat6 = u_xlat6.xzyw * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat10 = -abs(u_xlat8) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat10 = -abs(u_xlat6.xzwy) + u_xlat10.xywz;
					    u_xlat13.xz = floor(u_xlat8.xy);
					    u_xlat13.yw = floor(u_xlat6.xz);
					    u_xlat13 = u_xlat13 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat14.xz = floor(u_xlat8.zw);
					    u_xlat14.yw = floor(u_xlat6.yw);
					    u_xlat14 = u_xlat14 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlatb15 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat10.xywz);
					    u_xlat15.x = (u_xlatb15.x) ? float(-1.0) : float(-0.0);
					    u_xlat15.y = (u_xlatb15.y) ? float(-1.0) : float(-0.0);
					    u_xlat15.z = (u_xlatb15.z) ? float(-1.0) : float(-0.0);
					    u_xlat15.w = (u_xlatb15.w) ? float(-1.0) : float(-0.0);
					    u_xlat16.xz = u_xlat8.xy;
					    u_xlat16.yw = u_xlat6.xz;
					    u_xlat13 = u_xlat13.zwxy * u_xlat15.yyxx + u_xlat16.zwxy;
					    u_xlat6.xz = u_xlat8.zw;
					    u_xlat6 = u_xlat14 * u_xlat15.zzww + u_xlat6;
					    u_xlat8.xy = u_xlat13.zw;
					    u_xlat8.z = u_xlat10.x;
					    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat13.z = u_xlat10.y;
					    u_xlat14.y = dot(u_xlat13.xyz, u_xlat13.xyz);
					    u_xlat15.xy = u_xlat6.xy;
					    u_xlat15.z = u_xlat10.w;
					    u_xlat14.z = dot(u_xlat15.xyz, u_xlat15.xyz);
					    u_xlat10.xy = u_xlat6.zw;
					    u_xlat14.w = dot(u_xlat10.xyz, u_xlat10.xyz);
					    u_xlat6 = (-u_xlat14) * vec4(0.853734732, 0.853734732, 0.853734732, 0.853734732) + vec4(1.79284286, 1.79284286, 1.79284286, 1.79284286);
					    u_xlat8.xyz = u_xlat6.xxx * u_xlat8.xyz;
					    u_xlat13.xyz = u_xlat6.yyy * u_xlat13.xyz;
					    u_xlat6.xyz = u_xlat6.zzz * u_xlat15.xyz;
					    u_xlat10.xyz = u_xlat6.www * u_xlat10.xyz;
					    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat14.y = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat14.z = dot(u_xlat11.xyz, u_xlat11.xyz);
					    u_xlat14.w = dot(u_xlat12.xyz, u_xlat12.xyz);
					    u_xlat14 = (-u_xlat14) + vec4(0.600000024, 0.600000024, 0.600000024, 0.600000024);
					    u_xlat14 = max(u_xlat14, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat14 = u_xlat14 * u_xlat14;
					    u_xlat14 = u_xlat14 * u_xlat14;
					    u_xlat7.x = dot(u_xlat7.xyz, u_xlat8.xyz);
					    u_xlat7.y = dot(u_xlat9.xyz, u_xlat13.xyz);
					    u_xlat7.z = dot(u_xlat11.xyz, u_xlat6.xyz);
					    u_xlat7.w = dot(u_xlat12.xyz, u_xlat10.xyz);
					    u_xlat19 = dot(u_xlat14, u_xlat7);
					    u_xlat6.xyz = (-_Time.yyy) * vec3(vec3(_dspeed, _dspeed, _dspeed)) + u_xlat0.xyz;
					    u_xlat6.xyz = u_xlat6.xyz + vec3(25.4580002, 25.2110004, 25.7119999);
					    u_xlat4.w = u_xlat6.x;
					    u_xlat7.xyz = u_xlat4.wyz * vec3(_nmaptile);
					    u_xlat34.x = dot(u_xlat7.xyz, vec3(0.333333343, 0.333333343, 0.333333343));
					    u_xlat7.xyz = u_xlat4.wyz * vec3(_nmaptile) + u_xlat34.xxx;
					    u_xlat7.xyz = floor(u_xlat7.xyz);
					    u_xlat4.xyz = u_xlat4.wyz * vec3(_nmaptile) + (-u_xlat7.xyz);
					    u_xlat34.x = dot(u_xlat7.xyz, vec3(0.166666672, 0.166666672, 0.166666672));
					    u_xlat4.xyz = u_xlat34.xxx + u_xlat4.xyz;
					    u_xlatb8.xyz = greaterThanEqual(u_xlat4.zxyz, u_xlat4.xyzx).xyz;
					    u_xlat9.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0), vec3(u_xlatb8.yzx));
					    u_xlat8.x = (u_xlatb8.x) ? float(0.0) : float(1.0);
					    u_xlat8.y = (u_xlatb8.y) ? float(0.0) : float(1.0);
					    u_xlat8.z = (u_xlatb8.z) ? float(0.0) : float(1.0);
					    u_xlat10.xyz = min(u_xlat8.xyz, u_xlat9.xyz);
					    u_xlat8.xyz = max(u_xlat8.yzx, u_xlat9.yzx);
					    u_xlat9.xyz = u_xlat4.xyz + (-u_xlat10.xyz);
					    u_xlat9.xyz = u_xlat9.xyz + vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlat11.xyz = u_xlat4.xyz + (-u_xlat8.zxy);
					    u_xlat11.xyz = u_xlat11.xyz + vec3(0.333333343, 0.333333343, 0.333333343);
					    u_xlat12.xyz = u_xlat4.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat13.xyz = u_xlat7.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat13.xyz = floor(u_xlat13.xyz);
					    u_xlat7.xyz = (-u_xlat13.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat7.xyz;
					    u_xlat13.x = float(0.0);
					    u_xlat13.w = float(1.0);
					    u_xlat13.y = u_xlat10.z;
					    u_xlat13.z = u_xlat8.y;
					    u_xlat13 = u_xlat7.zzzz + u_xlat13;
					    u_xlat14 = u_xlat13 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat13 = u_xlat13 * u_xlat14;
					    u_xlat14 = u_xlat13 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat14 = floor(u_xlat14);
					    u_xlat13 = (-u_xlat14) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat13;
					    u_xlat13 = u_xlat7.yyyy + u_xlat13;
					    u_xlat14.x = float(0.0);
					    u_xlat14.w = float(1.0);
					    u_xlat14.y = u_xlat10.y;
					    u_xlat14.z = u_xlat8.x;
					    u_xlat13 = u_xlat13 + u_xlat14;
					    u_xlat14 = u_xlat13 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat13 = u_xlat13 * u_xlat14;
					    u_xlat14 = u_xlat13 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat14 = floor(u_xlat14);
					    u_xlat13 = (-u_xlat14) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat13;
					    u_xlat7 = u_xlat7.xxxx + u_xlat13;
					    u_xlat8.x = float(0.0);
					    u_xlat8.w = float(1.0);
					    u_xlat8.y = u_xlat10.x;
					    u_xlat7 = u_xlat7 + u_xlat8;
					    u_xlat8 = u_xlat7 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat7 = u_xlat7 * u_xlat8;
					    u_xlat8 = u_xlat7 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat8 = floor(u_xlat8);
					    u_xlat7 = (-u_xlat8) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat7;
					    u_xlat8 = u_xlat7 * vec4(0.0204081628, 0.0204081628, 0.0204081628, 0.0204081628);
					    u_xlat8 = floor(u_xlat8);
					    u_xlat7 = (-u_xlat8) * vec4(49.0, 49.0, 49.0, 49.0) + u_xlat7;
					    u_xlat8 = u_xlat7 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149);
					    u_xlat8 = floor(u_xlat8);
					    u_xlat7 = (-u_xlat8) * vec4(7.0, 7.0, 7.0, 7.0) + u_xlat7;
					    u_xlat8 = u_xlat8 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat8 = u_xlat8 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat7 = u_xlat7 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat7 = u_xlat7.xzyw * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat10 = -abs(u_xlat8) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat10 = -abs(u_xlat7.xzwy) + u_xlat10.xywz;
					    u_xlat13.xz = floor(u_xlat8.xy);
					    u_xlat13.yw = floor(u_xlat7.xz);
					    u_xlat13 = u_xlat13 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat14.xz = floor(u_xlat8.zw);
					    u_xlat14.yw = floor(u_xlat7.yw);
					    u_xlat14 = u_xlat14 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlatb15 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat10.xywz);
					    u_xlat15.x = (u_xlatb15.x) ? float(-1.0) : float(-0.0);
					    u_xlat15.y = (u_xlatb15.y) ? float(-1.0) : float(-0.0);
					    u_xlat15.z = (u_xlatb15.z) ? float(-1.0) : float(-0.0);
					    u_xlat15.w = (u_xlatb15.w) ? float(-1.0) : float(-0.0);
					    u_xlat16.xz = u_xlat8.xy;
					    u_xlat16.yw = u_xlat7.xz;
					    u_xlat13 = u_xlat13.zwxy * u_xlat15.yyxx + u_xlat16.zwxy;
					    u_xlat7.xz = u_xlat8.zw;
					    u_xlat7 = u_xlat14 * u_xlat15.zzww + u_xlat7;
					    u_xlat8.xy = u_xlat13.zw;
					    u_xlat8.z = u_xlat10.x;
					    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat13.z = u_xlat10.y;
					    u_xlat14.y = dot(u_xlat13.xyz, u_xlat13.xyz);
					    u_xlat15.xy = u_xlat7.xy;
					    u_xlat15.z = u_xlat10.w;
					    u_xlat14.z = dot(u_xlat15.xyz, u_xlat15.xyz);
					    u_xlat10.xy = u_xlat7.zw;
					    u_xlat14.w = dot(u_xlat10.xyz, u_xlat10.xyz);
					    u_xlat7 = (-u_xlat14) * vec4(0.853734732, 0.853734732, 0.853734732, 0.853734732) + vec4(1.79284286, 1.79284286, 1.79284286, 1.79284286);
					    u_xlat8.xyz = u_xlat7.xxx * u_xlat8.xyz;
					    u_xlat13.xyz = u_xlat7.yyy * u_xlat13.xyz;
					    u_xlat7.xyz = u_xlat7.zzz * u_xlat15.xyz;
					    u_xlat10.xyz = u_xlat7.www * u_xlat10.xyz;
					    u_xlat14.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat14.y = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat14.z = dot(u_xlat11.xyz, u_xlat11.xyz);
					    u_xlat14.w = dot(u_xlat12.xyz, u_xlat12.xyz);
					    u_xlat14 = (-u_xlat14) + vec4(0.600000024, 0.600000024, 0.600000024, 0.600000024);
					    u_xlat14 = max(u_xlat14, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat14 = u_xlat14 * u_xlat14;
					    u_xlat14 = u_xlat14 * u_xlat14;
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat8.xyz);
					    u_xlat4.y = dot(u_xlat9.xyz, u_xlat13.xyz);
					    u_xlat4.z = dot(u_xlat11.xyz, u_xlat7.xyz);
					    u_xlat4.w = dot(u_xlat12.xyz, u_xlat10.xyz);
					    u_xlat34.x = dot(u_xlat14, u_xlat4);
					    u_xlat5.w = u_xlat6.y;
					    u_xlat4.xyz = u_xlat5.xwz * vec3(_nmaptile);
					    u_xlat3.x = dot(u_xlat4.xyz, vec3(0.333333343, 0.333333343, 0.333333343));
					    u_xlat4.xyz = u_xlat5.xwz * vec3(_nmaptile) + u_xlat3.xxx;
					    u_xlat4.xyz = floor(u_xlat4.xyz);
					    u_xlat5.xyz = u_xlat5.xwz * vec3(_nmaptile) + (-u_xlat4.xyz);
					    u_xlat3.x = dot(u_xlat4.xyz, vec3(0.166666672, 0.166666672, 0.166666672));
					    u_xlat5.xyz = u_xlat3.xxx + u_xlat5.xyz;
					    u_xlatb7.xyz = greaterThanEqual(u_xlat5.zxyz, u_xlat5.xyzx).xyz;
					    u_xlat8.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0), vec3(u_xlatb7.yzx));
					    u_xlat7.x = (u_xlatb7.x) ? float(0.0) : float(1.0);
					    u_xlat7.y = (u_xlatb7.y) ? float(0.0) : float(1.0);
					    u_xlat7.z = (u_xlatb7.z) ? float(0.0) : float(1.0);
					    u_xlat9.xyz = min(u_xlat7.xyz, u_xlat8.xyz);
					    u_xlat7.xyz = max(u_xlat7.yzx, u_xlat8.yzx);
					    u_xlat8.xyz = u_xlat5.xyz + (-u_xlat9.xyz);
					    u_xlat8.xyz = u_xlat8.xyz + vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlat10.xyz = u_xlat5.xyz + (-u_xlat7.zxy);
					    u_xlat10.xyz = u_xlat10.xyz + vec3(0.333333343, 0.333333343, 0.333333343);
					    u_xlat11.xyz = u_xlat5.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat12.xyz = u_xlat4.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat12.xyz = floor(u_xlat12.xyz);
					    u_xlat4.xyz = (-u_xlat12.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat4.xyz;
					    u_xlat12.x = float(0.0);
					    u_xlat12.w = float(1.0);
					    u_xlat12.y = u_xlat9.z;
					    u_xlat12.z = u_xlat7.y;
					    u_xlat12 = u_xlat4.zzzz + u_xlat12;
					    u_xlat13 = u_xlat12 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat12 = u_xlat12 * u_xlat13;
					    u_xlat13 = u_xlat12 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat13 = floor(u_xlat13);
					    u_xlat12 = (-u_xlat13) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat12;
					    u_xlat12 = u_xlat4.yyyy + u_xlat12;
					    u_xlat13.x = float(0.0);
					    u_xlat13.w = float(1.0);
					    u_xlat13.y = u_xlat9.y;
					    u_xlat13.z = u_xlat7.x;
					    u_xlat12 = u_xlat12 + u_xlat13;
					    u_xlat13 = u_xlat12 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat12 = u_xlat12 * u_xlat13;
					    u_xlat13 = u_xlat12 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat13 = floor(u_xlat13);
					    u_xlat12 = (-u_xlat13) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat12;
					    u_xlat4 = u_xlat4.xxxx + u_xlat12;
					    u_xlat7.x = float(0.0);
					    u_xlat7.w = float(1.0);
					    u_xlat7.y = u_xlat9.x;
					    u_xlat4 = u_xlat4 + u_xlat7;
					    u_xlat7 = u_xlat4 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat4 = u_xlat4 * u_xlat7;
					    u_xlat7 = u_xlat4 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat7 = floor(u_xlat7);
					    u_xlat4 = (-u_xlat7) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat4;
					    u_xlat7 = u_xlat4 * vec4(0.0204081628, 0.0204081628, 0.0204081628, 0.0204081628);
					    u_xlat7 = floor(u_xlat7);
					    u_xlat4 = (-u_xlat7) * vec4(49.0, 49.0, 49.0, 49.0) + u_xlat4;
					    u_xlat7 = u_xlat4 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149);
					    u_xlat7 = floor(u_xlat7);
					    u_xlat4 = (-u_xlat7) * vec4(7.0, 7.0, 7.0, 7.0) + u_xlat4;
					    u_xlat7 = u_xlat7 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat7 = u_xlat7 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat4 = u_xlat4 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat4 = u_xlat4.xzyw * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat9 = -abs(u_xlat7) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat9 = -abs(u_xlat4.xzwy) + u_xlat9.xywz;
					    u_xlat12.xz = floor(u_xlat7.xy);
					    u_xlat12.yw = floor(u_xlat4.xz);
					    u_xlat12 = u_xlat12 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat13.xz = floor(u_xlat7.zw);
					    u_xlat13.yw = floor(u_xlat4.yw);
					    u_xlat13 = u_xlat13 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlatb14 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xywz);
					    u_xlat14.x = (u_xlatb14.x) ? float(-1.0) : float(-0.0);
					    u_xlat14.y = (u_xlatb14.y) ? float(-1.0) : float(-0.0);
					    u_xlat14.z = (u_xlatb14.z) ? float(-1.0) : float(-0.0);
					    u_xlat14.w = (u_xlatb14.w) ? float(-1.0) : float(-0.0);
					    u_xlat15.xz = u_xlat7.xy;
					    u_xlat15.yw = u_xlat4.xz;
					    u_xlat12 = u_xlat12.zwxy * u_xlat14.yyxx + u_xlat15.zwxy;
					    u_xlat4.xz = u_xlat7.zw;
					    u_xlat4 = u_xlat13 * u_xlat14.zzww + u_xlat4;
					    u_xlat7.xy = u_xlat12.zw;
					    u_xlat7.z = u_xlat9.x;
					    u_xlat13.x = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat12.z = u_xlat9.y;
					    u_xlat13.y = dot(u_xlat12.xyz, u_xlat12.xyz);
					    u_xlat14.xy = u_xlat4.xy;
					    u_xlat14.z = u_xlat9.w;
					    u_xlat13.z = dot(u_xlat14.xyz, u_xlat14.xyz);
					    u_xlat9.xy = u_xlat4.zw;
					    u_xlat13.w = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat4 = (-u_xlat13) * vec4(0.853734732, 0.853734732, 0.853734732, 0.853734732) + vec4(1.79284286, 1.79284286, 1.79284286, 1.79284286);
					    u_xlat7.xyz = u_xlat4.xxx * u_xlat7.xyz;
					    u_xlat12.xyz = u_xlat4.yyy * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat4.zzz * u_xlat14.xyz;
					    u_xlat9.xyz = u_xlat4.www * u_xlat9.xyz;
					    u_xlat13.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlat13.y = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat13.z = dot(u_xlat10.xyz, u_xlat10.xyz);
					    u_xlat13.w = dot(u_xlat11.xyz, u_xlat11.xyz);
					    u_xlat13 = (-u_xlat13) + vec4(0.600000024, 0.600000024, 0.600000024, 0.600000024);
					    u_xlat13 = max(u_xlat13, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat13 = u_xlat13 * u_xlat13;
					    u_xlat13 = u_xlat13 * u_xlat13;
					    u_xlat5.x = dot(u_xlat5.xyz, u_xlat7.xyz);
					    u_xlat5.y = dot(u_xlat8.xyz, u_xlat12.xyz);
					    u_xlat5.z = dot(u_xlat10.xyz, u_xlat4.xyz);
					    u_xlat5.w = dot(u_xlat11.xyz, u_xlat9.xyz);
					    u_xlat3.x = dot(u_xlat13, u_xlat5);
					    u_xlat6.xy = u_xlat0.xy;
					    u_xlat4.xyz = u_xlat6.xyz * vec3(_nmaptile);
					    u_xlat0.x = dot(u_xlat4.xyz, vec3(0.333333343, 0.333333343, 0.333333343));
					    u_xlat4.xyz = u_xlat6.xyz * vec3(_nmaptile) + u_xlat0.xxx;
					    u_xlat4.xyz = floor(u_xlat4.xyz);
					    u_xlat5.xyz = u_xlat6.xyz * vec3(_nmaptile) + (-u_xlat4.xyz);
					    u_xlat0.x = dot(u_xlat4.xyz, vec3(0.166666672, 0.166666672, 0.166666672));
					    u_xlat5.xyz = u_xlat0.xxx + u_xlat5.xyz;
					    u_xlatb6.xyz = greaterThanEqual(u_xlat5.zxyz, u_xlat5.xyzx).xyz;
					    u_xlat7.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0), vec3(u_xlatb6.yzx));
					    u_xlat6.x = (u_xlatb6.x) ? float(0.0) : float(1.0);
					    u_xlat6.y = (u_xlatb6.y) ? float(0.0) : float(1.0);
					    u_xlat6.z = (u_xlatb6.z) ? float(0.0) : float(1.0);
					    u_xlat8.xyz = min(u_xlat6.xyz, u_xlat7.xyz);
					    u_xlat6.xyz = max(u_xlat6.yzx, u_xlat7.yzx);
					    u_xlat7.xyz = u_xlat5.xyz + (-u_xlat8.xyz);
					    u_xlat7.xyz = u_xlat7.xyz + vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlat9.xyz = u_xlat5.xyz + (-u_xlat6.zxy);
					    u_xlat9.xyz = u_xlat9.xyz + vec3(0.333333343, 0.333333343, 0.333333343);
					    u_xlat10.xyz = u_xlat5.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat11.xyz = u_xlat4.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat11.xyz = floor(u_xlat11.xyz);
					    u_xlat4.xyz = (-u_xlat11.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat4.xyz;
					    u_xlat11.x = float(0.0);
					    u_xlat11.w = float(1.0);
					    u_xlat11.y = u_xlat8.z;
					    u_xlat11.z = u_xlat6.y;
					    u_xlat11 = u_xlat4.zzzz + u_xlat11;
					    u_xlat12 = u_xlat11 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat11 = u_xlat11 * u_xlat12;
					    u_xlat12 = u_xlat11 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat12 = floor(u_xlat12);
					    u_xlat11 = (-u_xlat12) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat11;
					    u_xlat11 = u_xlat4.yyyy + u_xlat11;
					    u_xlat12.x = float(0.0);
					    u_xlat12.w = float(1.0);
					    u_xlat12.y = u_xlat8.y;
					    u_xlat12.z = u_xlat6.x;
					    u_xlat11 = u_xlat11 + u_xlat12;
					    u_xlat12 = u_xlat11 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat11 = u_xlat11 * u_xlat12;
					    u_xlat12 = u_xlat11 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat12 = floor(u_xlat12);
					    u_xlat11 = (-u_xlat12) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat11;
					    u_xlat4 = u_xlat4.xxxx + u_xlat11;
					    u_xlat6.x = float(0.0);
					    u_xlat6.w = float(1.0);
					    u_xlat6.y = u_xlat8.x;
					    u_xlat4 = u_xlat4 + u_xlat6;
					    u_xlat6 = u_xlat4 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat4 = u_xlat4 * u_xlat6;
					    u_xlat6 = u_xlat4 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat6 = floor(u_xlat6);
					    u_xlat4 = (-u_xlat6) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat4;
					    u_xlat6 = u_xlat4 * vec4(0.0204081628, 0.0204081628, 0.0204081628, 0.0204081628);
					    u_xlat6 = floor(u_xlat6);
					    u_xlat4 = (-u_xlat6) * vec4(49.0, 49.0, 49.0, 49.0) + u_xlat4;
					    u_xlat6 = u_xlat4 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149);
					    u_xlat6 = floor(u_xlat6);
					    u_xlat4 = (-u_xlat6) * vec4(7.0, 7.0, 7.0, 7.0) + u_xlat4;
					    u_xlat6 = u_xlat6 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat6 = u_xlat6 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat4 = u_xlat4 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat4 = u_xlat4.xzyw * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat8 = -abs(u_xlat6) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat8 = -abs(u_xlat4.xzwy) + u_xlat8.xywz;
					    u_xlat11.xz = floor(u_xlat6.xy);
					    u_xlat11.yw = floor(u_xlat4.xz);
					    u_xlat11 = u_xlat11 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat12.xz = floor(u_xlat6.zw);
					    u_xlat12.yw = floor(u_xlat4.yw);
					    u_xlat12 = u_xlat12 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlatb13 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xywz);
					    u_xlat13.x = (u_xlatb13.x) ? float(-1.0) : float(-0.0);
					    u_xlat13.y = (u_xlatb13.y) ? float(-1.0) : float(-0.0);
					    u_xlat13.z = (u_xlatb13.z) ? float(-1.0) : float(-0.0);
					    u_xlat13.w = (u_xlatb13.w) ? float(-1.0) : float(-0.0);
					    u_xlat14.xz = u_xlat6.xy;
					    u_xlat14.yw = u_xlat4.xz;
					    u_xlat11 = u_xlat11.zwxy * u_xlat13.yyxx + u_xlat14.zwxy;
					    u_xlat4.xz = u_xlat6.zw;
					    u_xlat4 = u_xlat12 * u_xlat13.zzww + u_xlat4;
					    u_xlat6.xy = u_xlat11.zw;
					    u_xlat6.z = u_xlat8.x;
					    u_xlat12.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat11.z = u_xlat8.y;
					    u_xlat12.y = dot(u_xlat11.xyz, u_xlat11.xyz);
					    u_xlat13.xy = u_xlat4.xy;
					    u_xlat13.z = u_xlat8.w;
					    u_xlat12.z = dot(u_xlat13.xyz, u_xlat13.xyz);
					    u_xlat8.xy = u_xlat4.zw;
					    u_xlat12.w = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat4 = (-u_xlat12) * vec4(0.853734732, 0.853734732, 0.853734732, 0.853734732) + vec4(1.79284286, 1.79284286, 1.79284286, 1.79284286);
					    u_xlat6.xyz = u_xlat4.xxx * u_xlat6.xyz;
					    u_xlat11.xyz = u_xlat4.yyy * u_xlat11.xyz;
					    u_xlat4.xyz = u_xlat4.zzz * u_xlat13.xyz;
					    u_xlat8.xyz = u_xlat4.www * u_xlat8.xyz;
					    u_xlat12.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlat12.y = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat12.z = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat12.w = dot(u_xlat10.xyz, u_xlat10.xyz);
					    u_xlat12 = (-u_xlat12) + vec4(0.600000024, 0.600000024, 0.600000024, 0.600000024);
					    u_xlat12 = max(u_xlat12, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat5.x = dot(u_xlat5.xyz, u_xlat6.xyz);
					    u_xlat5.y = dot(u_xlat7.xyz, u_xlat11.xyz);
					    u_xlat5.z = dot(u_xlat9.xyz, u_xlat4.xyz);
					    u_xlat5.w = dot(u_xlat10.xyz, u_xlat8.xyz);
					    u_xlat0.x = dot(u_xlat12, u_xlat5);
					    u_xlat17.x = u_xlat51 * 42.0 + u_xlat2.x;
					    u_xlat17.x = u_xlat19 * 42.0 + u_xlat17.x;
					    u_xlat17.x = u_xlat34.x * 42.0 + u_xlat17.x;
					    u_xlat17.x = u_xlat3.x * 42.0 + u_xlat17.x;
					    u_xlat17.y = u_xlat0.x * 42.0 + u_xlat17.x;
					    u_xlat17.x = u_xlat17.y * u_xlat17.y;
					    u_xlat0.xy = u_xlat17.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat35.xx * u_xlat0.xy;
					    u_xlat34.x = (-_Zoom) + 1.0;
					    u_xlat0.yz = u_xlat0.xy * u_xlat34.xx + u_xlat3.yz;
					    u_xlat51 = fract((-_woffset));
					    u_xlat51 = log2(u_xlat51);
					    u_xlat51 = u_xlat51 * 0.0500000007;
					    u_xlat51 = exp2(u_xlat51);
					    u_xlat51 = u_xlat51 * vs_TEXCOORD1;
					    u_xlat51 = u_xlat51 * _wpower;
					    u_xlat35.x = float(_wcntr);
					    u_xlat52 = u_xlat52 * u_xlat51 + (-u_xlat51);
					    u_xlat51 = u_xlat35.x * u_xlat52 + u_xlat51;
					    u_xlat2.xy = (-u_xlat1.xy) + u_xlat36.xy;
					    u_xlat1.yz = u_xlat35.xx * u_xlat2.xy + u_xlat1.xy;
					    u_xlat52 = _ScreenParams.x / _ScreenParams.y;
					    u_xlat1.x = u_xlat52 * u_xlat1.y;
					    u_xlat18.x = _wspeed * _Time.y;
					    u_xlat18.x = u_xlat18.x * 0.00999999978 + _woffset;
					    u_xlat2.x = floor(u_xlat18.x);
					    u_xlat18.x = u_xlat18.x + (-u_xlat2.x);
					    u_xlat0.x = u_xlat0.y * u_xlat52;
					    u_xlat2 = u_xlat0.xzyz + (-u_xlat1.xzxz);
					    u_xlat0.x = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlatb1 = 0.0<u_xlat18.x;
					    u_xlat35.x = u_xlat18.x + _wz;
					    u_xlatb35 = u_xlat35.x>=u_xlat0.x;
					    u_xlatb1 = u_xlatb35 && u_xlatb1;
					    u_xlat35.x = u_xlat18.x + (-_wz);
					    u_xlatb35 = u_xlat0.x>=u_xlat35.x;
					    u_xlatb1 = u_xlatb35 && u_xlatb1;
					    u_xlat35.x = (-u_xlat18.x) + u_xlat0.x;
					    u_xlat52 = u_xlat35.x * _wx;
					    u_xlat52 = log2(abs(u_xlat52));
					    u_xlat52 = u_xlat52 * _wy;
					    u_xlat52 = exp2(u_xlat52);
					    u_xlat52 = (-u_xlat52) + 1.0;
					    u_xlat35.x = u_xlat52 * u_xlat35.x;
					    u_xlat35.x = u_xlat51 * u_xlat35.x;
					    u_xlat35.x = u_xlat35.x * 0.00999999978;
					    u_xlat52 = dot(u_xlat2.zw, u_xlat2.zw);
					    u_xlat52 = inversesqrt(u_xlat52);
					    u_xlat2.xy = vec2(u_xlat52) * u_xlat2.zw;
					    u_xlat35.xy = u_xlat35.xx * u_xlat2.xy;
					    u_xlat0.x = u_xlat0.x * u_xlat18.x;
					    u_xlat0.x = u_xlat0.x * 80.0;
					    u_xlat51 = (-u_xlat51) * 0.00999999978 + 1.00999999;
					    u_xlat0.x = u_xlat51 * u_xlat0.x;
					    u_xlat0.xw = u_xlat35.xy / u_xlat0.xx;
					    u_xlat0.xw = u_xlat0.xw + u_xlat0.yz;
					    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat0.xw : u_xlat0.yz;
					    u_xlat10_1 = texture(_corpsegp2, u_xlat0.xy);
					    u_xlat34.x = vs_TEXCOORD1 * _egoffset;
					    u_xlat34.x = u_xlat34.x * 0.0199999996;
					    u_xlat2.xy = (-_ScreenParams.zw) + vec2(1.0, 1.0);
					    u_xlat36.xy = u_xlat34.xx * u_xlat2.xy;
					    u_xlat3 = u_xlat36.xyxy * vec4(0.0, 1.0, -1.0, 0.0) + u_xlat0.xyxy;
					    u_xlat10_4 = texture(_corpsegp2, u_xlat3.xy);
					    u_xlat10_3 = texture(_corpsegp2, u_xlat3.zw);
					    u_xlat16_5.xy = u_xlat10_3.xy + u_xlat10_4.xy;
					    u_xlat6 = u_xlat36.xyxy * vec4(-1.0, 1.0, 1.0, 0.0) + u_xlat0.xyxy;
					    u_xlat10_7 = texture(_corpsegp2, u_xlat6.xy);
					    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat10_7.xy;
					    u_xlat39.xy = (-u_xlat2.xy) * u_xlat34.xx + u_xlat0.xy;
					    u_xlat10_8 = texture(_corpsegp2, u_xlat39.xy);
					    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat10_8.xy;
					    u_xlat10_6 = texture(_corpsegp2, u_xlat6.zw);
					    u_xlat16_5.xy = u_xlat16_5.xy + (-u_xlat10_6.xy);
					    u_xlat9 = u_xlat36.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + u_xlat0.xyxy;
					    u_xlat10_10 = texture(_corpsegp2, u_xlat9.xy);
					    u_xlat16_36.xy = u_xlat16_5.xy + (-u_xlat10_10.xy);
					    u_xlat10_5 = texture(_corpsegp2, u_xlat9.zw);
					    u_xlat16_36.xy = u_xlat16_36.xy + (-u_xlat10_5.xy);
					    u_xlat17.xy = u_xlat2.xy * u_xlat34.xx + u_xlat0.xy;
					    u_xlat10_9 = texture(_corpsegp2, u_xlat17.xy);
					    u_xlat16_17.xy = u_xlat16_36.xy + (-u_xlat10_9.xy);
					    u_xlat16_2 = u_xlat10_4.yzzx + u_xlat10_9.yzzx;
					    u_xlat16_2 = u_xlat10_6.yzzx + u_xlat16_2;
					    u_xlat16_2 = u_xlat10_7.yzzx + u_xlat16_2;
					    u_xlat16_2 = (-u_xlat10_8.yzzx) + u_xlat16_2;
					    u_xlat16_2 = (-u_xlat10_10.yzzx) + u_xlat16_2;
					    u_xlat16_2 = (-u_xlat10_3.yzzx) + u_xlat16_2;
					    u_xlat16_2 = (-u_xlat10_5.yzzx) + u_xlat16_2;
					    u_xlat16_2.xy = u_xlat16_2.xy * u_xlat16_2.xy;
					    u_xlat16_17.xy = u_xlat16_17.xy * u_xlat16_17.xy + u_xlat16_2.xy;
					    u_xlat16_17.xy = u_xlat16_2.zw * u_xlat16_2.zw + u_xlat16_17.xy;
					    u_xlat16_17.x = dot(u_xlat16_17.xy, u_xlat16_17.xy);
					    u_xlat16_17.x = sqrt(u_xlat16_17.x);
					    u_xlat17.x = u_xlat16_17.x * _egpow;
					    u_xlat17.x = u_xlat17.x * 5.0;
					    u_xlat17.xyz = u_xlat17.xxx * _egcol.xyz;
					    u_xlat17.xyz = u_xlat17.xyz * vec3(vs_TEXCOORD1);
					    u_xlat17.xyz = max(u_xlat17.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat17.xyz = min(u_xlat17.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat17.xyz = u_xlat17.xyz + u_xlat10_1.xyz;
					    u_xlat1.x = _HDRMultiplyer + 1.0;
					    u_xlat18.xyz = u_xlat17.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat18.xyz = u_xlat17.xyz * u_xlat18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat18.xyz = u_xlat17.xyz * u_xlat18.xyz;
					    u_xlat18.xyz = max(u_xlat18.xyz, u_xlat18.xyz);
					    u_xlat18.xyz = clamp(u_xlat18.xyz, 0.0, 1.0);
					    u_xlat2.xy = vec2(vs_TEXCOORD1) * vec2(_HDR, _grsc);
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat18.xyz + (-u_xlat17.xyz);
					    u_xlat1.xyz = u_xlat2.xxx * u_xlat1.xyz + u_xlat17.xyz;
					    u_xlat3.x = _Contrast * vs_TEXCOORD1 + 1.0;
					    u_xlat3.y = u_xlat3.x * -0.5 + 0.5;
					    u_xlat1.w = 1.0;
					    u_xlat4.x = dot(u_xlat3.xy, u_xlat1.xw);
					    u_xlat4.y = dot(u_xlat3.xy, u_xlat1.yw);
					    u_xlat4.z = dot(u_xlat3.xy, u_xlat1.zw);
					    u_xlat17.x = dot(u_xlat4.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat34.xy = vec2(_threshold, _softness) + vec2(-1.0, -1.0);
					    u_xlat17.yz = vec2(vs_TEXCOORD1) * u_xlat34.xy + vec2(1.0, 1.0);
					    u_xlat1.xyz = _brightColor.xyz + _darkColor.xyz;
					    u_xlat2.xzw = u_xlat1.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlatb52 = u_xlat17.x>=u_xlat17.y;
					    u_xlat3.x = (-u_xlat17.y) + u_xlat17.x;
					    u_xlat20.x = float(1.0) / u_xlat17.z;
					    u_xlat3.x = u_xlat20.x * u_xlat3.x;
					    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					    u_xlat20.x = u_xlat3.x * -2.0 + 3.0;
					    u_xlat3.x = u_xlat3.x * u_xlat3.x;
					    u_xlat3.x = u_xlat3.x * u_xlat20.x;
					    u_xlat20.xyz = (-u_xlat1.xyz) * vec3(0.5, 0.5, 0.5) + _brightColor.xyz;
					    u_xlat2.xzw = u_xlat3.xxx * u_xlat20.xyz + u_xlat2.xzw;
					    u_xlat51 = (-u_xlat17.z) + u_xlat17.y;
					    u_xlat17.xy = (-vec2(u_xlat51)) + u_xlat17.xy;
					    u_xlat34.x = float(1.0) / u_xlat17.y;
					    u_xlat17.x = u_xlat34.x * u_xlat17.x;
					    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
					    u_xlat34.x = u_xlat17.x * -2.0 + 3.0;
					    u_xlat17.x = u_xlat17.x * u_xlat17.x;
					    u_xlat17.x = u_xlat17.x * u_xlat34.x;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + (-_darkColor.xyz);
					    u_xlat17.xyz = u_xlat17.xxx * u_xlat1.xyz + _darkColor.xyz;
					    u_xlat17.xyz = (bool(u_xlatb52)) ? u_xlat2.xzw : u_xlat17.xyz;
					    u_xlat17.xyz = (-u_xlat4.xyz) + u_xlat17.xyz;
					    u_xlat17.xyz = u_xlat2.yyy * u_xlat17.xyz + u_xlat4.xyz;
					    u_xlat1.xyz = _Colorm.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat1.xyz = vec3(vs_TEXCOORD1) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat17.xyz = u_xlat17.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = _ColorL.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat1.xyz = vec3(vs_TEXCOORD1) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = _ColorR.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat2.xyz = vec3(vs_TEXCOORD1) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = (-u_xlat1.xyz) + u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat17.xyz * u_xlat1.xyz;
					    SV_Target0.w = _Alpha;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" "BLUR_RGB" "HUE_OFF" "WORLD_DISTORTION_ON" "EDGEGLOW_ON" "GIRLSCAM_ON" "ZOOM_SIMPLE" "SHOCKWAVE_ON" "COLOR_GRADING_ON" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _Alpha;
						float _Zoom;
						float _Dir;
						float _woffset;
						float _wpower;
						float _wspeed;
						int _wcntr;
						float _wx;
						float _wy;
						float _wz;
						float _Girlscam;
						float _Girlscamcount;
						int _Moving;
						float _nmapscale;
						float _nmaptile;
						float _dspeed;
						float _egoffset;
						float _egpow;
						vec4 _egcol;
						float _HDR;
						float _HDRMultiplyer;
						float _Contrast;
						float _grsc;
						vec4 _Colorm;
						vec4 _ColorL;
						vec4 _ColorR;
						vec4 _brightColor;
						vec4 _darkColor;
						float _threshold;
						float _softness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
						vec4 _ScreenParams;
						vec4 unused_1_3[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_2[4];
						mat4x4 unity_StereoCameraProjection[2];
						vec4 unused_3_4[20];
						mat4x4 unity_StereoCameraToWorld[2];
						vec4 unused_3_6[4];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_8;
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_3_10;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _corpsegp2;
					in  vec4 vs_TEXCOORD0;
					in  float vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec2 u_xlat16_2;
					vec4 u_xlat3;
					vec4 u_xlat16_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					bool u_xlatb4;
					vec4 u_xlat5;
					vec4 u_xlat10_5;
					vec4 u_xlat6;
					vec4 u_xlat10_6;
					bvec3 u_xlatb6;
					vec4 u_xlat7;
					vec4 u_xlat10_7;
					bvec3 u_xlatb7;
					vec4 u_xlat8;
					vec4 u_xlat10_8;
					bvec3 u_xlatb8;
					vec4 u_xlat9;
					vec4 u_xlat10_9;
					vec4 u_xlat10;
					vec4 u_xlat10_10;
					vec4 u_xlat11;
					vec4 u_xlat10_11;
					vec4 u_xlat12;
					vec4 u_xlat13;
					bvec4 u_xlatb13;
					vec4 u_xlat14;
					bvec4 u_xlatb14;
					vec4 u_xlat15;
					bvec4 u_xlatb15;
					vec4 u_xlat16;
					vec3 u_xlat17;
					vec2 u_xlat16_17;
					bool u_xlatb17;
					vec3 u_xlat18;
					vec2 u_xlat19;
					bool u_xlatb19;
					vec2 u_xlat20;
					vec2 u_xlat34;
					bool u_xlatb34;
					float u_xlat35;
					float u_xlat36;
					vec2 u_xlat16_37;
					float u_xlat51;
					bool u_xlatb51;
					float u_xlat52;
					bool u_xlatb52;
					float u_xlat53;
					int u_xlati53;
					float u_xlat54;
					void main()
					{
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlatb17 = 0.0!=unity_StereoCameraProjection[u_xlati0 / 4][u_xlati0 % 4].z;
					    u_xlatb34 = 0.0!=unity_StereoCameraProjection[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4].z;
					    u_xlatb17 = u_xlatb34 || u_xlatb17;
					    if(((int(u_xlatb17) * int(0xffffffffu)))!=0){discard;}
					    u_xlat17.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat17.x = inversesqrt(u_xlat17.x);
					    u_xlat1.xyz = u_xlat17.xxx * vs_TEXCOORD2.xyz;
					    u_xlat17.xyz = (-unity_StereoWorldSpaceCameraPos[0].xyz) + unity_StereoWorldSpaceCameraPos[1].xyz;
					    u_xlat2.x = dot(u_xlat17.xyz, u_xlat17.xyz);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat17.xyz = u_xlat17.xyz * u_xlat2.xxx;
					    u_xlat2.xyz = unity_StereoCameraToWorld[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4].xyz + unity_StereoCameraToWorld[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4].xyz;
					    u_xlat3.xyz = unity_StereoWorldSpaceCameraPos[0].xyz + unity_StereoWorldSpaceCameraPos[1].xyz;
					    u_xlat4.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat2.xyz = (-u_xlat3.xyz) * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat53 = dot(u_xlat17.xyz, u_xlat2.xyz);
					    u_xlat17.xyz = (-vec3(u_xlat53)) * u_xlat17.xyz + u_xlat2.xyz;
					    u_xlat2.xyz = (-u_xlat3.xyz) * vec3(0.5, 0.5, 0.5) + unity_ObjectToWorld[3].xyz;
					    u_xlat53 = dot(u_xlat17.xyz, u_xlat17.xyz);
					    u_xlat53 = inversesqrt(u_xlat53);
					    u_xlat3.xyz = u_xlat17.xyz * vec3(u_xlat53);
					    u_xlat53 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat53 = inversesqrt(u_xlat53);
					    u_xlat2.xyz = vec3(u_xlat53) * u_xlat2.xyz;
					    u_xlat2.x = dot(u_xlat3.xyz, u_xlat2.xyz);
					    u_xlatb19 = _Dir<u_xlat2.x;
					    u_xlat2.x = u_xlat2.x + (-_Dir);
					    u_xlat36 = (-_Dir) + 1.0;
					    u_xlat2.x = u_xlat2.x / u_xlat36;
					    u_xlat2.x = u_xlatb19 ? u_xlat2.x : float(0.0);
					    u_xlat19.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat17.xyz = u_xlat17.xyz * vec3(10000.0, 10000.0, 10000.0) + u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat17.yyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4].xwy;
					    u_xlat3.xyz = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4].xwy * u_xlat17.xxx + u_xlat3.xyz;
					    u_xlat17.xyz = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4].xwy * u_xlat17.zzz + u_xlat3.xyz;
					    u_xlat17.xyz = u_xlat17.xyz + unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4].xwy;
					    u_xlat3.xyz = u_xlat17.xyz * vec3(0.5, 0.5, -0.5);
					    u_xlat17.xz = u_xlat3.yy + u_xlat3.xz;
					    u_xlati53 = unity_StereoEyeIndex;
					    u_xlat3.xy = u_xlat17.yy * unity_StereoScaleOffset[u_xlati53].zw;
					    u_xlat17.xz = u_xlat17.xz * unity_StereoScaleOffset[u_xlati53].xy + u_xlat3.xy;
					    u_xlat17.xy = u_xlat17.xz / u_xlat17.yy;
					    u_xlat3.xyz = unity_ObjectToWorld[3].yyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4].xwy;
					    u_xlat3.xyz = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4].xwy * unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4].xwy * unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4].xwy * unity_ObjectToWorld[3].www + u_xlat3.xyz;
					    u_xlat3.xzw = u_xlat3.xyz * vec3(0.5, 0.5, -0.5);
					    u_xlat0.xw = u_xlat3.zz + u_xlat3.xw;
					    u_xlat3.xz = u_xlat3.yy * unity_StereoScaleOffset[u_xlati53].zw;
					    u_xlat0.xw = u_xlat0.xw * unity_StereoScaleOffset[u_xlati53].xy + u_xlat3.xz;
					    u_xlat0.xw = u_xlat0.xw / u_xlat3.yy;
					    u_xlat3.x = vs_TEXCOORD1 * _Zoom;
					    u_xlat20.xy = (-u_xlat19.xy) + u_xlat17.xy;
					    u_xlat3.xz = u_xlat3.xx * u_xlat20.xy + u_xlat19.xy;
					    u_xlat19.xy = vec2(vs_TEXCOORD1) * vec2(_Girlscam, _nmapscale);
					    u_xlat19.x = (-u_xlat19.x) * 0.000500000024 + 0.999899983;
					    u_xlat4.x = float(_Moving);
					    u_xlat4.x = u_xlat4.x * _Time.y;
					    u_xlat4.x = sin(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x + 1.0;
					    u_xlat3.w = u_xlat4.x * 5.0008297e-05 + u_xlat19.x;
					    u_xlat19.x = dot(u_xlat3.zw, vec2(112.989799, 778.232971));
					    u_xlat19.x = sin(u_xlat19.x);
					    u_xlat4.x = u_xlat19.x * 57758.5508;
					    u_xlat4.x = floor(u_xlat4.x);
					    u_xlat19.x = u_xlat19.x * 57758.5508 + (-u_xlat4.x);
					    u_xlat19.x = u_xlat19.x * 2.0 + -1.0;
					    u_xlat3.x = u_xlat3.x;
					    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					    u_xlat54 = (-u_xlat3.w) + 1.0;
					    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
					    u_xlat4.x = u_xlat54 * 0.0500000007 + (-_Girlscamcount);
					    u_xlat4.x = u_xlat4.x + 1.0;
					    u_xlatb4 = abs(u_xlat19.x)>=u_xlat4.x;
					    u_xlat4.x = u_xlatb4 ? 1.0 : float(0.0);
					    u_xlat54 = u_xlat54 * u_xlat4.x;
					    u_xlat19.x = u_xlat19.x * u_xlat54 + u_xlat3.x;
					    u_xlat3.x = floor(u_xlat19.x);
					    u_xlat3.y = u_xlat19.x + (-u_xlat3.x);
					    u_xlat4.xyz = _Time.yyy * vec3(vec3(_dspeed, _dspeed, _dspeed)) + u_xlat1.zyx;
					    u_xlat4.xyz = u_xlat4.zxy + vec3(22.9580002, 27.2350006, 21.7849998);
					    u_xlat1.w = u_xlat4.y;
					    u_xlat5.xyz = u_xlat1.xyw * vec3(_nmaptile);
					    u_xlat19.x = dot(u_xlat5.xyz, vec3(0.333333343, 0.333333343, 0.333333343));
					    u_xlat5.xyz = u_xlat1.xyw * vec3(_nmaptile) + u_xlat19.xxx;
					    u_xlat5.xyz = floor(u_xlat5.xyz);
					    u_xlat6.xyz = u_xlat1.xyw * vec3(_nmaptile) + (-u_xlat5.xyz);
					    u_xlat52 = dot(u_xlat5.xyz, vec3(0.166666672, 0.166666672, 0.166666672));
					    u_xlat6.xyz = vec3(u_xlat52) + u_xlat6.xyz;
					    u_xlatb7.xyz = greaterThanEqual(u_xlat6.zxyz, u_xlat6.xyzx).xyz;
					    u_xlat8.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0), vec3(u_xlatb7.yzx));
					    u_xlat7.x = (u_xlatb7.x) ? float(0.0) : float(1.0);
					    u_xlat7.y = (u_xlatb7.y) ? float(0.0) : float(1.0);
					    u_xlat7.z = (u_xlatb7.z) ? float(0.0) : float(1.0);
					    u_xlat9.xyz = min(u_xlat7.xyz, u_xlat8.xyz);
					    u_xlat7.xyz = max(u_xlat7.yzx, u_xlat8.yzx);
					    u_xlat8.xyz = u_xlat6.xyz + (-u_xlat9.xyz);
					    u_xlat8.xyz = u_xlat8.xyz + vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlat10.xyz = u_xlat6.xyz + (-u_xlat7.zxy);
					    u_xlat10.xyz = u_xlat10.xyz + vec3(0.333333343, 0.333333343, 0.333333343);
					    u_xlat11.xyz = u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat12.xyz = u_xlat5.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat12.xyz = floor(u_xlat12.xyz);
					    u_xlat5.xyz = (-u_xlat12.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat5.xyz;
					    u_xlat12.x = float(0.0);
					    u_xlat12.w = float(1.0);
					    u_xlat12.y = u_xlat9.z;
					    u_xlat12.z = u_xlat7.y;
					    u_xlat12 = u_xlat5.zzzz + u_xlat12;
					    u_xlat13 = u_xlat12 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat12 = u_xlat12 * u_xlat13;
					    u_xlat13 = u_xlat12 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat13 = floor(u_xlat13);
					    u_xlat12 = (-u_xlat13) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat12;
					    u_xlat12 = u_xlat5.yyyy + u_xlat12;
					    u_xlat13.x = float(0.0);
					    u_xlat13.w = float(1.0);
					    u_xlat13.y = u_xlat9.y;
					    u_xlat13.z = u_xlat7.x;
					    u_xlat12 = u_xlat12 + u_xlat13;
					    u_xlat13 = u_xlat12 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat12 = u_xlat12 * u_xlat13;
					    u_xlat13 = u_xlat12 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat13 = floor(u_xlat13);
					    u_xlat12 = (-u_xlat13) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat12;
					    u_xlat5 = u_xlat5.xxxx + u_xlat12;
					    u_xlat7.x = float(0.0);
					    u_xlat7.w = float(1.0);
					    u_xlat7.y = u_xlat9.x;
					    u_xlat5 = u_xlat5 + u_xlat7;
					    u_xlat7 = u_xlat5 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat5 = u_xlat5 * u_xlat7;
					    u_xlat7 = u_xlat5 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat7 = floor(u_xlat7);
					    u_xlat5 = (-u_xlat7) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat5;
					    u_xlat7 = u_xlat5 * vec4(0.0204081628, 0.0204081628, 0.0204081628, 0.0204081628);
					    u_xlat7 = floor(u_xlat7);
					    u_xlat5 = (-u_xlat7) * vec4(49.0, 49.0, 49.0, 49.0) + u_xlat5;
					    u_xlat7 = u_xlat5 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149);
					    u_xlat7 = floor(u_xlat7);
					    u_xlat5 = (-u_xlat7) * vec4(7.0, 7.0, 7.0, 7.0) + u_xlat5;
					    u_xlat7 = u_xlat7 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat7 = u_xlat7 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat5 = u_xlat5 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat5 = u_xlat5.xzyw * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat9 = -abs(u_xlat7) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat9 = -abs(u_xlat5.xzwy) + u_xlat9.xywz;
					    u_xlat12.xz = floor(u_xlat7.xy);
					    u_xlat12.yw = floor(u_xlat5.xz);
					    u_xlat12 = u_xlat12 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat13.xz = floor(u_xlat7.zw);
					    u_xlat13.yw = floor(u_xlat5.yw);
					    u_xlat13 = u_xlat13 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlatb14 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xywz);
					    u_xlat14.x = (u_xlatb14.x) ? float(-1.0) : float(-0.0);
					    u_xlat14.y = (u_xlatb14.y) ? float(-1.0) : float(-0.0);
					    u_xlat14.z = (u_xlatb14.z) ? float(-1.0) : float(-0.0);
					    u_xlat14.w = (u_xlatb14.w) ? float(-1.0) : float(-0.0);
					    u_xlat15.xz = u_xlat7.xy;
					    u_xlat15.yw = u_xlat5.xz;
					    u_xlat12 = u_xlat12.zwxy * u_xlat14.yyxx + u_xlat15.zwxy;
					    u_xlat5.xz = u_xlat7.zw;
					    u_xlat5 = u_xlat13 * u_xlat14.zzww + u_xlat5;
					    u_xlat7.xy = u_xlat12.zw;
					    u_xlat7.z = u_xlat9.x;
					    u_xlat13.x = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat12.z = u_xlat9.y;
					    u_xlat13.y = dot(u_xlat12.xyz, u_xlat12.xyz);
					    u_xlat14.xy = u_xlat5.xy;
					    u_xlat14.z = u_xlat9.w;
					    u_xlat13.z = dot(u_xlat14.xyz, u_xlat14.xyz);
					    u_xlat9.xy = u_xlat5.zw;
					    u_xlat13.w = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat5 = (-u_xlat13) * vec4(0.853734732, 0.853734732, 0.853734732, 0.853734732) + vec4(1.79284286, 1.79284286, 1.79284286, 1.79284286);
					    u_xlat7.xyz = u_xlat5.xxx * u_xlat7.xyz;
					    u_xlat12.xyz = u_xlat5.yyy * u_xlat12.xyz;
					    u_xlat5.xyz = u_xlat5.zzz * u_xlat14.xyz;
					    u_xlat9.xyz = u_xlat5.www * u_xlat9.xyz;
					    u_xlat13.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat13.y = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat13.z = dot(u_xlat10.xyz, u_xlat10.xyz);
					    u_xlat13.w = dot(u_xlat11.xyz, u_xlat11.xyz);
					    u_xlat13 = (-u_xlat13) + vec4(0.600000024, 0.600000024, 0.600000024, 0.600000024);
					    u_xlat13 = max(u_xlat13, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat13 = u_xlat13 * u_xlat13;
					    u_xlat13 = u_xlat13 * u_xlat13;
					    u_xlat6.x = dot(u_xlat6.xyz, u_xlat7.xyz);
					    u_xlat6.y = dot(u_xlat8.xyz, u_xlat12.xyz);
					    u_xlat6.z = dot(u_xlat10.xyz, u_xlat5.xyz);
					    u_xlat6.w = dot(u_xlat11.xyz, u_xlat9.xyz);
					    u_xlat52 = dot(u_xlat13, u_xlat6);
					    u_xlat5.xz = u_xlat1.xz;
					    u_xlat5.y = u_xlat4.z;
					    u_xlat6.xyz = u_xlat5.xyz * vec3(_nmaptile);
					    u_xlat19.x = dot(u_xlat6.xyz, vec3(0.333333343, 0.333333343, 0.333333343));
					    u_xlat6.xyz = u_xlat5.xyz * vec3(_nmaptile) + u_xlat19.xxx;
					    u_xlat6.xyz = floor(u_xlat6.xyz);
					    u_xlat7.xyz = u_xlat5.xyz * vec3(_nmaptile) + (-u_xlat6.xyz);
					    u_xlat19.x = dot(u_xlat6.xyz, vec3(0.166666672, 0.166666672, 0.166666672));
					    u_xlat7.xyz = u_xlat19.xxx + u_xlat7.xyz;
					    u_xlatb8.xyz = greaterThanEqual(u_xlat7.zxyz, u_xlat7.xyzx).xyz;
					    u_xlat9.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0), vec3(u_xlatb8.yzx));
					    u_xlat8.x = (u_xlatb8.x) ? float(0.0) : float(1.0);
					    u_xlat8.y = (u_xlatb8.y) ? float(0.0) : float(1.0);
					    u_xlat8.z = (u_xlatb8.z) ? float(0.0) : float(1.0);
					    u_xlat10.xyz = min(u_xlat8.xyz, u_xlat9.xyz);
					    u_xlat8.xyz = max(u_xlat8.yzx, u_xlat9.yzx);
					    u_xlat9.xyz = u_xlat7.xyz + (-u_xlat10.xyz);
					    u_xlat9.xyz = u_xlat9.xyz + vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlat11.xyz = u_xlat7.xyz + (-u_xlat8.zxy);
					    u_xlat11.xyz = u_xlat11.xyz + vec3(0.333333343, 0.333333343, 0.333333343);
					    u_xlat12.xyz = u_xlat7.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat13.xyz = u_xlat6.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat13.xyz = floor(u_xlat13.xyz);
					    u_xlat6.xyz = (-u_xlat13.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat6.xyz;
					    u_xlat13.x = float(0.0);
					    u_xlat13.w = float(1.0);
					    u_xlat13.y = u_xlat10.z;
					    u_xlat13.z = u_xlat8.y;
					    u_xlat13 = u_xlat6.zzzz + u_xlat13;
					    u_xlat14 = u_xlat13 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat13 = u_xlat13 * u_xlat14;
					    u_xlat14 = u_xlat13 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat14 = floor(u_xlat14);
					    u_xlat13 = (-u_xlat14) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat13;
					    u_xlat13 = u_xlat6.yyyy + u_xlat13;
					    u_xlat14.x = float(0.0);
					    u_xlat14.w = float(1.0);
					    u_xlat14.y = u_xlat10.y;
					    u_xlat14.z = u_xlat8.x;
					    u_xlat13 = u_xlat13 + u_xlat14;
					    u_xlat14 = u_xlat13 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat13 = u_xlat13 * u_xlat14;
					    u_xlat14 = u_xlat13 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat14 = floor(u_xlat14);
					    u_xlat13 = (-u_xlat14) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat13;
					    u_xlat6 = u_xlat6.xxxx + u_xlat13;
					    u_xlat8.x = float(0.0);
					    u_xlat8.w = float(1.0);
					    u_xlat8.y = u_xlat10.x;
					    u_xlat6 = u_xlat6 + u_xlat8;
					    u_xlat8 = u_xlat6 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat6 = u_xlat6 * u_xlat8;
					    u_xlat8 = u_xlat6 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat8 = floor(u_xlat8);
					    u_xlat6 = (-u_xlat8) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat6;
					    u_xlat8 = u_xlat6 * vec4(0.0204081628, 0.0204081628, 0.0204081628, 0.0204081628);
					    u_xlat8 = floor(u_xlat8);
					    u_xlat6 = (-u_xlat8) * vec4(49.0, 49.0, 49.0, 49.0) + u_xlat6;
					    u_xlat8 = u_xlat6 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149);
					    u_xlat8 = floor(u_xlat8);
					    u_xlat6 = (-u_xlat8) * vec4(7.0, 7.0, 7.0, 7.0) + u_xlat6;
					    u_xlat8 = u_xlat8 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat8 = u_xlat8 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat6 = u_xlat6 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat6 = u_xlat6.xzyw * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat10 = -abs(u_xlat8) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat10 = -abs(u_xlat6.xzwy) + u_xlat10.xywz;
					    u_xlat13.xz = floor(u_xlat8.xy);
					    u_xlat13.yw = floor(u_xlat6.xz);
					    u_xlat13 = u_xlat13 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat14.xz = floor(u_xlat8.zw);
					    u_xlat14.yw = floor(u_xlat6.yw);
					    u_xlat14 = u_xlat14 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlatb15 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat10.xywz);
					    u_xlat15.x = (u_xlatb15.x) ? float(-1.0) : float(-0.0);
					    u_xlat15.y = (u_xlatb15.y) ? float(-1.0) : float(-0.0);
					    u_xlat15.z = (u_xlatb15.z) ? float(-1.0) : float(-0.0);
					    u_xlat15.w = (u_xlatb15.w) ? float(-1.0) : float(-0.0);
					    u_xlat16.xz = u_xlat8.xy;
					    u_xlat16.yw = u_xlat6.xz;
					    u_xlat13 = u_xlat13.zwxy * u_xlat15.yyxx + u_xlat16.zwxy;
					    u_xlat6.xz = u_xlat8.zw;
					    u_xlat6 = u_xlat14 * u_xlat15.zzww + u_xlat6;
					    u_xlat8.xy = u_xlat13.zw;
					    u_xlat8.z = u_xlat10.x;
					    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat13.z = u_xlat10.y;
					    u_xlat14.y = dot(u_xlat13.xyz, u_xlat13.xyz);
					    u_xlat15.xy = u_xlat6.xy;
					    u_xlat15.z = u_xlat10.w;
					    u_xlat14.z = dot(u_xlat15.xyz, u_xlat15.xyz);
					    u_xlat10.xy = u_xlat6.zw;
					    u_xlat14.w = dot(u_xlat10.xyz, u_xlat10.xyz);
					    u_xlat6 = (-u_xlat14) * vec4(0.853734732, 0.853734732, 0.853734732, 0.853734732) + vec4(1.79284286, 1.79284286, 1.79284286, 1.79284286);
					    u_xlat8.xyz = u_xlat6.xxx * u_xlat8.xyz;
					    u_xlat13.xyz = u_xlat6.yyy * u_xlat13.xyz;
					    u_xlat6.xyz = u_xlat6.zzz * u_xlat15.xyz;
					    u_xlat10.xyz = u_xlat6.www * u_xlat10.xyz;
					    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat14.y = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat14.z = dot(u_xlat11.xyz, u_xlat11.xyz);
					    u_xlat14.w = dot(u_xlat12.xyz, u_xlat12.xyz);
					    u_xlat14 = (-u_xlat14) + vec4(0.600000024, 0.600000024, 0.600000024, 0.600000024);
					    u_xlat14 = max(u_xlat14, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat14 = u_xlat14 * u_xlat14;
					    u_xlat14 = u_xlat14 * u_xlat14;
					    u_xlat7.x = dot(u_xlat7.xyz, u_xlat8.xyz);
					    u_xlat7.y = dot(u_xlat9.xyz, u_xlat13.xyz);
					    u_xlat7.z = dot(u_xlat11.xyz, u_xlat6.xyz);
					    u_xlat7.w = dot(u_xlat12.xyz, u_xlat10.xyz);
					    u_xlat19.x = dot(u_xlat14, u_xlat7);
					    u_xlat19.xy = u_xlat19.xy * vec2(42.0, 0.0500000007);
					    u_xlat4.yz = u_xlat1.yz;
					    u_xlat6.xyz = u_xlat4.xyz * vec3(_nmaptile);
					    u_xlat3.x = dot(u_xlat6.xyz, vec3(0.333333343, 0.333333343, 0.333333343));
					    u_xlat6.xyz = u_xlat4.xyz * vec3(_nmaptile) + u_xlat3.xxx;
					    u_xlat6.xyz = floor(u_xlat6.xyz);
					    u_xlat7.xyz = u_xlat4.xyz * vec3(_nmaptile) + (-u_xlat6.xyz);
					    u_xlat3.x = dot(u_xlat6.xyz, vec3(0.166666672, 0.166666672, 0.166666672));
					    u_xlat7.xyz = u_xlat3.xxx + u_xlat7.xyz;
					    u_xlatb8.xyz = greaterThanEqual(u_xlat7.zxyz, u_xlat7.xyzx).xyz;
					    u_xlat9.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0), vec3(u_xlatb8.yzx));
					    u_xlat8.x = (u_xlatb8.x) ? float(0.0) : float(1.0);
					    u_xlat8.y = (u_xlatb8.y) ? float(0.0) : float(1.0);
					    u_xlat8.z = (u_xlatb8.z) ? float(0.0) : float(1.0);
					    u_xlat10.xyz = min(u_xlat8.xyz, u_xlat9.xyz);
					    u_xlat8.xyz = max(u_xlat8.yzx, u_xlat9.yzx);
					    u_xlat9.xyz = u_xlat7.xyz + (-u_xlat10.xyz);
					    u_xlat9.xyz = u_xlat9.xyz + vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlat11.xyz = u_xlat7.xyz + (-u_xlat8.zxy);
					    u_xlat11.xyz = u_xlat11.xyz + vec3(0.333333343, 0.333333343, 0.333333343);
					    u_xlat12.xyz = u_xlat7.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat13.xyz = u_xlat6.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat13.xyz = floor(u_xlat13.xyz);
					    u_xlat6.xyz = (-u_xlat13.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat6.xyz;
					    u_xlat13.x = float(0.0);
					    u_xlat13.w = float(1.0);
					    u_xlat13.y = u_xlat10.z;
					    u_xlat13.z = u_xlat8.y;
					    u_xlat13 = u_xlat6.zzzz + u_xlat13;
					    u_xlat14 = u_xlat13 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat13 = u_xlat13 * u_xlat14;
					    u_xlat14 = u_xlat13 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat14 = floor(u_xlat14);
					    u_xlat13 = (-u_xlat14) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat13;
					    u_xlat13 = u_xlat6.yyyy + u_xlat13;
					    u_xlat14.x = float(0.0);
					    u_xlat14.w = float(1.0);
					    u_xlat14.y = u_xlat10.y;
					    u_xlat14.z = u_xlat8.x;
					    u_xlat13 = u_xlat13 + u_xlat14;
					    u_xlat14 = u_xlat13 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat13 = u_xlat13 * u_xlat14;
					    u_xlat14 = u_xlat13 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat14 = floor(u_xlat14);
					    u_xlat13 = (-u_xlat14) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat13;
					    u_xlat6 = u_xlat6.xxxx + u_xlat13;
					    u_xlat8.x = float(0.0);
					    u_xlat8.w = float(1.0);
					    u_xlat8.y = u_xlat10.x;
					    u_xlat6 = u_xlat6 + u_xlat8;
					    u_xlat8 = u_xlat6 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat6 = u_xlat6 * u_xlat8;
					    u_xlat8 = u_xlat6 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat8 = floor(u_xlat8);
					    u_xlat6 = (-u_xlat8) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat6;
					    u_xlat8 = u_xlat6 * vec4(0.0204081628, 0.0204081628, 0.0204081628, 0.0204081628);
					    u_xlat8 = floor(u_xlat8);
					    u_xlat6 = (-u_xlat8) * vec4(49.0, 49.0, 49.0, 49.0) + u_xlat6;
					    u_xlat8 = u_xlat6 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149);
					    u_xlat8 = floor(u_xlat8);
					    u_xlat6 = (-u_xlat8) * vec4(7.0, 7.0, 7.0, 7.0) + u_xlat6;
					    u_xlat8 = u_xlat8 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat8 = u_xlat8 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat6 = u_xlat6 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat6 = u_xlat6.xzyw * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat10 = -abs(u_xlat8) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat10 = -abs(u_xlat6.xzwy) + u_xlat10.xywz;
					    u_xlat13.xz = floor(u_xlat8.xy);
					    u_xlat13.yw = floor(u_xlat6.xz);
					    u_xlat13 = u_xlat13 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat14.xz = floor(u_xlat8.zw);
					    u_xlat14.yw = floor(u_xlat6.yw);
					    u_xlat14 = u_xlat14 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlatb15 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat10.xywz);
					    u_xlat15.x = (u_xlatb15.x) ? float(-1.0) : float(-0.0);
					    u_xlat15.y = (u_xlatb15.y) ? float(-1.0) : float(-0.0);
					    u_xlat15.z = (u_xlatb15.z) ? float(-1.0) : float(-0.0);
					    u_xlat15.w = (u_xlatb15.w) ? float(-1.0) : float(-0.0);
					    u_xlat16.xz = u_xlat8.xy;
					    u_xlat16.yw = u_xlat6.xz;
					    u_xlat13 = u_xlat13.zwxy * u_xlat15.yyxx + u_xlat16.zwxy;
					    u_xlat6.xz = u_xlat8.zw;
					    u_xlat6 = u_xlat14 * u_xlat15.zzww + u_xlat6;
					    u_xlat8.xy = u_xlat13.zw;
					    u_xlat8.z = u_xlat10.x;
					    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat13.z = u_xlat10.y;
					    u_xlat14.y = dot(u_xlat13.xyz, u_xlat13.xyz);
					    u_xlat15.xy = u_xlat6.xy;
					    u_xlat15.z = u_xlat10.w;
					    u_xlat14.z = dot(u_xlat15.xyz, u_xlat15.xyz);
					    u_xlat10.xy = u_xlat6.zw;
					    u_xlat14.w = dot(u_xlat10.xyz, u_xlat10.xyz);
					    u_xlat6 = (-u_xlat14) * vec4(0.853734732, 0.853734732, 0.853734732, 0.853734732) + vec4(1.79284286, 1.79284286, 1.79284286, 1.79284286);
					    u_xlat8.xyz = u_xlat6.xxx * u_xlat8.xyz;
					    u_xlat13.xyz = u_xlat6.yyy * u_xlat13.xyz;
					    u_xlat6.xyz = u_xlat6.zzz * u_xlat15.xyz;
					    u_xlat10.xyz = u_xlat6.www * u_xlat10.xyz;
					    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat14.y = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat14.z = dot(u_xlat11.xyz, u_xlat11.xyz);
					    u_xlat14.w = dot(u_xlat12.xyz, u_xlat12.xyz);
					    u_xlat14 = (-u_xlat14) + vec4(0.600000024, 0.600000024, 0.600000024, 0.600000024);
					    u_xlat14 = max(u_xlat14, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat14 = u_xlat14 * u_xlat14;
					    u_xlat14 = u_xlat14 * u_xlat14;
					    u_xlat7.x = dot(u_xlat7.xyz, u_xlat8.xyz);
					    u_xlat7.y = dot(u_xlat9.xyz, u_xlat13.xyz);
					    u_xlat7.z = dot(u_xlat11.xyz, u_xlat6.xyz);
					    u_xlat7.w = dot(u_xlat12.xyz, u_xlat10.xyz);
					    u_xlat3.x = dot(u_xlat14, u_xlat7);
					    u_xlat6.xyz = (-_Time.yyy) * vec3(vec3(_dspeed, _dspeed, _dspeed)) + u_xlat1.xyz;
					    u_xlat6.xyz = u_xlat6.xyz + vec3(25.4580002, 25.2110004, 25.7119999);
					    u_xlat4.w = u_xlat6.x;
					    u_xlat7.xyz = u_xlat4.wyz * vec3(_nmaptile);
					    u_xlat35 = dot(u_xlat7.xyz, vec3(0.333333343, 0.333333343, 0.333333343));
					    u_xlat7.xyz = u_xlat4.wyz * vec3(_nmaptile) + vec3(u_xlat35);
					    u_xlat7.xyz = floor(u_xlat7.xyz);
					    u_xlat4.xyz = u_xlat4.wyz * vec3(_nmaptile) + (-u_xlat7.xyz);
					    u_xlat35 = dot(u_xlat7.xyz, vec3(0.166666672, 0.166666672, 0.166666672));
					    u_xlat4.xyz = vec3(u_xlat35) + u_xlat4.xyz;
					    u_xlatb8.xyz = greaterThanEqual(u_xlat4.zxyz, u_xlat4.xyzx).xyz;
					    u_xlat9.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0), vec3(u_xlatb8.yzx));
					    u_xlat8.x = (u_xlatb8.x) ? float(0.0) : float(1.0);
					    u_xlat8.y = (u_xlatb8.y) ? float(0.0) : float(1.0);
					    u_xlat8.z = (u_xlatb8.z) ? float(0.0) : float(1.0);
					    u_xlat10.xyz = min(u_xlat8.xyz, u_xlat9.xyz);
					    u_xlat8.xyz = max(u_xlat8.yzx, u_xlat9.yzx);
					    u_xlat9.xyz = u_xlat4.xyz + (-u_xlat10.xyz);
					    u_xlat9.xyz = u_xlat9.xyz + vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlat11.xyz = u_xlat4.xyz + (-u_xlat8.zxy);
					    u_xlat11.xyz = u_xlat11.xyz + vec3(0.333333343, 0.333333343, 0.333333343);
					    u_xlat12.xyz = u_xlat4.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat13.xyz = u_xlat7.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat13.xyz = floor(u_xlat13.xyz);
					    u_xlat7.xyz = (-u_xlat13.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat7.xyz;
					    u_xlat13.x = float(0.0);
					    u_xlat13.w = float(1.0);
					    u_xlat13.y = u_xlat10.z;
					    u_xlat13.z = u_xlat8.y;
					    u_xlat13 = u_xlat7.zzzz + u_xlat13;
					    u_xlat14 = u_xlat13 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat13 = u_xlat13 * u_xlat14;
					    u_xlat14 = u_xlat13 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat14 = floor(u_xlat14);
					    u_xlat13 = (-u_xlat14) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat13;
					    u_xlat13 = u_xlat7.yyyy + u_xlat13;
					    u_xlat14.x = float(0.0);
					    u_xlat14.w = float(1.0);
					    u_xlat14.y = u_xlat10.y;
					    u_xlat14.z = u_xlat8.x;
					    u_xlat13 = u_xlat13 + u_xlat14;
					    u_xlat14 = u_xlat13 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat13 = u_xlat13 * u_xlat14;
					    u_xlat14 = u_xlat13 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat14 = floor(u_xlat14);
					    u_xlat13 = (-u_xlat14) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat13;
					    u_xlat7 = u_xlat7.xxxx + u_xlat13;
					    u_xlat8.x = float(0.0);
					    u_xlat8.w = float(1.0);
					    u_xlat8.y = u_xlat10.x;
					    u_xlat7 = u_xlat7 + u_xlat8;
					    u_xlat8 = u_xlat7 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat7 = u_xlat7 * u_xlat8;
					    u_xlat8 = u_xlat7 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat8 = floor(u_xlat8);
					    u_xlat7 = (-u_xlat8) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat7;
					    u_xlat8 = u_xlat7 * vec4(0.0204081628, 0.0204081628, 0.0204081628, 0.0204081628);
					    u_xlat8 = floor(u_xlat8);
					    u_xlat7 = (-u_xlat8) * vec4(49.0, 49.0, 49.0, 49.0) + u_xlat7;
					    u_xlat8 = u_xlat7 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149);
					    u_xlat8 = floor(u_xlat8);
					    u_xlat7 = (-u_xlat8) * vec4(7.0, 7.0, 7.0, 7.0) + u_xlat7;
					    u_xlat8 = u_xlat8 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat8 = u_xlat8 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat7 = u_xlat7 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat7 = u_xlat7.xzyw * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat10 = -abs(u_xlat8) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat10 = -abs(u_xlat7.xzwy) + u_xlat10.xywz;
					    u_xlat13.xz = floor(u_xlat8.xy);
					    u_xlat13.yw = floor(u_xlat7.xz);
					    u_xlat13 = u_xlat13 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat14.xz = floor(u_xlat8.zw);
					    u_xlat14.yw = floor(u_xlat7.yw);
					    u_xlat14 = u_xlat14 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlatb15 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat10.xywz);
					    u_xlat15.x = (u_xlatb15.x) ? float(-1.0) : float(-0.0);
					    u_xlat15.y = (u_xlatb15.y) ? float(-1.0) : float(-0.0);
					    u_xlat15.z = (u_xlatb15.z) ? float(-1.0) : float(-0.0);
					    u_xlat15.w = (u_xlatb15.w) ? float(-1.0) : float(-0.0);
					    u_xlat16.xz = u_xlat8.xy;
					    u_xlat16.yw = u_xlat7.xz;
					    u_xlat13 = u_xlat13.zwxy * u_xlat15.yyxx + u_xlat16.zwxy;
					    u_xlat7.xz = u_xlat8.zw;
					    u_xlat7 = u_xlat14 * u_xlat15.zzww + u_xlat7;
					    u_xlat8.xy = u_xlat13.zw;
					    u_xlat8.z = u_xlat10.x;
					    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat13.z = u_xlat10.y;
					    u_xlat14.y = dot(u_xlat13.xyz, u_xlat13.xyz);
					    u_xlat15.xy = u_xlat7.xy;
					    u_xlat15.z = u_xlat10.w;
					    u_xlat14.z = dot(u_xlat15.xyz, u_xlat15.xyz);
					    u_xlat10.xy = u_xlat7.zw;
					    u_xlat14.w = dot(u_xlat10.xyz, u_xlat10.xyz);
					    u_xlat7 = (-u_xlat14) * vec4(0.853734732, 0.853734732, 0.853734732, 0.853734732) + vec4(1.79284286, 1.79284286, 1.79284286, 1.79284286);
					    u_xlat8.xyz = u_xlat7.xxx * u_xlat8.xyz;
					    u_xlat13.xyz = u_xlat7.yyy * u_xlat13.xyz;
					    u_xlat7.xyz = u_xlat7.zzz * u_xlat15.xyz;
					    u_xlat10.xyz = u_xlat7.www * u_xlat10.xyz;
					    u_xlat14.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat14.y = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat14.z = dot(u_xlat11.xyz, u_xlat11.xyz);
					    u_xlat14.w = dot(u_xlat12.xyz, u_xlat12.xyz);
					    u_xlat14 = (-u_xlat14) + vec4(0.600000024, 0.600000024, 0.600000024, 0.600000024);
					    u_xlat14 = max(u_xlat14, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat14 = u_xlat14 * u_xlat14;
					    u_xlat14 = u_xlat14 * u_xlat14;
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat8.xyz);
					    u_xlat4.y = dot(u_xlat9.xyz, u_xlat13.xyz);
					    u_xlat4.z = dot(u_xlat11.xyz, u_xlat7.xyz);
					    u_xlat4.w = dot(u_xlat12.xyz, u_xlat10.xyz);
					    u_xlat35 = dot(u_xlat14, u_xlat4);
					    u_xlat5.w = u_xlat6.y;
					    u_xlat4.xyz = u_xlat5.xwz * vec3(_nmaptile);
					    u_xlat54 = dot(u_xlat4.xyz, vec3(0.333333343, 0.333333343, 0.333333343));
					    u_xlat4.xyz = u_xlat5.xwz * vec3(_nmaptile) + vec3(u_xlat54);
					    u_xlat4.xyz = floor(u_xlat4.xyz);
					    u_xlat5.xyz = u_xlat5.xwz * vec3(_nmaptile) + (-u_xlat4.xyz);
					    u_xlat54 = dot(u_xlat4.xyz, vec3(0.166666672, 0.166666672, 0.166666672));
					    u_xlat5.xyz = vec3(u_xlat54) + u_xlat5.xyz;
					    u_xlatb7.xyz = greaterThanEqual(u_xlat5.zxyz, u_xlat5.xyzx).xyz;
					    u_xlat8.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0), vec3(u_xlatb7.yzx));
					    u_xlat7.x = (u_xlatb7.x) ? float(0.0) : float(1.0);
					    u_xlat7.y = (u_xlatb7.y) ? float(0.0) : float(1.0);
					    u_xlat7.z = (u_xlatb7.z) ? float(0.0) : float(1.0);
					    u_xlat9.xyz = min(u_xlat7.xyz, u_xlat8.xyz);
					    u_xlat7.xyz = max(u_xlat7.yzx, u_xlat8.yzx);
					    u_xlat8.xyz = u_xlat5.xyz + (-u_xlat9.xyz);
					    u_xlat8.xyz = u_xlat8.xyz + vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlat10.xyz = u_xlat5.xyz + (-u_xlat7.zxy);
					    u_xlat10.xyz = u_xlat10.xyz + vec3(0.333333343, 0.333333343, 0.333333343);
					    u_xlat11.xyz = u_xlat5.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat12.xyz = u_xlat4.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat12.xyz = floor(u_xlat12.xyz);
					    u_xlat4.xyz = (-u_xlat12.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat4.xyz;
					    u_xlat12.x = float(0.0);
					    u_xlat12.w = float(1.0);
					    u_xlat12.y = u_xlat9.z;
					    u_xlat12.z = u_xlat7.y;
					    u_xlat12 = u_xlat4.zzzz + u_xlat12;
					    u_xlat13 = u_xlat12 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat12 = u_xlat12 * u_xlat13;
					    u_xlat13 = u_xlat12 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat13 = floor(u_xlat13);
					    u_xlat12 = (-u_xlat13) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat12;
					    u_xlat12 = u_xlat4.yyyy + u_xlat12;
					    u_xlat13.x = float(0.0);
					    u_xlat13.w = float(1.0);
					    u_xlat13.y = u_xlat9.y;
					    u_xlat13.z = u_xlat7.x;
					    u_xlat12 = u_xlat12 + u_xlat13;
					    u_xlat13 = u_xlat12 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat12 = u_xlat12 * u_xlat13;
					    u_xlat13 = u_xlat12 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat13 = floor(u_xlat13);
					    u_xlat12 = (-u_xlat13) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat12;
					    u_xlat4 = u_xlat4.xxxx + u_xlat12;
					    u_xlat7.x = float(0.0);
					    u_xlat7.w = float(1.0);
					    u_xlat7.y = u_xlat9.x;
					    u_xlat4 = u_xlat4 + u_xlat7;
					    u_xlat7 = u_xlat4 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat4 = u_xlat4 * u_xlat7;
					    u_xlat7 = u_xlat4 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat7 = floor(u_xlat7);
					    u_xlat4 = (-u_xlat7) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat4;
					    u_xlat7 = u_xlat4 * vec4(0.0204081628, 0.0204081628, 0.0204081628, 0.0204081628);
					    u_xlat7 = floor(u_xlat7);
					    u_xlat4 = (-u_xlat7) * vec4(49.0, 49.0, 49.0, 49.0) + u_xlat4;
					    u_xlat7 = u_xlat4 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149);
					    u_xlat7 = floor(u_xlat7);
					    u_xlat4 = (-u_xlat7) * vec4(7.0, 7.0, 7.0, 7.0) + u_xlat4;
					    u_xlat7 = u_xlat7 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat7 = u_xlat7 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat4 = u_xlat4 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat4 = u_xlat4.xzyw * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat9 = -abs(u_xlat7) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat9 = -abs(u_xlat4.xzwy) + u_xlat9.xywz;
					    u_xlat12.xz = floor(u_xlat7.xy);
					    u_xlat12.yw = floor(u_xlat4.xz);
					    u_xlat12 = u_xlat12 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat13.xz = floor(u_xlat7.zw);
					    u_xlat13.yw = floor(u_xlat4.yw);
					    u_xlat13 = u_xlat13 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlatb14 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xywz);
					    u_xlat14.x = (u_xlatb14.x) ? float(-1.0) : float(-0.0);
					    u_xlat14.y = (u_xlatb14.y) ? float(-1.0) : float(-0.0);
					    u_xlat14.z = (u_xlatb14.z) ? float(-1.0) : float(-0.0);
					    u_xlat14.w = (u_xlatb14.w) ? float(-1.0) : float(-0.0);
					    u_xlat15.xz = u_xlat7.xy;
					    u_xlat15.yw = u_xlat4.xz;
					    u_xlat12 = u_xlat12.zwxy * u_xlat14.yyxx + u_xlat15.zwxy;
					    u_xlat4.xz = u_xlat7.zw;
					    u_xlat4 = u_xlat13 * u_xlat14.zzww + u_xlat4;
					    u_xlat7.xy = u_xlat12.zw;
					    u_xlat7.z = u_xlat9.x;
					    u_xlat13.x = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat12.z = u_xlat9.y;
					    u_xlat13.y = dot(u_xlat12.xyz, u_xlat12.xyz);
					    u_xlat14.xy = u_xlat4.xy;
					    u_xlat14.z = u_xlat9.w;
					    u_xlat13.z = dot(u_xlat14.xyz, u_xlat14.xyz);
					    u_xlat9.xy = u_xlat4.zw;
					    u_xlat13.w = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat4 = (-u_xlat13) * vec4(0.853734732, 0.853734732, 0.853734732, 0.853734732) + vec4(1.79284286, 1.79284286, 1.79284286, 1.79284286);
					    u_xlat7.xyz = u_xlat4.xxx * u_xlat7.xyz;
					    u_xlat12.xyz = u_xlat4.yyy * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat4.zzz * u_xlat14.xyz;
					    u_xlat9.xyz = u_xlat4.www * u_xlat9.xyz;
					    u_xlat13.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlat13.y = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat13.z = dot(u_xlat10.xyz, u_xlat10.xyz);
					    u_xlat13.w = dot(u_xlat11.xyz, u_xlat11.xyz);
					    u_xlat13 = (-u_xlat13) + vec4(0.600000024, 0.600000024, 0.600000024, 0.600000024);
					    u_xlat13 = max(u_xlat13, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat13 = u_xlat13 * u_xlat13;
					    u_xlat13 = u_xlat13 * u_xlat13;
					    u_xlat5.x = dot(u_xlat5.xyz, u_xlat7.xyz);
					    u_xlat5.y = dot(u_xlat8.xyz, u_xlat12.xyz);
					    u_xlat5.z = dot(u_xlat10.xyz, u_xlat4.xyz);
					    u_xlat5.w = dot(u_xlat11.xyz, u_xlat9.xyz);
					    u_xlat54 = dot(u_xlat13, u_xlat5);
					    u_xlat6.xy = u_xlat1.xy;
					    u_xlat4.xyz = u_xlat6.xyz * vec3(_nmaptile);
					    u_xlat1.x = dot(u_xlat4.xyz, vec3(0.333333343, 0.333333343, 0.333333343));
					    u_xlat4.xyz = u_xlat6.xyz * vec3(_nmaptile) + u_xlat1.xxx;
					    u_xlat4.xyz = floor(u_xlat4.xyz);
					    u_xlat5.xyz = u_xlat6.xyz * vec3(_nmaptile) + (-u_xlat4.xyz);
					    u_xlat1.x = dot(u_xlat4.xyz, vec3(0.166666672, 0.166666672, 0.166666672));
					    u_xlat5.xyz = u_xlat1.xxx + u_xlat5.xyz;
					    u_xlatb6.xyz = greaterThanEqual(u_xlat5.zxyz, u_xlat5.xyzx).xyz;
					    u_xlat7.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0), vec3(u_xlatb6.yzx));
					    u_xlat6.x = (u_xlatb6.x) ? float(0.0) : float(1.0);
					    u_xlat6.y = (u_xlatb6.y) ? float(0.0) : float(1.0);
					    u_xlat6.z = (u_xlatb6.z) ? float(0.0) : float(1.0);
					    u_xlat8.xyz = min(u_xlat6.xyz, u_xlat7.xyz);
					    u_xlat6.xyz = max(u_xlat6.yzx, u_xlat7.yzx);
					    u_xlat7.xyz = u_xlat5.xyz + (-u_xlat8.xyz);
					    u_xlat7.xyz = u_xlat7.xyz + vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlat9.xyz = u_xlat5.xyz + (-u_xlat6.zxy);
					    u_xlat9.xyz = u_xlat9.xyz + vec3(0.333333343, 0.333333343, 0.333333343);
					    u_xlat10.xyz = u_xlat5.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat11.xyz = u_xlat4.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat11.xyz = floor(u_xlat11.xyz);
					    u_xlat4.xyz = (-u_xlat11.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat4.xyz;
					    u_xlat11.x = float(0.0);
					    u_xlat11.w = float(1.0);
					    u_xlat11.y = u_xlat8.z;
					    u_xlat11.z = u_xlat6.y;
					    u_xlat11 = u_xlat4.zzzz + u_xlat11;
					    u_xlat12 = u_xlat11 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat11 = u_xlat11 * u_xlat12;
					    u_xlat12 = u_xlat11 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat12 = floor(u_xlat12);
					    u_xlat11 = (-u_xlat12) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat11;
					    u_xlat11 = u_xlat4.yyyy + u_xlat11;
					    u_xlat12.x = float(0.0);
					    u_xlat12.w = float(1.0);
					    u_xlat12.y = u_xlat8.y;
					    u_xlat12.z = u_xlat6.x;
					    u_xlat11 = u_xlat11 + u_xlat12;
					    u_xlat12 = u_xlat11 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat11 = u_xlat11 * u_xlat12;
					    u_xlat12 = u_xlat11 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat12 = floor(u_xlat12);
					    u_xlat11 = (-u_xlat12) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat11;
					    u_xlat4 = u_xlat4.xxxx + u_xlat11;
					    u_xlat6.x = float(0.0);
					    u_xlat6.w = float(1.0);
					    u_xlat6.y = u_xlat8.x;
					    u_xlat4 = u_xlat4 + u_xlat6;
					    u_xlat6 = u_xlat4 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat4 = u_xlat4 * u_xlat6;
					    u_xlat6 = u_xlat4 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat6 = floor(u_xlat6);
					    u_xlat4 = (-u_xlat6) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat4;
					    u_xlat6 = u_xlat4 * vec4(0.0204081628, 0.0204081628, 0.0204081628, 0.0204081628);
					    u_xlat6 = floor(u_xlat6);
					    u_xlat4 = (-u_xlat6) * vec4(49.0, 49.0, 49.0, 49.0) + u_xlat4;
					    u_xlat6 = u_xlat4 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149);
					    u_xlat6 = floor(u_xlat6);
					    u_xlat4 = (-u_xlat6) * vec4(7.0, 7.0, 7.0, 7.0) + u_xlat4;
					    u_xlat6 = u_xlat6 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat6 = u_xlat6 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat4 = u_xlat4 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat4 = u_xlat4.xzyw * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat8 = -abs(u_xlat6) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat8 = -abs(u_xlat4.xzwy) + u_xlat8.xywz;
					    u_xlat11.xz = floor(u_xlat6.xy);
					    u_xlat11.yw = floor(u_xlat4.xz);
					    u_xlat11 = u_xlat11 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat12.xz = floor(u_xlat6.zw);
					    u_xlat12.yw = floor(u_xlat4.yw);
					    u_xlat12 = u_xlat12 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlatb13 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xywz);
					    u_xlat13.x = (u_xlatb13.x) ? float(-1.0) : float(-0.0);
					    u_xlat13.y = (u_xlatb13.y) ? float(-1.0) : float(-0.0);
					    u_xlat13.z = (u_xlatb13.z) ? float(-1.0) : float(-0.0);
					    u_xlat13.w = (u_xlatb13.w) ? float(-1.0) : float(-0.0);
					    u_xlat14.xz = u_xlat6.xy;
					    u_xlat14.yw = u_xlat4.xz;
					    u_xlat11 = u_xlat11.zwxy * u_xlat13.yyxx + u_xlat14.zwxy;
					    u_xlat4.xz = u_xlat6.zw;
					    u_xlat4 = u_xlat12 * u_xlat13.zzww + u_xlat4;
					    u_xlat6.xy = u_xlat11.zw;
					    u_xlat6.z = u_xlat8.x;
					    u_xlat12.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat11.z = u_xlat8.y;
					    u_xlat12.y = dot(u_xlat11.xyz, u_xlat11.xyz);
					    u_xlat13.xy = u_xlat4.xy;
					    u_xlat13.z = u_xlat8.w;
					    u_xlat12.z = dot(u_xlat13.xyz, u_xlat13.xyz);
					    u_xlat8.xy = u_xlat4.zw;
					    u_xlat12.w = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat4 = (-u_xlat12) * vec4(0.853734732, 0.853734732, 0.853734732, 0.853734732) + vec4(1.79284286, 1.79284286, 1.79284286, 1.79284286);
					    u_xlat6.xyz = u_xlat4.xxx * u_xlat6.xyz;
					    u_xlat11.xyz = u_xlat4.yyy * u_xlat11.xyz;
					    u_xlat4.xyz = u_xlat4.zzz * u_xlat13.xyz;
					    u_xlat8.xyz = u_xlat4.www * u_xlat8.xyz;
					    u_xlat12.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlat12.y = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat12.z = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat12.w = dot(u_xlat10.xyz, u_xlat10.xyz);
					    u_xlat12 = (-u_xlat12) + vec4(0.600000024, 0.600000024, 0.600000024, 0.600000024);
					    u_xlat12 = max(u_xlat12, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat5.x = dot(u_xlat5.xyz, u_xlat6.xyz);
					    u_xlat5.y = dot(u_xlat7.xyz, u_xlat11.xyz);
					    u_xlat5.z = dot(u_xlat9.xyz, u_xlat4.xyz);
					    u_xlat5.w = dot(u_xlat10.xyz, u_xlat8.xyz);
					    u_xlat1.x = dot(u_xlat12, u_xlat5);
					    u_xlat18.x = u_xlat52 * 42.0 + u_xlat19.x;
					    u_xlat18.x = u_xlat3.x * 42.0 + u_xlat18.x;
					    u_xlat18.x = u_xlat35 * 42.0 + u_xlat18.x;
					    u_xlat18.x = u_xlat54 * 42.0 + u_xlat18.x;
					    u_xlat18.y = u_xlat1.x * 42.0 + u_xlat18.x;
					    u_xlat18.x = u_xlat18.y * u_xlat18.y;
					    u_xlat1.xy = u_xlat18.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.xy = u_xlat19.yy * u_xlat1.xy;
					    u_xlat35 = (-_Zoom) + 1.0;
					    u_xlat1.yz = u_xlat1.xy * vec2(u_xlat35) + u_xlat3.yz;
					    u_xlat52 = fract((-_woffset));
					    u_xlat52 = log2(u_xlat52);
					    u_xlat52 = u_xlat52 * 0.0500000007;
					    u_xlat52 = exp2(u_xlat52);
					    u_xlat52 = u_xlat52 * vs_TEXCOORD1;
					    u_xlat52 = u_xlat52 * _wpower;
					    u_xlat19.x = float(_wcntr);
					    u_xlat2.x = u_xlat2.x * u_xlat52 + (-u_xlat52);
					    u_xlat52 = u_xlat19.x * u_xlat2.x + u_xlat52;
					    u_xlat0.xw = (-u_xlat17.xy) + u_xlat0.xw;
					    u_xlat0.yz = u_xlat19.xx * u_xlat0.xw + u_xlat17.xy;
					    u_xlat51 = _ScreenParams.x / _ScreenParams.y;
					    u_xlat51 = u_xlat51 + u_xlat51;
					    u_xlat0.x = u_xlat51 * u_xlat0.y;
					    u_xlat17.x = _wspeed * _Time.y;
					    u_xlat17.x = u_xlat17.x * 0.00999999978 + _woffset;
					    u_xlat2.x = floor(u_xlat17.x);
					    u_xlat17.x = u_xlat17.x + (-u_xlat2.x);
					    u_xlat1.x = u_xlat51 * u_xlat1.y;
					    u_xlat3 = (-u_xlat0.xzxz) + u_xlat1.xzyz;
					    u_xlat0.x = dot(u_xlat3.xy, u_xlat3.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlatb34 = 0.0<u_xlat17.x;
					    u_xlat51 = u_xlat17.x + _wz;
					    u_xlatb51 = u_xlat51>=u_xlat0.x;
					    u_xlatb34 = u_xlatb51 && u_xlatb34;
					    u_xlat51 = u_xlat17.x + (-_wz);
					    u_xlatb51 = u_xlat0.x>=u_xlat51;
					    u_xlatb34 = u_xlatb51 && u_xlatb34;
					    u_xlat51 = (-u_xlat17.x) + u_xlat0.x;
					    u_xlat1.x = u_xlat51 * _wx;
					    u_xlat1.x = log2(abs(u_xlat1.x));
					    u_xlat1.x = u_xlat1.x * _wy;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat51 = u_xlat51 * u_xlat1.x;
					    u_xlat51 = u_xlat52 * u_xlat51;
					    u_xlat51 = u_xlat51 * 0.00999999978;
					    u_xlat1.x = dot(u_xlat3.zw, u_xlat3.zw);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat2.xy = u_xlat1.xx * u_xlat3.zw;
					    u_xlat2.xy = vec2(u_xlat51) * u_xlat2.xy;
					    u_xlat0.x = u_xlat0.x * u_xlat17.x;
					    u_xlat0.x = u_xlat0.x * 80.0;
					    u_xlat17.x = (-u_xlat52) * 0.00999999978 + 1.00999999;
					    u_xlat0.x = u_xlat17.x * u_xlat0.x;
					    u_xlat0.xy = u_xlat2.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy + u_xlat1.yz;
					    u_xlat0.xy = (bool(u_xlatb34)) ? u_xlat0.xy : u_xlat1.yz;
					    u_xlat10_1 = texture(_corpsegp2, u_xlat0.xy);
					    u_xlat34.x = vs_TEXCOORD1 * _egoffset;
					    u_xlat34.x = u_xlat34.x * 0.0199999996;
					    u_xlat2.xy = (-_ScreenParams.zw) + vec2(1.0, 1.0);
					    u_xlat3.xy = u_xlat34.xx * u_xlat2.xy;
					    u_xlat4 = u_xlat3.xyxy * vec4(0.0, 1.0, -1.0, 0.0) + u_xlat0.xyxy;
					    u_xlat10_5 = texture(_corpsegp2, u_xlat4.xy);
					    u_xlat10_4 = texture(_corpsegp2, u_xlat4.zw);
					    u_xlat16_37.xy = u_xlat10_4.xy + u_xlat10_5.xy;
					    u_xlat6 = u_xlat3.xyxy * vec4(-1.0, 1.0, 1.0, 0.0) + u_xlat0.xyxy;
					    u_xlat10_7 = texture(_corpsegp2, u_xlat6.xy);
					    u_xlat16_37.xy = u_xlat16_37.xy + u_xlat10_7.xy;
					    u_xlat6.xy = (-u_xlat2.xy) * u_xlat34.xx + u_xlat0.xy;
					    u_xlat10_8 = texture(_corpsegp2, u_xlat6.xy);
					    u_xlat16_37.xy = u_xlat16_37.xy + u_xlat10_8.xy;
					    u_xlat10_6 = texture(_corpsegp2, u_xlat6.zw);
					    u_xlat16_37.xy = u_xlat16_37.xy + (-u_xlat10_6.xy);
					    u_xlat9 = u_xlat3.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + u_xlat0.xyxy;
					    u_xlat10_10 = texture(_corpsegp2, u_xlat9.xy);
					    u_xlat16_3.xy = u_xlat16_37.xy + (-u_xlat10_10.xy);
					    u_xlat10_9 = texture(_corpsegp2, u_xlat9.zw);
					    u_xlat16_3.xy = u_xlat16_3.xy + (-u_xlat10_9.xy);
					    u_xlat17.xy = u_xlat2.xy * u_xlat34.xx + u_xlat0.xy;
					    u_xlat10_11 = texture(_corpsegp2, u_xlat17.xy);
					    u_xlat16_17.xy = u_xlat16_3.xy + (-u_xlat10_11.xy);
					    u_xlat16_3 = u_xlat10_5.yzzx + u_xlat10_11.yzzx;
					    u_xlat16_3 = u_xlat10_6.yzzx + u_xlat16_3;
					    u_xlat16_3 = u_xlat10_7.yzzx + u_xlat16_3;
					    u_xlat16_3 = (-u_xlat10_8.yzzx) + u_xlat16_3;
					    u_xlat16_2.xy = (-u_xlat10_10.yz) + u_xlat16_3.xy;
					    u_xlat16_2.xy = (-u_xlat10_4.yz) + u_xlat16_2.xy;
					    u_xlat16_2.xy = (-u_xlat10_9.yz) + u_xlat16_2.xy;
					    u_xlat16_3.xy = (-u_xlat10_10.zx) + u_xlat16_3.zw;
					    u_xlat16_3.xy = (-u_xlat10_4.zx) + u_xlat16_3.xy;
					    u_xlat16_3.xy = (-u_xlat10_9.zx) + u_xlat16_3.xy;
					    u_xlat16_2.xy = u_xlat16_2.xy * u_xlat16_2.xy;
					    u_xlat16_17.xy = u_xlat16_17.xy * u_xlat16_17.xy + u_xlat16_2.xy;
					    u_xlat16_17.xy = u_xlat16_3.xy * u_xlat16_3.xy + u_xlat16_17.xy;
					    u_xlat16_17.x = dot(u_xlat16_17.xy, u_xlat16_17.xy);
					    u_xlat16_17.x = sqrt(u_xlat16_17.x);
					    u_xlat17.x = u_xlat16_17.x * _egpow;
					    u_xlat17.x = u_xlat17.x * 5.0;
					    u_xlat17.xyz = u_xlat17.xxx * _egcol.xyz;
					    u_xlat17.xyz = u_xlat17.xyz * vec3(vs_TEXCOORD1);
					    u_xlat17.xyz = max(u_xlat17.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat17.xyz = min(u_xlat17.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat17.xyz = u_xlat17.xyz + u_xlat10_1.xyz;
					    u_xlat1.x = _HDRMultiplyer + 1.0;
					    u_xlat18.xyz = u_xlat17.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat18.xyz = u_xlat17.xyz * u_xlat18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat18.xyz = u_xlat17.xyz * u_xlat18.xyz;
					    u_xlat18.xyz = max(u_xlat18.xyz, u_xlat18.xyz);
					    u_xlat18.xyz = clamp(u_xlat18.xyz, 0.0, 1.0);
					    u_xlat2.xy = vec2(vs_TEXCOORD1) * vec2(_HDR, _grsc);
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat18.xyz + (-u_xlat17.xyz);
					    u_xlat1.xyz = u_xlat2.xxx * u_xlat1.xyz + u_xlat17.xyz;
					    u_xlat3.x = _Contrast * vs_TEXCOORD1 + 1.0;
					    u_xlat3.y = u_xlat3.x * -0.5 + 0.5;
					    u_xlat1.w = 1.0;
					    u_xlat4.x = dot(u_xlat3.xy, u_xlat1.xw);
					    u_xlat4.y = dot(u_xlat3.xy, u_xlat1.yw);
					    u_xlat4.z = dot(u_xlat3.xy, u_xlat1.zw);
					    u_xlat17.x = dot(u_xlat4.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat34.xy = vec2(_threshold, _softness) + vec2(-1.0, -1.0);
					    u_xlat17.yz = vec2(vs_TEXCOORD1) * u_xlat34.xy + vec2(1.0, 1.0);
					    u_xlat1.xyz = _brightColor.xyz + _darkColor.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlatb52 = u_xlat17.x>=u_xlat17.y;
					    u_xlat2.x = (-u_xlat17.y) + u_xlat17.x;
					    u_xlat36 = float(1.0) / u_xlat17.z;
					    u_xlat2.x = u_xlat36 * u_xlat2.x;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat36 = u_xlat2.x * -2.0 + 3.0;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * u_xlat36;
					    u_xlat5.xyz = (-u_xlat1.xyz) * vec3(0.5, 0.5, 0.5) + _brightColor.xyz;
					    u_xlat3.xyz = u_xlat2.xxx * u_xlat5.xyz + u_xlat3.xyz;
					    u_xlat51 = (-u_xlat17.z) + u_xlat17.y;
					    u_xlat17.xy = (-vec2(u_xlat51)) + u_xlat17.xy;
					    u_xlat34.x = float(1.0) / u_xlat17.y;
					    u_xlat17.x = u_xlat34.x * u_xlat17.x;
					    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
					    u_xlat34.x = u_xlat17.x * -2.0 + 3.0;
					    u_xlat17.x = u_xlat17.x * u_xlat17.x;
					    u_xlat17.x = u_xlat17.x * u_xlat34.x;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + (-_darkColor.xyz);
					    u_xlat17.xyz = u_xlat17.xxx * u_xlat1.xyz + _darkColor.xyz;
					    u_xlat17.xyz = (bool(u_xlatb52)) ? u_xlat3.xyz : u_xlat17.xyz;
					    u_xlat17.xyz = (-u_xlat4.xyz) + u_xlat17.xyz;
					    u_xlat17.xyz = u_xlat2.yyy * u_xlat17.xyz + u_xlat4.xyz;
					    u_xlat1.xyz = _Colorm.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat1.xyz = vec3(vs_TEXCOORD1) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat17.xyz = u_xlat17.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = _ColorL.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat1.xyz = vec3(vs_TEXCOORD1) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = _ColorR.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat2.xyz = vec3(vs_TEXCOORD1) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat0.x = u_xlat0.x + (-unity_StereoScaleOffset[u_xlati53].z);
					    u_xlat0.x = u_xlat0.x / unity_StereoScaleOffset[u_xlati53].x;
					    u_xlat2.xyz = (-u_xlat1.xyz) + u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat17.xyz * u_xlat1.xyz;
					    SV_Target0.w = _Alpha;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BLUR_OFF" "EDGYSPACE_ON" "HUE_OFF" "EDGEGLOW_ON" "ZOOM_FISHEYE" "SHAKE_ON" "WAVES_ON" "COLOR_GRADING_ON" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _Alpha;
						float _Zoom;
						int _Usernd;
						float _AmplitudeY;
						float _AmplitudeX;
						float _ysp;
						float _xsp;
						float _Amplitudefix;
						float _Waves;
						float _WavesSpeed;
						float _WavesPower;
						float _egoffset;
						float _egpow;
						vec4 _egcol;
						float _egspoffset;
						float _egspcol;
						float _HDR;
						float _HDRMultiplyer;
						float _Contrast;
						float _grsc;
						vec4 _Colorm;
						vec4 _ColorL;
						vec4 _ColorR;
						vec4 _brightColor;
						vec4 _darkColor;
						float _threshold;
						float _softness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3;
						vec4 _ScreenParams;
						vec4 unused_1_5[2];
					};
					layout(std140) uniform UnityPerCameraRare {
						vec4 unused_2_0[6];
						mat4x4 unity_CameraProjection;
						vec4 unused_2_2[8];
						mat4x4 unity_CameraToWorld;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					uniform  sampler2D _corpsegp2;
					in  vec4 vs_TEXCOORD0;
					in  float vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec2 u_xlat16_1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec2 u_xlat16_3;
					vec4 u_xlat10_3;
					bool u_xlatb3;
					vec3 u_xlat4;
					vec4 u_xlat16_4;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					vec2 u_xlat16_5;
					vec4 u_xlat10_5;
					vec4 u_xlat6;
					vec4 u_xlat10_6;
					vec4 u_xlat10_7;
					vec4 u_xlat10_8;
					vec4 u_xlat9;
					vec4 u_xlat10_9;
					vec4 u_xlat10_10;
					vec2 u_xlat11;
					bool u_xlatb11;
					vec3 u_xlat12;
					float u_xlat13;
					bool u_xlatb13;
					vec3 u_xlat16_14;
					vec2 u_xlat22;
					vec2 u_xlat23;
					vec2 u_xlat16_23;
					float u_xlat24;
					vec2 u_xlat27;
					float u_xlat33;
					float u_xlat16_33;
					bool u_xlatb33;
					float u_xlat34;
					float u_xlat35;
					float u_xlat36;
					void main()
					{
					    u_xlatb0 = unity_CameraProjection[0].z!=0.0;
					    u_xlatb11 = unity_CameraProjection[1].z!=0.0;
					    u_xlatb0 = u_xlatb11 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat1.xyz = unity_CameraToWorld[2].xyz + unity_CameraToWorld[3].xyz;
					    u_xlat1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(10000.0, 10000.0, 10000.0) + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = u_xlat1.yyy * unity_MatrixVP[1].xwy;
					    u_xlat1.xyw = unity_MatrixVP[0].xwy * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = unity_MatrixVP[2].xwy * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat1.xyz = u_xlat1.xyz + unity_MatrixVP[3].xwy;
					    u_xlat1.xzw = u_xlat1.xyz * vec3(0.5, 0.5, -0.5);
					    u_xlat22.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat22.xy = u_xlat22.xy / u_xlat1.yy;
					    u_xlat1.xy = (-u_xlat22.xy) + u_xlat0.xy;
					    u_xlat23.x = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat34 = sqrt(u_xlat23.x);
					    u_xlat2.x = dot(u_xlat22.xy, u_xlat22.xy);
					    u_xlat2.x = sqrt(u_xlat2.x);
					    u_xlat13 = 3.14159274 / u_xlat2.x;
					    u_xlat13 = u_xlat13 * _Zoom;
					    u_xlat13 = u_xlat13 * vs_TEXCOORD1;
					    u_xlat24 = u_xlat13 * 0.5;
					    u_xlatb13 = 0.0<u_xlat13;
					    u_xlat35 = _ScreenParams.x / _ScreenParams.y;
					    u_xlatb3 = u_xlat35<1.0;
					    u_xlat3.x = (u_xlatb3) ? u_xlat22.x : u_xlat22.y;
					    u_xlat2.x = (u_xlatb13) ? u_xlat2.x : u_xlat3.x;
					    u_xlat23.x = inversesqrt(u_xlat23.x);
					    u_xlat1.xy = u_xlat23.xx * u_xlat1.xy;
					    u_xlat23.x = u_xlat34 * u_xlat24;
					    u_xlat3.x = sin(u_xlat23.x);
					    u_xlat4.x = cos(u_xlat23.x);
					    u_xlat23.x = u_xlat3.x / u_xlat4.x;
					    u_xlat1.xy = u_xlat23.xx * u_xlat1.xy;
					    u_xlat1.xy = u_xlat2.xx * u_xlat1.xy;
					    u_xlat23.x = u_xlat24 * u_xlat2.x;
					    u_xlat2.x = sin(u_xlat23.x);
					    u_xlat3.x = cos(u_xlat23.x);
					    u_xlat23.x = u_xlat2.x / u_xlat3.x;
					    u_xlat1.xy = u_xlat1.xy / u_xlat23.xx;
					    u_xlat22.xy = u_xlat22.xy + u_xlat1.xy;
					    u_xlat0.xy = (bool(u_xlatb13)) ? u_xlat22.xy : u_xlat0.xy;
					    u_xlat22.xy = vec2(_AmplitudeY, _AmplitudeX) * vec2(vec2(_Amplitudefix, _Amplitudefix));
					    u_xlat22.xy = u_xlat22.xy * vec2(0.00300000003, 0.00300000003);
					    u_xlat1.xy = vec2(_ysp, _xsp) * _Time.yy;
					    u_xlat1.xy = sin(u_xlat1.xy);
					    u_xlat22.xy = u_xlat22.xy * u_xlat1.xy;
					    u_xlat22.xy = u_xlat22.xy * vec2(vs_TEXCOORD1);
					    u_xlat22.x = u_xlat35 * u_xlat22.x;
					    u_xlat1.xy = _Time.yy + vec2(4.24861526, 9.45731163);
					    u_xlat23.xy = u_xlat1.xy * vec2(_ysp, _xsp);
					    u_xlat23.x = dot(u_xlat23.xx, vec2(0.366025418, 0.366025418));
					    u_xlat23.x = u_xlat1.x * _ysp + u_xlat23.x;
					    u_xlat23.x = floor(u_xlat23.x);
					    u_xlat1.x = u_xlat1.x * _ysp + (-u_xlat23.x);
					    u_xlat2.x = dot(u_xlat23.xx, vec2(0.211324871, 0.211324871));
					    u_xlat1.x = u_xlat1.x + u_xlat2.x;
					    u_xlat2.xyz = u_xlat1.xxx + vec3(-0.577350259, 0.211324871, -0.788675129);
					    u_xlat3.x = u_xlat23.x * 0.00346020772;
					    u_xlat3.x = floor(u_xlat3.x);
					    u_xlat23.x = (-u_xlat3.x) * 289.0 + u_xlat23.x;
					    u_xlat3.xyz = u_xlat23.xxx + vec3(0.0, 1.0, 1.0);
					    u_xlat4.xyz = u_xlat3.xzz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat3.xzz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat4.xyz = floor(u_xlat4.xyz);
					    u_xlat3.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat23.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + vec3(0.0, 0.0, 1.0);
					    u_xlat4.xyz = u_xlat3.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat4.xyz = floor(u_xlat4.xyz);
					    u_xlat3.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat3.xyz;
					    u_xlat4.x = dot(u_xlat1.xx, u_xlat1.xx);
					    u_xlat4.y = dot(u_xlat2.yz, u_xlat2.yz);
					    u_xlat4.z = dot(u_xlat2.xx, u_xlat2.xx);
					    u_xlat4.xyz = (-u_xlat4.xyz) + vec3(0.5, 0.5, 0.5);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat4.xyz * u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xyz * u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
					    u_xlat3.xyz = fract(u_xlat3.xyz);
					    u_xlat5.xyz = u_xlat3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat6.xyz = abs(u_xlat5.xyz) + vec3(-0.5, -0.5, -0.5);
					    u_xlat3.xyz = u_xlat3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
					    u_xlat3.xyz = floor(u_xlat3.xyz);
					    u_xlat3.xyz = (-u_xlat3.xyz) + u_xlat5.xyz;
					    u_xlat5.xyz = u_xlat6.xyz * u_xlat6.xyz;
					    u_xlat5.xyz = u_xlat3.xyz * u_xlat3.xyz + u_xlat5.xyz;
					    u_xlat5.xyz = (-u_xlat5.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
					    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
					    u_xlat23.x = u_xlat1.x * u_xlat6.x;
					    u_xlat5.x = u_xlat3.x * u_xlat1.x + u_xlat23.x;
					    u_xlat1.xz = u_xlat2.zx * u_xlat6.yz;
					    u_xlat5.yz = u_xlat3.yz * u_xlat2.yx + u_xlat1.xz;
					    u_xlat1.x = dot(u_xlat4.xyz, u_xlat5.xyz);
					    u_xlat1.x = u_xlat1.x * _AmplitudeY;
					    u_xlat1.x = u_xlat1.x * _Amplitudefix;
					    u_xlat1.x = u_xlat1.x * vs_TEXCOORD1;
					    u_xlat1.x = u_xlat35 * u_xlat1.x;
					    u_xlat23.x = float(_Usernd);
					    u_xlat1.x = u_xlat1.x * 0.390000015 + (-u_xlat22.x);
					    u_xlat22.x = u_xlat23.x * u_xlat1.x + u_xlat22.x;
					    u_xlat2.y = u_xlat22.x + u_xlat0.y;
					    u_xlat11.x = dot(u_xlat23.yy, vec2(0.366025418, 0.366025418));
					    u_xlat11.x = u_xlat1.y * _xsp + u_xlat11.x;
					    u_xlat11.x = floor(u_xlat11.x);
					    u_xlat22.x = u_xlat1.y * _xsp + (-u_xlat11.x);
					    u_xlat1.x = dot(u_xlat11.xx, vec2(0.211324871, 0.211324871));
					    u_xlat22.x = u_xlat22.x + u_xlat1.x;
					    u_xlat1.xyw = u_xlat22.xxx + vec3(-0.577350259, 0.211324871, -0.788675129);
					    u_xlat3.x = u_xlat11.x * 0.00346020772;
					    u_xlat3.x = floor(u_xlat3.x);
					    u_xlat11.x = (-u_xlat3.x) * 289.0 + u_xlat11.x;
					    u_xlat3.xyz = u_xlat11.xxx + vec3(0.0, 1.0, 1.0);
					    u_xlat4.xyz = u_xlat3.xzz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat3.xzz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat4.xyz = floor(u_xlat4.xyz);
					    u_xlat3.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat11.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + vec3(0.0, 0.0, 1.0);
					    u_xlat4.xyz = u_xlat3.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat4.xyz = floor(u_xlat4.xyz);
					    u_xlat3.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat3.xyz;
					    u_xlat4.x = dot(u_xlat22.xx, u_xlat22.xx);
					    u_xlat4.y = dot(u_xlat1.yw, u_xlat1.yw);
					    u_xlat4.z = dot(u_xlat1.xx, u_xlat1.xx);
					    u_xlat4.xyz = (-u_xlat4.xyz) + vec3(0.5, 0.5, 0.5);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat4.xyz * u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xyz * u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
					    u_xlat3.xyz = fract(u_xlat3.xyz);
					    u_xlat5.xyz = u_xlat3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat6.xyz = abs(u_xlat5.xyz) + vec3(-0.5, -0.5, -0.5);
					    u_xlat3.xyz = u_xlat3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
					    u_xlat3.xyz = floor(u_xlat3.xyz);
					    u_xlat3.xyz = (-u_xlat3.xyz) + u_xlat5.xyz;
					    u_xlat5.xyz = u_xlat6.xyz * u_xlat6.xyz;
					    u_xlat5.xyz = u_xlat3.xyz * u_xlat3.xyz + u_xlat5.xyz;
					    u_xlat5.xyz = (-u_xlat5.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
					    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
					    u_xlat11.x = u_xlat22.x * u_xlat6.x;
					    u_xlat5.x = u_xlat3.x * u_xlat22.x + u_xlat11.x;
					    u_xlat11.xy = u_xlat1.wx * u_xlat6.yz;
					    u_xlat5.yz = u_xlat3.yz * u_xlat1.yx + u_xlat11.xy;
					    u_xlat11.x = dot(u_xlat4.xyz, u_xlat5.xyz);
					    u_xlat11.x = u_xlat11.x * _AmplitudeX;
					    u_xlat11.x = u_xlat11.x * _Amplitudefix;
					    u_xlat11.x = u_xlat11.x * vs_TEXCOORD1;
					    u_xlat11.x = u_xlat11.x * 0.390000015 + (-u_xlat22.y);
					    u_xlat11.x = u_xlat23.x * u_xlat11.x + u_xlat22.y;
					    u_xlat0.x = u_xlat11.x + u_xlat0.x;
					    u_xlat11.x = _WavesSpeed * _Time.y;
					    u_xlat11.x = _Waves * u_xlat2.y + u_xlat11.x;
					    u_xlat11.x = sin(u_xlat11.x);
					    u_xlat11.x = u_xlat11.x * _WavesPower;
					    u_xlat11.x = u_xlat11.x * vs_TEXCOORD1;
					    u_xlat2.z = u_xlat11.x * 0.00100000005 + u_xlat0.x;
					    u_xlat10_0 = texture(_corpsegp2, u_xlat2.zy);
					    u_xlat33 = vs_TEXCOORD1 * _egoffset;
					    u_xlat33 = u_xlat33 * 0.0199999996;
					    u_xlat1.xy = (-_ScreenParams.zw) + vec2(1.0, 1.0);
					    u_xlat23.xy = vec2(u_xlat33) * u_xlat1.xy;
					    u_xlat3 = u_xlat23.xyxy * vec4(0.0, 1.0, -1.0, 0.0) + u_xlat2.zyzy;
					    u_xlat10_4 = texture(_corpsegp2, u_xlat3.xy);
					    u_xlat10_3 = texture(_corpsegp2, u_xlat3.zw);
					    u_xlat16_5.xy = u_xlat10_3.xy + u_xlat10_4.xy;
					    u_xlat6 = u_xlat23.xyxy * vec4(-1.0, 1.0, 1.0, 0.0) + u_xlat2.zyzy;
					    u_xlat10_7 = texture(_corpsegp2, u_xlat6.xy);
					    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat10_7.xy;
					    u_xlat27.xy = (-u_xlat1.xy) * vec2(u_xlat33) + u_xlat2.zy;
					    u_xlat10_8 = texture(_corpsegp2, u_xlat27.xy);
					    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat10_8.xy;
					    u_xlat10_6 = texture(_corpsegp2, u_xlat6.zw);
					    u_xlat16_5.xy = u_xlat16_5.xy + (-u_xlat10_6.xy);
					    u_xlat9 = u_xlat23.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + u_xlat2.zyzy;
					    u_xlat10_10 = texture(_corpsegp2, u_xlat9.xy);
					    u_xlat16_23.xy = u_xlat16_5.xy + (-u_xlat10_10.xy);
					    u_xlat10_5 = texture(_corpsegp2, u_xlat9.zw);
					    u_xlat16_23.xy = u_xlat16_23.xy + (-u_xlat10_5.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(u_xlat33) + u_xlat2.zy;
					    u_xlat10_9 = texture(_corpsegp2, u_xlat1.xy);
					    u_xlat16_1.xy = u_xlat16_23.xy + (-u_xlat10_9.xy);
					    u_xlat16_4 = u_xlat10_4.yzzx + u_xlat10_9.yzzx;
					    u_xlat16_4 = u_xlat10_6.yzzx + u_xlat16_4;
					    u_xlat16_4 = u_xlat10_7.yzzx + u_xlat16_4;
					    u_xlat16_4 = (-u_xlat10_8.yzzx) + u_xlat16_4;
					    u_xlat16_23.xy = (-u_xlat10_10.yz) + u_xlat16_4.xy;
					    u_xlat16_23.xy = (-u_xlat10_3.yz) + u_xlat16_23.xy;
					    u_xlat16_23.xy = (-u_xlat10_5.yz) + u_xlat16_23.xy;
					    u_xlat16_14.xz = (-u_xlat10_10.zx) + u_xlat16_4.zw;
					    u_xlat16_3.xy = (-u_xlat10_3.zx) + u_xlat16_14.xz;
					    u_xlat16_3.xy = (-u_xlat10_5.zx) + u_xlat16_3.xy;
					    u_xlat16_23.xy = u_xlat16_23.xy * u_xlat16_23.xy;
					    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_1.xy + u_xlat16_23.xy;
					    u_xlat16_1.xy = u_xlat16_3.xy * u_xlat16_3.xy + u_xlat16_1.xy;
					    u_xlat16_33 = dot(u_xlat16_1.xy, u_xlat16_1.xy);
					    u_xlat16_33 = sqrt(u_xlat16_33);
					    u_xlat33 = u_xlat16_33 * _egpow;
					    u_xlat33 = u_xlat33 * 5.0;
					    u_xlat1.xyz = vec3(u_xlat33) * _egcol.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vs_TEXCOORD1);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat10_0.xyz + u_xlat1.xyz;
					    u_xlat1.xy = vec2(vs_TEXCOORD1) * vec2(_egspoffset, _HDR);
					    u_xlat33 = (-_egspcol) + 9.0;
					    u_xlat3.yz = (-u_xlat1.xx) * vec2(4.99999987e-05, 4.99999987e-05) + u_xlat2.zy;
					    u_xlat10_4 = texture(_corpsegp2, u_xlat3.yz);
					    u_xlat4.xyz = vec3(u_xlat33) * u_xlat0.xyz + (-u_xlat10_4.xyz);
					    u_xlat3.xw = u_xlat1.xx * vec2(4.99999987e-05, 4.99999987e-05) + u_xlat2.zy;
					    u_xlat10_5 = texture(_corpsegp2, u_xlat3.xz);
					    u_xlat1.xzw = u_xlat4.xyz + (-u_xlat10_5.xyz);
					    u_xlat10_4 = texture(_corpsegp2, u_xlat3.xw);
					    u_xlat1.xzw = u_xlat1.xzw + (-u_xlat10_4.xyz);
					    u_xlat10_4 = texture(_corpsegp2, u_xlat3.yw);
					    u_xlat1.xzw = u_xlat1.xzw + (-u_xlat10_4.xyz);
					    u_xlat2.xw = u_xlat3.wx;
					    u_xlat10_4 = texture(_corpsegp2, u_xlat2.zx);
					    u_xlat1.xzw = u_xlat1.xzw + (-u_xlat10_4.xyz);
					    u_xlat10_4 = texture(_corpsegp2, u_xlat2.wy);
					    u_xlat1.xzw = u_xlat1.xzw + (-u_xlat10_4.xyz);
					    u_xlat2.xw = u_xlat3.yz;
					    u_xlat10_3 = texture(_corpsegp2, u_xlat2.xy);
					    u_xlat1.xzw = u_xlat1.xzw + (-u_xlat10_3.xyz);
					    u_xlat10_3 = texture(_corpsegp2, u_xlat2.zw);
					    u_xlat1.xzw = u_xlat1.xzw + (-u_xlat10_3.xyz);
					    u_xlat1.xzw = (-u_xlat0.xyz) + u_xlat1.xzw;
					    u_xlat0.xyz = vec3(vs_TEXCOORD1) * u_xlat1.xzw + u_xlat0.xyz;
					    u_xlat33 = _HDRMultiplyer + 1.0;
					    u_xlat1.xzw = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat1.xzw = u_xlat0.xyz * u_xlat1.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat1.xzw = u_xlat0.xyz * u_xlat1.xzw;
					    u_xlat1.xzw = max(u_xlat1.xzw, u_xlat1.xzw);
					    u_xlat1.xzw = clamp(u_xlat1.xzw, 0.0, 1.0);
					    u_xlat1.xzw = vec3(u_xlat33) * u_xlat1.xzw + (-u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat1.yyy * u_xlat1.xzw + u_xlat0.xyz;
					    u_xlat1.x = vs_TEXCOORD1 * _grsc;
					    u_xlat2.x = _Contrast * vs_TEXCOORD1 + 1.0;
					    u_xlat2.y = u_xlat2.x * -0.5 + 0.5;
					    u_xlat0.w = 1.0;
					    u_xlat3.x = dot(u_xlat2.xy, u_xlat0.xw);
					    u_xlat3.y = dot(u_xlat2.xy, u_xlat0.yw);
					    u_xlat3.z = dot(u_xlat2.xy, u_xlat0.zw);
					    u_xlat0.x = dot(u_xlat3.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat11.xy = vec2(_threshold, _softness) + vec2(-1.0, -1.0);
					    u_xlat0.yz = vec2(vs_TEXCOORD1) * u_xlat11.xy + vec2(1.0, 1.0);
					    u_xlat12.xyz = _brightColor.xyz + _darkColor.xyz;
					    u_xlat2.xyw = u_xlat12.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlatb33 = u_xlat0.x>=u_xlat0.y;
					    u_xlat36 = (-u_xlat0.y) + u_xlat0.x;
					    u_xlat4.x = float(1.0) / u_xlat0.z;
					    u_xlat36 = u_xlat36 * u_xlat4.x;
					    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
					    u_xlat4.x = u_xlat36 * -2.0 + 3.0;
					    u_xlat36 = u_xlat36 * u_xlat36;
					    u_xlat36 = u_xlat36 * u_xlat4.x;
					    u_xlat4.xyz = (-u_xlat12.xyz) * vec3(0.5, 0.5, 0.5) + _brightColor.xyz;
					    u_xlat2.xyw = vec3(u_xlat36) * u_xlat4.xyz + u_xlat2.xyw;
					    u_xlat22.x = (-u_xlat0.z) + u_xlat0.y;
					    u_xlat0.xy = (-u_xlat22.xx) + u_xlat0.xy;
					    u_xlat11.x = float(1.0) / u_xlat0.y;
					    u_xlat0.x = u_xlat11.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat11.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat11.x;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(0.5, 0.5, 0.5) + (-_darkColor.xyz);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat12.xyz + _darkColor.xyz;
					    u_xlat0.xyz = (bool(u_xlatb33)) ? u_xlat2.xyw : u_xlat0.xyz;
					    u_xlat0.xyz = (-u_xlat3.xyz) + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + u_xlat3.xyz;
					    u_xlat1.xyz = _Colorm.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat1.xyz = vec3(vs_TEXCOORD1) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = _ColorL.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat1.xyz = vec3(vs_TEXCOORD1) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyw = _ColorR.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat2.xyw = vec3(vs_TEXCOORD1) * u_xlat2.xyw + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyw = (-u_xlat1.xyz) + u_xlat2.xyw;
					    u_xlat1.xyz = u_xlat2.zzz * u_xlat2.xyw + u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.w = _Alpha;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" "BLUR_OFF" "EDGYSPACE_ON" "HUE_OFF" "EDGEGLOW_ON" "ZOOM_FISHEYE" "SHAKE_ON" "WAVES_ON" "COLOR_GRADING_ON" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _Alpha;
						float _Zoom;
						int _Usernd;
						float _AmplitudeY;
						float _AmplitudeX;
						float _ysp;
						float _xsp;
						float _Amplitudefix;
						float _Waves;
						float _WavesSpeed;
						float _WavesPower;
						float _egoffset;
						float _egpow;
						vec4 _egcol;
						float _egspoffset;
						float _egspcol;
						float _HDR;
						float _HDRMultiplyer;
						float _Contrast;
						float _grsc;
						vec4 _Colorm;
						vec4 _ColorL;
						vec4 _ColorR;
						vec4 _brightColor;
						vec4 _darkColor;
						float _threshold;
						float _softness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
						vec4 _ScreenParams;
						vec4 unused_1_3[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[4];
						mat4x4 unity_StereoCameraProjection[2];
						vec4 unused_2_4[20];
						mat4x4 unity_StereoCameraToWorld[2];
						vec4 unused_2_6[4];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_8;
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_2_10;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _corpsegp2;
					in  vec4 vs_TEXCOORD0;
					in  float vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					int u_xlati0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					vec4 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					vec4 u_xlat10_5;
					vec4 u_xlat6;
					vec4 u_xlat10_6;
					vec3 u_xlat7;
					vec4 u_xlat10_7;
					vec4 u_xlat10_8;
					vec4 u_xlat9;
					vec4 u_xlat10_9;
					vec4 u_xlat10_10;
					vec4 u_xlat10_11;
					vec2 u_xlat12;
					bool u_xlatb12;
					vec3 u_xlat13;
					vec2 u_xlat16_13;
					float u_xlat14;
					float u_xlat15;
					bool u_xlatb15;
					vec2 u_xlat24;
					bool u_xlatb24;
					vec2 u_xlat25;
					float u_xlat26;
					vec2 u_xlat16_26;
					bool u_xlatb26;
					vec2 u_xlat27;
					float u_xlat36;
					float u_xlat16_36;
					bool u_xlatb36;
					float u_xlat37;
					float u_xlat38;
					float u_xlat39;
					void main()
					{
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlatb12 = 0.0!=unity_StereoCameraProjection[u_xlati0 / 4][u_xlati0 % 4].z;
					    u_xlatb24 = 0.0!=unity_StereoCameraProjection[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4].z;
					    u_xlatb12 = u_xlatb24 || u_xlatb12;
					    if(((int(u_xlatb12) * int(0xffffffffu)))!=0){discard;}
					    u_xlat12.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat1.xyz = (-unity_StereoWorldSpaceCameraPos[0].xyz) + unity_StereoWorldSpaceCameraPos[1].xyz;
					    u_xlat36 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat36 = inversesqrt(u_xlat36);
					    u_xlat1.xyz = vec3(u_xlat36) * u_xlat1.xyz;
					    u_xlat2.xyz = unity_StereoCameraToWorld[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4].xyz + unity_StereoCameraToWorld[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4].xyz;
					    u_xlat3.xyz = unity_StereoWorldSpaceCameraPos[0].xyz + unity_StereoWorldSpaceCameraPos[1].xyz;
					    u_xlat4.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat2.xyz = (-u_xlat3.xyz) * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					    u_xlat36 = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat1.xyz = (-vec3(u_xlat36)) * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(10000.0, 10000.0, 10000.0) + u_xlat4.xyz;
					    u_xlat2.xyz = u_xlat1.yyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4].xwy;
					    u_xlat1.xyw = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4].xwy * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4].xwy * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat1.xyz = u_xlat1.xyz + unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4].xwy;
					    u_xlat1.xzw = u_xlat1.xyz * vec3(0.5, 0.5, -0.5);
					    u_xlat0.xw = u_xlat1.zz + u_xlat1.xw;
					    u_xlati1 = unity_StereoEyeIndex;
					    u_xlat25.xy = u_xlat1.yy * unity_StereoScaleOffset[u_xlati1].zw;
					    u_xlat0.xw = u_xlat0.xw * unity_StereoScaleOffset[u_xlati1].xy + u_xlat25.xy;
					    u_xlat0.xw = u_xlat0.xw / u_xlat1.yy;
					    u_xlat13.xy = (-u_xlat0.xw) + u_xlat12.xy;
					    u_xlat37 = dot(u_xlat13.xy, u_xlat13.xy);
					    u_xlat2.x = sqrt(u_xlat37);
					    u_xlat14 = dot(u_xlat0.xw, u_xlat0.xw);
					    u_xlat14 = sqrt(u_xlat14);
					    u_xlat26 = 3.14159274 / u_xlat14;
					    u_xlat26 = u_xlat26 * _Zoom;
					    u_xlat26 = u_xlat26 * vs_TEXCOORD1;
					    u_xlat38 = u_xlat26 * 0.5;
					    u_xlatb26 = 0.0<u_xlat26;
					    u_xlat3.x = _ScreenParams.x / _ScreenParams.y;
					    u_xlatb15 = u_xlat3.x<0.5;
					    u_xlat15 = (u_xlatb15) ? u_xlat0.x : u_xlat0.w;
					    u_xlat14 = (u_xlatb26) ? u_xlat14 : u_xlat15;
					    u_xlat37 = inversesqrt(u_xlat37);
					    u_xlat13.xy = vec2(u_xlat37) * u_xlat13.xy;
					    u_xlat37 = u_xlat38 * u_xlat2.x;
					    u_xlat2.x = sin(u_xlat37);
					    u_xlat4.x = cos(u_xlat37);
					    u_xlat37 = u_xlat2.x / u_xlat4.x;
					    u_xlat13.xy = vec2(u_xlat37) * u_xlat13.xy;
					    u_xlat13.xy = vec2(u_xlat14) * u_xlat13.xy;
					    u_xlat37 = u_xlat38 * u_xlat14;
					    u_xlat2.x = sin(u_xlat37);
					    u_xlat4.x = cos(u_xlat37);
					    u_xlat37 = u_xlat2.x / u_xlat4.x;
					    u_xlat13.xy = u_xlat13.xy / vec2(u_xlat37);
					    u_xlat0.xw = u_xlat0.xw + u_xlat13.xy;
					    u_xlat0.xy = (bool(u_xlatb26)) ? u_xlat0.xw : u_xlat12.xy;
					    u_xlat24.xy = vec2(_AmplitudeY, _AmplitudeX) * vec2(vec2(_Amplitudefix, _Amplitudefix));
					    u_xlat24.xy = u_xlat24.xy * vec2(0.00300000003, 0.00300000003);
					    u_xlat13.xy = vec2(_ysp, _xsp) * _Time.yy;
					    u_xlat13.xy = sin(u_xlat13.xy);
					    u_xlat24.xy = u_xlat24.xy * u_xlat13.xy;
					    u_xlat24.xy = u_xlat24.xy * vec2(vs_TEXCOORD1);
					    u_xlat13.x = u_xlat3.x + u_xlat3.x;
					    u_xlat24.x = u_xlat24.x * u_xlat13.x;
					    u_xlat25.xy = _Time.yy + vec2(4.24861526, 9.45731163);
					    u_xlat2.xy = u_xlat25.xy * vec2(_ysp, _xsp);
					    u_xlat2.x = dot(u_xlat2.xx, vec2(0.366025418, 0.366025418));
					    u_xlat2.x = u_xlat25.x * _ysp + u_xlat2.x;
					    u_xlat2.x = floor(u_xlat2.x);
					    u_xlat25.x = u_xlat25.x * _ysp + (-u_xlat2.x);
					    u_xlat26 = dot(u_xlat2.xx, vec2(0.211324871, 0.211324871));
					    u_xlat25.x = u_xlat25.x + u_xlat26;
					    u_xlat3.xyz = u_xlat25.xxx + vec3(-0.577350259, 0.211324871, -0.788675129);
					    u_xlat26 = u_xlat2.x * 0.00346020772;
					    u_xlat26 = floor(u_xlat26);
					    u_xlat2.x = (-u_xlat26) * 289.0 + u_xlat2.x;
					    u_xlat4.xyz = u_xlat2.xxx + vec3(0.0, 1.0, 1.0);
					    u_xlat5.xyz = u_xlat4.xzz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
					    u_xlat5.xyz = u_xlat4.xzz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat5.xyz = floor(u_xlat5.xyz);
					    u_xlat4.xyz = (-u_xlat5.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat4.xyz;
					    u_xlat2.xzw = u_xlat2.xxx + u_xlat4.xyz;
					    u_xlat2.xzw = u_xlat2.xzw + vec3(0.0, 0.0, 1.0);
					    u_xlat4.xyz = u_xlat2.xzw * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xzw = u_xlat2.xzw * u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat2.xzw * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat4.xyz = floor(u_xlat4.xyz);
					    u_xlat2.xzw = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat2.xzw;
					    u_xlat4.x = dot(u_xlat25.xx, u_xlat25.xx);
					    u_xlat4.y = dot(u_xlat3.yz, u_xlat3.yz);
					    u_xlat4.z = dot(u_xlat3.xx, u_xlat3.xx);
					    u_xlat4.xyz = (-u_xlat4.xyz) + vec3(0.5, 0.5, 0.5);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat4.xyz * u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xyz * u_xlat4.xyz;
					    u_xlat2.xzw = u_xlat2.xzw * vec3(0.024390243, 0.024390243, 0.024390243);
					    u_xlat2.xzw = fract(u_xlat2.xzw);
					    u_xlat5.xyz = u_xlat2.xzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat6.xyz = abs(u_xlat5.xyz) + vec3(-0.5, -0.5, -0.5);
					    u_xlat2.xzw = u_xlat2.xzw * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
					    u_xlat2.xzw = floor(u_xlat2.xzw);
					    u_xlat2.xzw = (-u_xlat2.xzw) + u_xlat5.xyz;
					    u_xlat5.xyz = u_xlat6.xyz * u_xlat6.xyz;
					    u_xlat5.xyz = u_xlat2.xzw * u_xlat2.xzw + u_xlat5.xyz;
					    u_xlat5.xyz = (-u_xlat5.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
					    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
					    u_xlat39 = u_xlat25.x * u_xlat6.x;
					    u_xlat5.x = u_xlat2.x * u_xlat25.x + u_xlat39;
					    u_xlat27.xy = u_xlat3.zx * u_xlat6.yz;
					    u_xlat5.yz = u_xlat2.zw * u_xlat3.yx + u_xlat27.xy;
					    u_xlat25.x = dot(u_xlat4.xyz, u_xlat5.xyz);
					    u_xlat25.x = u_xlat25.x * _AmplitudeY;
					    u_xlat25.x = u_xlat25.x * _Amplitudefix;
					    u_xlat25.x = u_xlat25.x * vs_TEXCOORD1;
					    u_xlat13.x = u_xlat13.x * u_xlat25.x;
					    u_xlat25.x = float(_Usernd);
					    u_xlat13.x = u_xlat13.x * 0.390000015 + (-u_xlat24.x);
					    u_xlat24.x = u_xlat25.x * u_xlat13.x + u_xlat24.x;
					    u_xlat3.y = u_xlat24.x + u_xlat0.y;
					    u_xlat12.x = dot(u_xlat2.yy, vec2(0.366025418, 0.366025418));
					    u_xlat12.x = u_xlat25.y * _xsp + u_xlat12.x;
					    u_xlat12.x = floor(u_xlat12.x);
					    u_xlat24.x = u_xlat25.y * _xsp + (-u_xlat12.x);
					    u_xlat13.x = dot(u_xlat12.xx, vec2(0.211324871, 0.211324871));
					    u_xlat24.x = u_xlat24.x + u_xlat13.x;
					    u_xlat2.xyz = u_xlat24.xxx + vec3(-0.577350259, 0.211324871, -0.788675129);
					    u_xlat13.x = u_xlat12.x * 0.00346020772;
					    u_xlat13.x = floor(u_xlat13.x);
					    u_xlat12.x = (-u_xlat13.x) * 289.0 + u_xlat12.x;
					    u_xlat4.xyz = u_xlat12.xxx + vec3(0.0, 1.0, 1.0);
					    u_xlat5.xyz = u_xlat4.xzz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
					    u_xlat5.xyz = u_xlat4.xzz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat5.xyz = floor(u_xlat5.xyz);
					    u_xlat4.xyz = (-u_xlat5.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat12.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + vec3(0.0, 0.0, 1.0);
					    u_xlat5.xyz = u_xlat4.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
					    u_xlat5.xyz = u_xlat4.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat5.xyz = floor(u_xlat5.xyz);
					    u_xlat4.xyz = (-u_xlat5.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat4.xyz;
					    u_xlat5.x = dot(u_xlat24.xx, u_xlat24.xx);
					    u_xlat5.y = dot(u_xlat2.yz, u_xlat2.yz);
					    u_xlat5.z = dot(u_xlat2.xx, u_xlat2.xx);
					    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(0.5, 0.5, 0.5);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = u_xlat5.xyz * u_xlat5.xyz;
					    u_xlat5.xyz = u_xlat5.xyz * u_xlat5.xyz;
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
					    u_xlat4.xyz = fract(u_xlat4.xyz);
					    u_xlat6.xyz = u_xlat4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat7.xyz = abs(u_xlat6.xyz) + vec3(-0.5, -0.5, -0.5);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
					    u_xlat4.xyz = floor(u_xlat4.xyz);
					    u_xlat4.xyz = (-u_xlat4.xyz) + u_xlat6.xyz;
					    u_xlat6.xyz = u_xlat7.xyz * u_xlat7.xyz;
					    u_xlat6.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat6.xyz;
					    u_xlat6.xyz = (-u_xlat6.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
					    u_xlat5.xyz = u_xlat5.xyz * u_xlat6.xyz;
					    u_xlat12.x = u_xlat24.x * u_xlat7.x;
					    u_xlat6.x = u_xlat4.x * u_xlat24.x + u_xlat12.x;
					    u_xlat12.xy = u_xlat2.zx * u_xlat7.yz;
					    u_xlat6.yz = u_xlat4.yz * u_xlat2.yx + u_xlat12.xy;
					    u_xlat12.x = dot(u_xlat5.xyz, u_xlat6.xyz);
					    u_xlat12.x = u_xlat12.x * _AmplitudeX;
					    u_xlat12.x = u_xlat12.x * _Amplitudefix;
					    u_xlat12.x = u_xlat12.x * vs_TEXCOORD1;
					    u_xlat12.x = u_xlat12.x * 0.390000015 + (-u_xlat24.y);
					    u_xlat12.x = u_xlat25.x * u_xlat12.x + u_xlat24.y;
					    u_xlat0.x = u_xlat12.x + u_xlat0.x;
					    u_xlat12.x = _WavesSpeed * _Time.y;
					    u_xlat12.x = _Waves * u_xlat3.y + u_xlat12.x;
					    u_xlat12.x = sin(u_xlat12.x);
					    u_xlat12.x = u_xlat12.x * _WavesPower;
					    u_xlat12.x = u_xlat12.x * vs_TEXCOORD1;
					    u_xlat3.z = u_xlat12.x * 0.00100000005 + u_xlat0.x;
					    u_xlat10_0 = texture(_corpsegp2, u_xlat3.zy);
					    u_xlat36 = vs_TEXCOORD1 * _egoffset;
					    u_xlat36 = u_xlat36 * 0.0199999996;
					    u_xlat13.xy = (-_ScreenParams.zw) + vec2(1.0, 1.0);
					    u_xlat2.xy = vec2(u_xlat36) * u_xlat13.xy;
					    u_xlat4 = u_xlat2.xyxy * vec4(0.0, 1.0, -1.0, 0.0) + u_xlat3.zyzy;
					    u_xlat10_5 = texture(_corpsegp2, u_xlat4.xy);
					    u_xlat10_4 = texture(_corpsegp2, u_xlat4.zw);
					    u_xlat16_26.xy = u_xlat10_4.xy + u_xlat10_5.xy;
					    u_xlat6 = u_xlat2.xyxy * vec4(-1.0, 1.0, 1.0, 0.0) + u_xlat3.zyzy;
					    u_xlat10_7 = texture(_corpsegp2, u_xlat6.xy);
					    u_xlat16_26.xy = u_xlat16_26.xy + u_xlat10_7.xy;
					    u_xlat6.xy = (-u_xlat13.xy) * vec2(u_xlat36) + u_xlat3.zy;
					    u_xlat10_8 = texture(_corpsegp2, u_xlat6.xy);
					    u_xlat16_26.xy = u_xlat16_26.xy + u_xlat10_8.xy;
					    u_xlat10_6 = texture(_corpsegp2, u_xlat6.zw);
					    u_xlat16_26.xy = u_xlat16_26.xy + (-u_xlat10_6.xy);
					    u_xlat9 = u_xlat2.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + u_xlat3.zyzy;
					    u_xlat10_10 = texture(_corpsegp2, u_xlat9.xy);
					    u_xlat16_2.xy = u_xlat16_26.xy + (-u_xlat10_10.xy);
					    u_xlat10_9 = texture(_corpsegp2, u_xlat9.zw);
					    u_xlat16_2.xy = u_xlat16_2.xy + (-u_xlat10_9.xy);
					    u_xlat13.xy = u_xlat13.xy * vec2(u_xlat36) + u_xlat3.zy;
					    u_xlat10_11 = texture(_corpsegp2, u_xlat13.xy);
					    u_xlat16_13.xy = u_xlat16_2.xy + (-u_xlat10_11.xy);
					    u_xlat16_2 = u_xlat10_5.yzzx + u_xlat10_11.yzzx;
					    u_xlat16_2 = u_xlat10_6.yzzx + u_xlat16_2;
					    u_xlat16_2 = u_xlat10_7.yzzx + u_xlat16_2;
					    u_xlat16_2 = (-u_xlat10_8.yzzx) + u_xlat16_2;
					    u_xlat16_2 = (-u_xlat10_10.yzzx) + u_xlat16_2;
					    u_xlat16_2 = (-u_xlat10_4.yzzx) + u_xlat16_2;
					    u_xlat16_2 = (-u_xlat10_9.yzzx) + u_xlat16_2;
					    u_xlat16_2.xy = u_xlat16_2.xy * u_xlat16_2.xy;
					    u_xlat16_13.xy = u_xlat16_13.xy * u_xlat16_13.xy + u_xlat16_2.xy;
					    u_xlat16_13.xy = u_xlat16_2.zw * u_xlat16_2.zw + u_xlat16_13.xy;
					    u_xlat16_36 = dot(u_xlat16_13.xy, u_xlat16_13.xy);
					    u_xlat16_36 = sqrt(u_xlat16_36);
					    u_xlat36 = u_xlat16_36 * _egpow;
					    u_xlat36 = u_xlat36 * 5.0;
					    u_xlat13.xyz = vec3(u_xlat36) * _egcol.xyz;
					    u_xlat13.xyz = u_xlat13.xyz * vec3(vs_TEXCOORD1);
					    u_xlat13.xyz = max(u_xlat13.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat13.xyz = min(u_xlat13.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat0.xyz = u_xlat10_0.xyz + u_xlat13.xyz;
					    u_xlat13.xy = vec2(vs_TEXCOORD1) * vec2(_egspoffset, _HDR);
					    u_xlat36 = (-_egspcol) + 9.0;
					    u_xlat2.yz = (-u_xlat13.xx) * vec2(4.99999987e-05, 4.99999987e-05) + u_xlat3.zy;
					    u_xlat10_4 = texture(_corpsegp2, u_xlat2.yz);
					    u_xlat4.xyz = vec3(u_xlat36) * u_xlat0.xyz + (-u_xlat10_4.xyz);
					    u_xlat2.xw = u_xlat13.xx * vec2(4.99999987e-05, 4.99999987e-05) + u_xlat3.zy;
					    u_xlat10_5 = texture(_corpsegp2, u_xlat2.xz);
					    u_xlat4.xyz = u_xlat4.xyz + (-u_xlat10_5.xyz);
					    u_xlat10_5 = texture(_corpsegp2, u_xlat2.xw);
					    u_xlat4.xyz = u_xlat4.xyz + (-u_xlat10_5.xyz);
					    u_xlat10_5 = texture(_corpsegp2, u_xlat2.yw);
					    u_xlat4.xyz = u_xlat4.xyz + (-u_xlat10_5.xyz);
					    u_xlat3.xw = u_xlat2.wx;
					    u_xlat10_5 = texture(_corpsegp2, u_xlat3.zx);
					    u_xlat4.xyz = u_xlat4.xyz + (-u_xlat10_5.xyz);
					    u_xlat10_5 = texture(_corpsegp2, u_xlat3.wy);
					    u_xlat4.xyz = u_xlat4.xyz + (-u_xlat10_5.xyz);
					    u_xlat3.xw = u_xlat2.yz;
					    u_xlat10_2 = texture(_corpsegp2, u_xlat3.xy);
					    u_xlat2.xyz = (-u_xlat10_2.xyz) + u_xlat4.xyz;
					    u_xlat10_4 = texture(_corpsegp2, u_xlat3.zw);
					    u_xlat2.xyz = u_xlat2.xyz + (-u_xlat10_4.xyz);
					    u_xlat2.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
					    u_xlat0.xyz = vec3(vs_TEXCOORD1) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat36 = _HDRMultiplyer + 1.0;
					    u_xlat2.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
					    u_xlat2.xyz = vec3(u_xlat36) * u_xlat2.xyz + (-u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat13.yyy * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat13.x = vs_TEXCOORD1 * _grsc;
					    u_xlat2.x = _Contrast * vs_TEXCOORD1 + 1.0;
					    u_xlat2.y = u_xlat2.x * -0.5 + 0.5;
					    u_xlat0.w = 1.0;
					    u_xlat4.x = dot(u_xlat2.xy, u_xlat0.xw);
					    u_xlat4.y = dot(u_xlat2.xy, u_xlat0.yw);
					    u_xlat4.z = dot(u_xlat2.xy, u_xlat0.zw);
					    u_xlat0.x = dot(u_xlat4.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat12.xy = vec2(_threshold, _softness) + vec2(-1.0, -1.0);
					    u_xlat0.yz = vec2(vs_TEXCOORD1) * u_xlat12.xy + vec2(1.0, 1.0);
					    u_xlat2.xyz = _brightColor.xyz + _darkColor.xyz;
					    u_xlat3.xyw = u_xlat2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlatb36 = u_xlat0.x>=u_xlat0.y;
					    u_xlat25.x = (-u_xlat0.y) + u_xlat0.x;
					    u_xlat37 = float(1.0) / u_xlat0.z;
					    u_xlat25.x = u_xlat37 * u_xlat25.x;
					    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
					    u_xlat37 = u_xlat25.x * -2.0 + 3.0;
					    u_xlat25.x = u_xlat25.x * u_xlat25.x;
					    u_xlat25.x = u_xlat25.x * u_xlat37;
					    u_xlat5.xyz = (-u_xlat2.xyz) * vec3(0.5, 0.5, 0.5) + _brightColor.xyz;
					    u_xlat3.xyw = u_xlat25.xxx * u_xlat5.xyz + u_xlat3.xyw;
					    u_xlat24.x = (-u_xlat0.z) + u_xlat0.y;
					    u_xlat0.xy = (-u_xlat24.xx) + u_xlat0.xy;
					    u_xlat12.x = float(1.0) / u_xlat0.y;
					    u_xlat0.x = u_xlat12.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat12.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat12.x;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + (-_darkColor.xyz);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + _darkColor.xyz;
					    u_xlat0.xyz = (bool(u_xlatb36)) ? u_xlat3.xyw : u_xlat0.xyz;
					    u_xlat0.xyz = (-u_xlat4.xyz) + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat13.xxx * u_xlat0.xyz + u_xlat4.xyz;
					    u_xlat13.xyz = _Colorm.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat13.xyz = vec3(vs_TEXCOORD1) * u_xlat13.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat13.xyz;
					    u_xlat13.xyz = _ColorL.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat13.xyz = vec3(vs_TEXCOORD1) * u_xlat13.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = _ColorR.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat2.xyz = vec3(vs_TEXCOORD1) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat36 = u_xlat3.z + (-unity_StereoScaleOffset[u_xlati1].z);
					    u_xlat36 = u_xlat36 / unity_StereoScaleOffset[u_xlati1].x;
					    u_xlat2.xyz = (-u_xlat13.xyz) + u_xlat2.xyz;
					    u_xlat1.xyz = vec3(u_xlat36) * u_xlat2.xyz + u_xlat13.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.w = _Alpha;
					    return;
					}"
				}
			}
		}
		GrabPass {
			"_corpsegp3"
		}
		Pass {
			Tags { "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "QUEUE" = "Geometry+2145285568" "RenderType" = "Overlay" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZTest Always
			ZWrite Off
			Cull Front
			GpuProgramID 148283
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						float _fe;
						float _fs;
						vec4 unused_0_3;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityPerCameraRare {
						vec4 unused_2_0[18];
						mat4x4 unity_CameraToWorld;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_2[2];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out float vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat3;
					bool u_xlatb3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_CameraToWorld[1];
					    u_xlat0 = unity_CameraToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_CameraToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = unity_CameraToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToObject[1].xyz;
					    u_xlat1.xyz = unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.xyz = _WorldSpaceCameraPos.xyz + (-unity_ObjectToWorld[3].xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlatb3 = u_xlat1.x>=_fe;
					    u_xlat1.x = u_xlat1.x + (-_fs);
					    u_xlat3 = u_xlatb3 ? 1.0 : float(0.0);
					    u_xlat0 = (-u_xlat0) * vec4(u_xlat3) + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0 = u_xlat0;
					    u_xlat0.x = (-_fs) + _fe;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    vs_TEXCOORD1 = (-u_xlat0.x) * u_xlat1.x + 1.0;
					    vs_TEXCOORD1 = clamp(vs_TEXCOORD1, 0.0, 1.0);
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
						float _fe;
						float _fs;
						vec4 unused_0_3;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[28];
						mat4x4 unity_StereoCameraToWorld[2];
						vec4 unused_2_4[4];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_6[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out float vs_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					void main()
					{
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat1 = in_POSITION0.yyyy * unity_StereoCameraToWorld[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat1 = unity_StereoCameraToWorld[u_xlati0 / 4][u_xlati0 % 4] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_StereoCameraToWorld[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = unity_StereoCameraToWorld[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * in_POSITION0.wwww + u_xlat1;
					    u_xlat3.xyz = u_xlat1.yyy * unity_WorldToObject[1].xyz;
					    u_xlat3.xyz = unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = unity_WorldToObject[3].xyz * u_xlat1.www + u_xlat3.xyz;
					    u_xlat1 = u_xlat3.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat3.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * u_xlat3.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    u_xlat0 = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    u_xlat1.xyz = unity_StereoWorldSpaceCameraPos[0].xyz + unity_StereoWorldSpaceCameraPos[1].xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + (-unity_ObjectToWorld[3].xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlatb4 = u_xlat1.x>=_fe;
					    u_xlat1.x = u_xlat1.x + (-_fs);
					    u_xlat4 = u_xlatb4 ? 1.0 : float(0.0);
					    u_xlat0 = (-u_xlat0) * vec4(u_xlat4) + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0 = u_xlat0;
					    u_xlat0.x = (-_fs) + _fe;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    vs_TEXCOORD1 = (-u_xlat0.x) * u_xlat1.x + 1.0;
					    vs_TEXCOORD1 = clamp(vs_TEXCOORD1, 0.0, 1.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "NOISE_ON" "VIGNETTE_ON" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						float _fe;
						float _fs;
						vec4 unused_0_3[5];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityPerCameraRare {
						vec4 unused_2_0[18];
						mat4x4 unity_CameraToWorld;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_2[2];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out float vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat3;
					bool u_xlatb3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_CameraToWorld[1];
					    u_xlat0 = unity_CameraToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_CameraToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = unity_CameraToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToObject[1].xyz;
					    u_xlat1.xyz = unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.xyz = _WorldSpaceCameraPos.xyz + (-unity_ObjectToWorld[3].xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlatb3 = u_xlat1.x>=_fe;
					    u_xlat1.x = u_xlat1.x + (-_fs);
					    u_xlat3 = u_xlatb3 ? 1.0 : float(0.0);
					    u_xlat0 = (-u_xlat0) * vec4(u_xlat3) + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0 = u_xlat0;
					    u_xlat0.x = (-_fs) + _fe;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    vs_TEXCOORD1 = (-u_xlat0.x) * u_xlat1.x + 1.0;
					    vs_TEXCOORD1 = clamp(vs_TEXCOORD1, 0.0, 1.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" "NOISE_ON" "VIGNETTE_ON" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						float _fe;
						float _fs;
						vec4 unused_0_3[5];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[28];
						mat4x4 unity_StereoCameraToWorld[2];
						vec4 unused_2_4[4];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_6[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out float vs_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					void main()
					{
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat1 = in_POSITION0.yyyy * unity_StereoCameraToWorld[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat1 = unity_StereoCameraToWorld[u_xlati0 / 4][u_xlati0 % 4] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_StereoCameraToWorld[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = unity_StereoCameraToWorld[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * in_POSITION0.wwww + u_xlat1;
					    u_xlat3.xyz = u_xlat1.yyy * unity_WorldToObject[1].xyz;
					    u_xlat3.xyz = unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = unity_WorldToObject[3].xyz * u_xlat1.www + u_xlat3.xyz;
					    u_xlat1 = u_xlat3.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat3.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * u_xlat3.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    u_xlat0 = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    u_xlat1.xyz = unity_StereoWorldSpaceCameraPos[0].xyz + unity_StereoWorldSpaceCameraPos[1].xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + (-unity_ObjectToWorld[3].xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlatb4 = u_xlat1.x>=_fe;
					    u_xlat1.x = u_xlat1.x + (-_fs);
					    u_xlat4 = u_xlatb4 ? 1.0 : float(0.0);
					    u_xlat0 = (-u_xlat0) * vec4(u_xlat4) + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0 = u_xlat0;
					    u_xlat0.x = (-_fs) + _fe;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    vs_TEXCOORD1 = (-u_xlat0.x) * u_xlat1.x + 1.0;
					    vs_TEXCOORD1 = clamp(vs_TEXCOORD1, 0.0, 1.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "LINES_ON" "NOISE_ON" "VIGNETTE_ON" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						float _fe;
						float _fs;
						vec4 unused_0_3[5];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityPerCameraRare {
						vec4 unused_2_0[18];
						mat4x4 unity_CameraToWorld;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_2[2];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out float vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat3;
					bool u_xlatb3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_CameraToWorld[1];
					    u_xlat0 = unity_CameraToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_CameraToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = unity_CameraToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToObject[1].xyz;
					    u_xlat1.xyz = unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_WorldToObject[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_WorldToObject[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.xyz = _WorldSpaceCameraPos.xyz + (-unity_ObjectToWorld[3].xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlatb3 = u_xlat1.x>=_fe;
					    u_xlat1.x = u_xlat1.x + (-_fs);
					    u_xlat3 = u_xlatb3 ? 1.0 : float(0.0);
					    u_xlat0 = (-u_xlat0) * vec4(u_xlat3) + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0 = u_xlat0;
					    u_xlat0.x = (-_fs) + _fe;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    vs_TEXCOORD1 = (-u_xlat0.x) * u_xlat1.x + 1.0;
					    vs_TEXCOORD1 = clamp(vs_TEXCOORD1, 0.0, 1.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" "LINES_ON" "NOISE_ON" "VIGNETTE_ON" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						float _fe;
						float _fs;
						vec4 unused_0_3[5];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[28];
						mat4x4 unity_StereoCameraToWorld[2];
						vec4 unused_2_4[4];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_6[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out float vs_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					void main()
					{
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat1 = in_POSITION0.yyyy * unity_StereoCameraToWorld[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat1 = unity_StereoCameraToWorld[u_xlati0 / 4][u_xlati0 % 4] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_StereoCameraToWorld[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = unity_StereoCameraToWorld[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * in_POSITION0.wwww + u_xlat1;
					    u_xlat3.xyz = u_xlat1.yyy * unity_WorldToObject[1].xyz;
					    u_xlat3.xyz = unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = unity_WorldToObject[3].xyz * u_xlat1.www + u_xlat3.xyz;
					    u_xlat1 = u_xlat3.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat3.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * u_xlat3.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat1.zzzz + u_xlat2;
					    u_xlat0 = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat1.wwww + u_xlat2;
					    u_xlat1.xyz = unity_StereoWorldSpaceCameraPos[0].xyz + unity_StereoWorldSpaceCameraPos[1].xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + (-unity_ObjectToWorld[3].xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlatb4 = u_xlat1.x>=_fe;
					    u_xlat1.x = u_xlat1.x + (-_fs);
					    u_xlat4 = u_xlatb4 ? 1.0 : float(0.0);
					    u_xlat0 = (-u_xlat0) * vec4(u_xlat4) + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0 = u_xlat0;
					    u_xlat0.x = (-_fs) + _fe;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    vs_TEXCOORD1 = (-u_xlat0.x) * u_xlat1.x + 1.0;
					    vs_TEXCOORD1 = clamp(vs_TEXCOORD1, 0.0, 1.0);
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
						float _Alpha;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerCameraRare {
						vec4 unused_1_0[6];
						mat4x4 unity_CameraProjection;
						vec4 unused_1_2[12];
					};
					uniform  sampler2D _corpsegp3;
					in  vec4 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					bool u_xlatb1;
					void main()
					{
					    u_xlatb0 = unity_CameraProjection[0].z!=0.0;
					    u_xlatb1 = unity_CameraProjection[1].z!=0.0;
					    u_xlatb0 = u_xlatb1 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.xyz = vs_TEXCOORD0.xwy * vec3(0.5, 0.5, -0.5);
					    u_xlat0.xy = u_xlat0.yy + u_xlat0.xz;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0 = texture(_corpsegp3, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    SV_Target0.w = _Alpha;
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
						float _Alpha;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_1_0[32];
						mat4x4 unity_StereoCameraProjection[2];
						vec4 unused_1_2[30];
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _corpsegp3;
					in  vec4 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					int u_xlati0;
					bool u_xlatb0;
					vec2 u_xlat1;
					bool u_xlatb2;
					int u_xlati4;
					void main()
					{
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlatb2 = 0.0!=unity_StereoCameraProjection[u_xlati0 / 4][u_xlati0 % 4].z;
					    u_xlatb0 = 0.0!=unity_StereoCameraProjection[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4].z;
					    u_xlatb0 = u_xlatb0 || u_xlatb2;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.xyz = vs_TEXCOORD0.xwy * vec3(0.5, 0.5, -0.5);
					    u_xlat0.xy = u_xlat0.yy + u_xlat0.xz;
					    u_xlati4 = unity_StereoEyeIndex;
					    u_xlat1.xy = vs_TEXCOORD0.ww * unity_StereoScaleOffset[u_xlati4].zw;
					    u_xlat0.xy = u_xlat0.xy * unity_StereoScaleOffset[u_xlati4].xy + u_xlat1.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0 = texture(_corpsegp3, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    SV_Target0.w = _Alpha;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "NOISE_ON" "VIGNETTE_ON" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _Alpha;
						float _Dir;
						float _nspeed;
						float _Speedvg;
						float _Vignette;
						float _Vignettesmtf;
						int _Vignettecntr;
						float _bars;
						int _smb;
						float _TillingX;
						float _TillingY;
						vec4 _ncol;
						float _Noise;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					layout(std140) uniform UnityPerCameraRare {
						vec4 unused_2_0[6];
						mat4x4 unity_CameraProjection;
						vec4 unused_2_2[8];
						mat4x4 unity_CameraToWorld;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_3_1[6];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_2[2];
					};
					uniform  sampler2D _corpsegp3;
					in  vec4 vs_TEXCOORD0;
					in  float vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat10;
					float u_xlat11;
					bool u_xlatb11;
					vec3 u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					bool u_xlatb13;
					vec2 u_xlat22;
					float u_xlat23;
					vec2 u_xlat24;
					vec2 u_xlat26;
					float u_xlat33;
					float u_xlat34;
					bool u_xlatb34;
					float u_xlat36;
					bool u_xlatb36;
					void main()
					{
					    u_xlatb0 = unity_CameraProjection[0].z!=0.0;
					    u_xlatb11 = unity_CameraProjection[1].z!=0.0;
					    u_xlatb0 = u_xlatb11 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.xyz = vs_TEXCOORD0.xwy * vec3(0.5, 0.5, -0.5);
					    u_xlat0.xy = u_xlat0.yy + u_xlat0.xz;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat1.xyz = unity_CameraToWorld[2].xyz + unity_CameraToWorld[3].xyz;
					    u_xlat1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat2.xyz = u_xlat1.xyz * vec3(10000.0, 10000.0, 10000.0) + _WorldSpaceCameraPos.xyz;
					    u_xlat3.xyz = u_xlat2.yyy * unity_MatrixVP[1].xwy;
					    u_xlat2.xyw = unity_MatrixVP[0].xwy * u_xlat2.xxx + u_xlat3.xyz;
					    u_xlat2.xyz = unity_MatrixVP[2].xwy * u_xlat2.zzz + u_xlat2.xyw;
					    u_xlat2.xyz = u_xlat2.xyz + unity_MatrixVP[3].xwy;
					    u_xlat2.xzw = u_xlat2.xyz * vec3(0.5, 0.5, -0.5);
					    u_xlat22.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat22.xy = u_xlat22.xy / u_xlat2.yy;
					    u_xlat2.xyz = unity_ObjectToWorld[3].yyy * unity_MatrixVP[1].xwy;
					    u_xlat2.xyz = unity_MatrixVP[0].xwy * unity_ObjectToWorld[3].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_MatrixVP[2].xwy * unity_ObjectToWorld[3].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_MatrixVP[3].xwy * unity_ObjectToWorld[3].www + u_xlat2.xyz;
					    u_xlat2.xzw = u_xlat2.xyz * vec3(0.5, 0.5, -0.5);
					    u_xlat2.xz = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xz / u_xlat2.yy;
					    u_xlat3.xyz = (-_WorldSpaceCameraPos.xyz) + unity_ObjectToWorld[3].xyz;
					    u_xlat34 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat34 = inversesqrt(u_xlat34);
					    u_xlat1.xyz = vec3(u_xlat34) * u_xlat1.xyz;
					    u_xlat34 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat34 = inversesqrt(u_xlat34);
					    u_xlat3.xyz = vec3(u_xlat34) * u_xlat3.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlatb12 = _Dir<u_xlat1.x;
					    u_xlat1.x = u_xlat1.x + (-_Dir);
					    u_xlat23 = (-_Dir) + 1.0;
					    u_xlat1.x = u_xlat1.x / u_xlat23;
					    u_xlat1.x = u_xlatb12 ? u_xlat1.x : float(0.0);
					    u_xlat10_3 = texture(_corpsegp3, u_xlat0.xy);
					    u_xlat12.xy = _Time.yy * vec2(0.000833333354, 5.0);
					    u_xlatb34 = u_xlat12.x>=(-u_xlat12.x);
					    u_xlat12.x = fract(abs(u_xlat12.x));
					    u_xlat12.x = (u_xlatb34) ? u_xlat12.x : (-u_xlat12.x);
					    u_xlat12.x = u_xlat12.x * _nspeed;
					    u_xlat4 = u_xlat12.xxxx * vec4(-8387.04004, 7297.92041, 7425.35986, -7242.47998) + u_xlat0.xyxy;
					    u_xlat5.x = _TillingX;
					    u_xlat5.y = _TillingY;
					    u_xlat4 = u_xlat4 * u_xlat5.xyxy;
					    u_xlat5 = u_xlat4 * vec4(250.0, 250.0, 250.0, 250.0);
					    u_xlat12.x = dot(u_xlat5.xy, vec2(0.366025418, 0.366025418));
					    u_xlat12.xz = u_xlat4.xy * vec2(250.0, 250.0) + u_xlat12.xx;
					    u_xlat12.xz = floor(u_xlat12.xz);
					    u_xlat24.xy = u_xlat4.xy * vec2(250.0, 250.0) + (-u_xlat12.xz);
					    u_xlat36 = dot(u_xlat12.xz, vec2(0.211324871, 0.211324871));
					    u_xlat24.xy = u_xlat24.xy + vec2(u_xlat36);
					    u_xlatb36 = u_xlat24.y<u_xlat24.x;
					    u_xlat6 = u_xlat24.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
					    u_xlat7 = (bool(u_xlatb36)) ? vec4(0.0, 1.0, -1.0, -0.0) : vec4(1.0, 0.0, -0.0, -1.0);
					    u_xlat6.xy = u_xlat6.xy + u_xlat7.zw;
					    u_xlat4.xy = u_xlat12.xz * vec2(0.00346020772, 0.00346020772);
					    u_xlat4.xy = floor(u_xlat4.xy);
					    u_xlat12.xz = (-u_xlat4.xy) * vec2(289.0, 289.0) + u_xlat12.xz;
					    u_xlat8.x = float(0.0);
					    u_xlat8.z = float(1.0);
					    u_xlat8.y = u_xlat7.x;
					    u_xlat8.xyz = u_xlat12.zzz + u_xlat8.xyz;
					    u_xlat9.xyz = u_xlat8.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat8.xyz = u_xlat8.xyz * u_xlat9.xyz;
					    u_xlat9.xyz = u_xlat8.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat9.xyz = floor(u_xlat9.xyz);
					    u_xlat8.xyz = (-u_xlat9.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat8.xyz;
					    u_xlat8.xyz = u_xlat12.xxx + u_xlat8.xyz;
					    u_xlat7.x = float(0.0);
					    u_xlat7.z = float(1.0);
					    u_xlat7.xyz = u_xlat7.xyz + u_xlat8.xyz;
					    u_xlat8.xyz = u_xlat7.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz;
					    u_xlat8.xyz = u_xlat7.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat8.xyz = floor(u_xlat8.xyz);
					    u_xlat7.xyz = (-u_xlat8.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat7.xyz;
					    u_xlat8.x = dot(u_xlat24.xy, u_xlat24.xy);
					    u_xlat8.y = dot(u_xlat6.xy, u_xlat6.xy);
					    u_xlat8.z = dot(u_xlat6.zw, u_xlat6.zw);
					    u_xlat8.xyz = (-u_xlat8.xyz) + vec3(0.5, 0.5, 0.5);
					    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat8.xyz = u_xlat8.xyz * u_xlat8.xyz;
					    u_xlat8.xyz = u_xlat8.xyz * u_xlat8.xyz;
					    u_xlat7.xyz = u_xlat7.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
					    u_xlat7.xyz = fract(u_xlat7.xyz);
					    u_xlat9.xyz = u_xlat7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10.xyz = abs(u_xlat9.xyz) + vec3(-0.5, -0.5, -0.5);
					    u_xlat7.xyz = u_xlat7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
					    u_xlat7.xyz = floor(u_xlat7.xyz);
					    u_xlat7.xyz = (-u_xlat7.xyz) + u_xlat9.xyz;
					    u_xlat9.xyz = u_xlat10.xyz * u_xlat10.xyz;
					    u_xlat9.xyz = u_xlat7.xyz * u_xlat7.xyz + u_xlat9.xyz;
					    u_xlat9.xyz = (-u_xlat9.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
					    u_xlat8.xyz = u_xlat8.xyz * u_xlat9.xyz;
					    u_xlat12.x = u_xlat24.y * u_xlat10.x;
					    u_xlat9.x = u_xlat7.x * u_xlat24.x + u_xlat12.x;
					    u_xlat12.xz = u_xlat6.yw * u_xlat10.yz;
					    u_xlat9.yz = u_xlat7.yz * u_xlat6.xz + u_xlat12.xz;
					    u_xlat12.x = dot(u_xlat8.xyz, u_xlat9.xyz);
					    u_xlat12.x = u_xlat12.x * 130.0;
					    u_xlat34 = dot(u_xlat5.zw, vec2(0.366025418, 0.366025418));
					    u_xlat24.xy = u_xlat4.zw * vec2(250.0, 250.0) + vec2(u_xlat34);
					    u_xlat24.xy = floor(u_xlat24.xy);
					    u_xlat4.xy = u_xlat4.zw * vec2(250.0, 250.0) + (-u_xlat24.xy);
					    u_xlat34 = dot(u_xlat24.xy, vec2(0.211324871, 0.211324871));
					    u_xlat4.xy = vec2(u_xlat34) + u_xlat4.xy;
					    u_xlatb34 = u_xlat4.y<u_xlat4.x;
					    u_xlat5 = u_xlat4.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
					    u_xlat6 = (bool(u_xlatb34)) ? vec4(0.0, 1.0, -1.0, -0.0) : vec4(1.0, 0.0, -0.0, -1.0);
					    u_xlat5.xy = u_xlat5.xy + u_xlat6.zw;
					    u_xlat26.xy = u_xlat24.xy * vec2(0.00346020772, 0.00346020772);
					    u_xlat26.xy = floor(u_xlat26.xy);
					    u_xlat24.xy = (-u_xlat26.xy) * vec2(289.0, 289.0) + u_xlat24.xy;
					    u_xlat7.x = float(0.0);
					    u_xlat7.z = float(1.0);
					    u_xlat7.y = u_xlat6.x;
					    u_xlat7.xyz = u_xlat24.yyy + u_xlat7.xyz;
					    u_xlat8.xyz = u_xlat7.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz;
					    u_xlat8.xyz = u_xlat7.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat8.xyz = floor(u_xlat8.xyz);
					    u_xlat7.xyz = (-u_xlat8.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat7.xyz;
					    u_xlat7.xyz = u_xlat24.xxx + u_xlat7.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.z = float(1.0);
					    u_xlat6.xyz = u_xlat6.xyz + u_xlat7.xyz;
					    u_xlat7.xyz = u_xlat6.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xyz;
					    u_xlat7.xyz = u_xlat6.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat7.xyz = floor(u_xlat7.xyz);
					    u_xlat6.xyz = (-u_xlat7.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat6.xyz;
					    u_xlat7.x = dot(u_xlat4.xy, u_xlat4.xy);
					    u_xlat7.y = dot(u_xlat5.xy, u_xlat5.xy);
					    u_xlat7.z = dot(u_xlat5.zw, u_xlat5.zw);
					    u_xlat7.xyz = (-u_xlat7.xyz) + vec3(0.5, 0.5, 0.5);
					    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat7.xyz = u_xlat7.xyz * u_xlat7.xyz;
					    u_xlat7.xyz = u_xlat7.xyz * u_xlat7.xyz;
					    u_xlat6.xyz = u_xlat6.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
					    u_xlat6.xyz = fract(u_xlat6.xyz);
					    u_xlat8.xyz = u_xlat6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat9.xyz = abs(u_xlat8.xyz) + vec3(-0.5, -0.5, -0.5);
					    u_xlat6.xyz = u_xlat6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
					    u_xlat6.xyz = floor(u_xlat6.xyz);
					    u_xlat6.xyz = (-u_xlat6.xyz) + u_xlat8.xyz;
					    u_xlat8.xyz = u_xlat9.xyz * u_xlat9.xyz;
					    u_xlat8.xyz = u_xlat6.xyz * u_xlat6.xyz + u_xlat8.xyz;
					    u_xlat8.xyz = (-u_xlat8.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
					    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz;
					    u_xlat34 = u_xlat4.y * u_xlat9.x;
					    u_xlat4.x = u_xlat6.x * u_xlat4.x + u_xlat34;
					    u_xlat24.xy = u_xlat5.yw * u_xlat9.yz;
					    u_xlat4.yz = u_xlat6.yz * u_xlat5.xz + u_xlat24.xy;
					    u_xlat34 = dot(u_xlat7.xyz, u_xlat4.xyz);
					    u_xlat12.z = u_xlat34 * 130.0;
					    u_xlat12.xz = fract(u_xlat12.xz);
					    u_xlat12.x = u_xlat12.z + u_xlat12.x;
					    u_xlat12.x = (-u_xlat12.x) + 1.0;
					    u_xlat12.x = max(u_xlat12.x, 0.0);
					    u_xlat34 = u_xlat12.x * 5.0;
					    u_xlat34 = min(u_xlat34, 1.0);
					    u_xlat4.xyz = vec3(u_xlat34) + u_xlat10_3.xyz;
					    u_xlat4.xyz = u_xlat4.xyz * _ncol.xyz;
					    u_xlat4.xyz = u_xlat10_3.xyz * u_xlat12.xxx + u_xlat4.xyz;
					    u_xlat12.x = vs_TEXCOORD1 * _Noise;
					    u_xlat4.xyz = (-u_xlat10_3.xyz) + u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat12.xxx * u_xlat4.xyz + u_xlat10_3.xyz;
					    u_xlat12.xz = vec2(ivec2(_Vignettecntr, _smb));
					    u_xlat2.xy = (-u_xlat22.xy) + u_xlat2.xy;
					    u_xlat22.xy = u_xlat12.xx * u_xlat2.xy + u_xlat22.xy;
					    u_xlat2.x = u_xlat1.x + -1.0;
					    u_xlat12.x = u_xlat12.x * u_xlat2.x + 1.0;
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat2.x = (-u_xlat1.x) + _Vignette;
					    u_xlat1.x = u_xlat12.x * u_xlat2.x + u_xlat1.x;
					    u_xlat2.x = u_xlat1.x * vs_TEXCOORD1;
					    u_xlatb13 = _Speedvg==0.0;
					    u_xlat13 = (u_xlatb13) ? 0.0 : _Time.y;
					    u_xlat23 = cos(u_xlat12.y);
					    u_xlat23 = _Speedvg * u_xlat23 + u_xlat13;
					    u_xlat23 = sin(u_xlat23);
					    u_xlat23 = u_xlat23 * 0.300000012 + 3.0;
					    u_xlat13 = (-u_xlat2.x) * _Vignettesmtf + 1.0;
					    u_xlat24.x = _Vignettesmtf + 1.0;
					    u_xlat24.x = u_xlat24.x + u_xlat24.x;
					    u_xlat0.xz = (-u_xlat22.xy) + u_xlat0.xy;
					    u_xlat0.x = dot(u_xlat0.xz, u_xlat0.xz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat22.x = (-u_xlat1.x) * vs_TEXCOORD1 + 1.0;
					    u_xlat33 = (-u_xlat24.x) * u_xlat0.x + u_xlat0.x;
					    u_xlat0.x = (-u_xlat24.x) * u_xlat0.x + u_xlat22.x;
					    u_xlat22.x = float(1.0) / u_xlat33;
					    u_xlat0.x = u_xlat22.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat22.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat22.x) * u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat13;
					    u_xlat22.x = sqrt(u_xlat2.x);
					    u_xlat22.x = u_xlat23 * u_xlat22.x;
					    u_xlat22.x = u_xlat22.x * 0.5;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat22.x;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.xy = u_xlat0.xy + vec2(-1.0, -0.500100017);
					    u_xlat0.x = u_xlat12.x * u_xlat0.x + 1.0;
					    u_xlat0.xzw = u_xlat0.xxx * u_xlat3.xyz;
					    u_xlat1.x = vs_TEXCOORD1 * _bars;
					    u_xlat1.x = (-u_xlat1.x) * 0.00499999989 + 0.5;
					    u_xlatb12 = u_xlat1.x>=abs(u_xlat0.y);
					    u_xlat23 = u_xlatb12 ? 1.0 : float(0.0);
					    u_xlat2.x = -abs(u_xlat0.y) + 0.5;
					    u_xlat11 = -abs(u_xlat0.y) + u_xlat1.x;
					    u_xlat1.x = float(1.0) / u_xlat2.x;
					    u_xlat11 = u_xlat11 * u_xlat1.x;
					    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
					    u_xlat1.x = u_xlat11 * -2.0 + 3.0;
					    u_xlat11 = u_xlat11 * u_xlat11;
					    u_xlat12.x = (u_xlatb12) ? -1.0 : -0.0;
					    u_xlat11 = u_xlat1.x * u_xlat11 + u_xlat12.x;
					    u_xlat11 = u_xlat12.z * u_xlat11 + u_xlat23;
					    SV_Target0.xyz = vec3(u_xlat11) * u_xlat0.xzw;
					    SV_Target0.w = _Alpha;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" "NOISE_ON" "VIGNETTE_ON" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _Alpha;
						float _Dir;
						float _nspeed;
						float _Speedvg;
						float _Vignette;
						float _Vignettesmtf;
						int _Vignettecntr;
						float _bars;
						int _smb;
						float _TillingX;
						float _TillingY;
						vec4 _ncol;
						float _Noise;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
						vec4 _ScreenParams;
						vec4 unused_1_3[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_2[4];
						mat4x4 unity_StereoCameraProjection[2];
						vec4 unused_3_4[20];
						mat4x4 unity_StereoCameraToWorld[2];
						vec4 unused_3_6[4];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_8;
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_3_10;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _corpsegp3;
					in  vec4 vs_TEXCOORD0;
					in  float vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					int u_xlati0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					bool u_xlatb2;
					vec4 u_xlat3;
					bool u_xlatb3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat10;
					bool u_xlatb10;
					float u_xlat11;
					bool u_xlatb11;
					float u_xlat12;
					float u_xlat13;
					float u_xlat14;
					vec3 u_xlat15;
					float u_xlat20;
					bool u_xlatb20;
					float u_xlat21;
					vec2 u_xlat24;
					float u_xlat30;
					int u_xlati30;
					float u_xlat31;
					float u_xlat32;
					bool u_xlatb32;
					float u_xlat33;
					bool u_xlatb33;
					void main()
					{
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlatb10 = 0.0!=unity_StereoCameraProjection[u_xlati0 / 4][u_xlati0 % 4].z;
					    u_xlatb20 = 0.0!=unity_StereoCameraProjection[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4].z;
					    u_xlatb10 = u_xlatb20 || u_xlatb10;
					    if(((int(u_xlatb10) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10.xyz = vs_TEXCOORD0.xwy * vec3(0.5, 0.5, -0.5);
					    u_xlat10.xy = u_xlat10.yy + u_xlat10.xz;
					    u_xlati30 = unity_StereoEyeIndex;
					    u_xlat1.xy = vs_TEXCOORD0.ww * unity_StereoScaleOffset[u_xlati30].zw;
					    u_xlat10.xy = u_xlat10.xy * unity_StereoScaleOffset[u_xlati30].xy + u_xlat1.xy;
					    u_xlat1.yz = u_xlat10.xy / vs_TEXCOORD0.ww;
					    u_xlat2.xyz = (-unity_StereoWorldSpaceCameraPos[0].xyz) + unity_StereoWorldSpaceCameraPos[1].xyz;
					    u_xlat10.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10.x = inversesqrt(u_xlat10.x);
					    u_xlat2.xyz = u_xlat10.xxx * u_xlat2.xyz;
					    u_xlat3.xyz = unity_StereoCameraToWorld[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4].xyz + unity_StereoCameraToWorld[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4].xyz;
					    u_xlat4.xyz = unity_StereoWorldSpaceCameraPos[0].xyz + unity_StereoWorldSpaceCameraPos[1].xyz;
					    u_xlat5.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (-u_xlat4.xyz) * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat10.x = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat2.xyz = (-u_xlat10.xxx) * u_xlat2.xyz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * vec3(10000.0, 10000.0, 10000.0) + u_xlat5.xyz;
					    u_xlat5.xyz = u_xlat3.yyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4].xwy;
					    u_xlat3.xyw = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4].xwy * u_xlat3.xxx + u_xlat5.xyz;
					    u_xlat3.xyz = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4].xwy * u_xlat3.zzz + u_xlat3.xyw;
					    u_xlat3.xyz = u_xlat3.xyz + unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4].xwy;
					    u_xlat3.xzw = u_xlat3.xyz * vec3(0.5, 0.5, -0.5);
					    u_xlat10.xy = u_xlat3.zz + u_xlat3.xw;
					    u_xlat3.xz = u_xlat3.yy * unity_StereoScaleOffset[u_xlati30].zw;
					    u_xlat10.xy = u_xlat10.xy * unity_StereoScaleOffset[u_xlati30].xy + u_xlat3.xz;
					    u_xlat10.xy = u_xlat10.xy / u_xlat3.yy;
					    u_xlat3.xyz = unity_ObjectToWorld[3].yyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4].xwy;
					    u_xlat3.xyz = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4].xwy * unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4].xwy * unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4].xwy * unity_ObjectToWorld[3].www + u_xlat3.xyz;
					    u_xlat3.xzw = u_xlat3.xyz * vec3(0.5, 0.5, -0.5);
					    u_xlat3.xz = u_xlat3.zz + u_xlat3.xw;
					    u_xlat5.xy = u_xlat3.yy * unity_StereoScaleOffset[u_xlati30].zw;
					    u_xlat0.xw = u_xlat3.xz * unity_StereoScaleOffset[u_xlati30].xy + u_xlat5.xy;
					    u_xlat0.xw = u_xlat0.xw / u_xlat3.yy;
					    u_xlat3.xyz = (-u_xlat4.xyz) * vec3(0.5, 0.5, 0.5) + unity_ObjectToWorld[3].xyz;
					    u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat31 = inversesqrt(u_xlat31);
					    u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
					    u_xlat31 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat31 = inversesqrt(u_xlat31);
					    u_xlat3.xyz = vec3(u_xlat31) * u_xlat3.xyz;
					    u_xlat31 = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlatb2 = _Dir<u_xlat31;
					    u_xlat31 = u_xlat31 + (-_Dir);
					    u_xlat12 = (-_Dir) + 1.0;
					    u_xlat31 = u_xlat31 / u_xlat12;
					    u_xlat31 = u_xlatb2 ? u_xlat31 : float(0.0);
					    u_xlat10_2 = texture(_corpsegp3, u_xlat1.yz);
					    u_xlat3.xy = _Time.yy * vec2(0.000833333354, 5.0);
					    u_xlatb32 = u_xlat3.x>=(-u_xlat3.x);
					    u_xlat3.x = fract(abs(u_xlat3.x));
					    u_xlat32 = (u_xlatb32) ? u_xlat3.x : (-u_xlat3.x);
					    u_xlat32 = u_xlat32 * _nspeed;
					    u_xlat4 = vec4(u_xlat32) * vec4(-8387.04004, 7297.92041, 7425.35986, -7242.47998) + u_xlat1.yzyz;
					    u_xlat5.x = _TillingX;
					    u_xlat5.y = _TillingY;
					    u_xlat4 = u_xlat4 * u_xlat5.xyxy;
					    u_xlat5 = u_xlat4 * vec4(250.0, 250.0, 250.0, 250.0);
					    u_xlat32 = dot(u_xlat5.xy, vec2(0.366025418, 0.366025418));
					    u_xlat3.xz = u_xlat4.xy * vec2(250.0, 250.0) + vec2(u_xlat32);
					    u_xlat3.xz = floor(u_xlat3.xz);
					    u_xlat4.xy = u_xlat4.xy * vec2(250.0, 250.0) + (-u_xlat3.xz);
					    u_xlat32 = dot(u_xlat3.xz, vec2(0.211324871, 0.211324871));
					    u_xlat4.xy = vec2(u_xlat32) + u_xlat4.xy;
					    u_xlatb32 = u_xlat4.y<u_xlat4.x;
					    u_xlat6 = u_xlat4.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
					    u_xlat7 = (bool(u_xlatb32)) ? vec4(0.0, 1.0, -1.0, -0.0) : vec4(1.0, 0.0, -0.0, -1.0);
					    u_xlat6.xy = u_xlat6.xy + u_xlat7.zw;
					    u_xlat5.xy = u_xlat3.xz * vec2(0.00346020772, 0.00346020772);
					    u_xlat5.xy = floor(u_xlat5.xy);
					    u_xlat3.xz = (-u_xlat5.xy) * vec2(289.0, 289.0) + u_xlat3.xz;
					    u_xlat8.x = float(0.0);
					    u_xlat8.z = float(1.0);
					    u_xlat8.y = u_xlat7.x;
					    u_xlat8.xyz = u_xlat3.zzz + u_xlat8.xyz;
					    u_xlat9.xyz = u_xlat8.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat8.xyz = u_xlat8.xyz * u_xlat9.xyz;
					    u_xlat9.xyz = u_xlat8.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat9.xyz = floor(u_xlat9.xyz);
					    u_xlat8.xyz = (-u_xlat9.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat8.xyz;
					    u_xlat3.xzw = u_xlat3.xxx + u_xlat8.xyz;
					    u_xlat7.x = float(0.0);
					    u_xlat7.z = float(1.0);
					    u_xlat3.xzw = u_xlat3.xzw + u_xlat7.xyz;
					    u_xlat7.xyz = u_xlat3.xzw * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat3.xzw = u_xlat3.xzw * u_xlat7.xyz;
					    u_xlat7.xyz = u_xlat3.xzw * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat7.xyz = floor(u_xlat7.xyz);
					    u_xlat3.xzw = (-u_xlat7.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat3.xzw;
					    u_xlat7.x = dot(u_xlat4.xy, u_xlat4.xy);
					    u_xlat7.y = dot(u_xlat6.xy, u_xlat6.xy);
					    u_xlat7.z = dot(u_xlat6.zw, u_xlat6.zw);
					    u_xlat7.xyz = (-u_xlat7.xyz) + vec3(0.5, 0.5, 0.5);
					    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat7.xyz = u_xlat7.xyz * u_xlat7.xyz;
					    u_xlat7.xyz = u_xlat7.xyz * u_xlat7.xyz;
					    u_xlat3.xzw = u_xlat3.xzw * vec3(0.024390243, 0.024390243, 0.024390243);
					    u_xlat3.xzw = fract(u_xlat3.xzw);
					    u_xlat8.xyz = u_xlat3.xzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat9.xyz = abs(u_xlat8.xyz) + vec3(-0.5, -0.5, -0.5);
					    u_xlat3.xzw = u_xlat3.xzw * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
					    u_xlat3.xzw = floor(u_xlat3.xzw);
					    u_xlat3.xzw = (-u_xlat3.xzw) + u_xlat8.xyz;
					    u_xlat8.xyz = u_xlat9.xyz * u_xlat9.xyz;
					    u_xlat8.xyz = u_xlat3.xzw * u_xlat3.xzw + u_xlat8.xyz;
					    u_xlat8.xyz = (-u_xlat8.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
					    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz;
					    u_xlat32 = u_xlat4.y * u_xlat9.x;
					    u_xlat8.x = u_xlat3.x * u_xlat4.x + u_xlat32;
					    u_xlat4.xy = u_xlat6.yw * u_xlat9.yz;
					    u_xlat8.yz = u_xlat3.zw * u_xlat6.xz + u_xlat4.xy;
					    u_xlat32 = dot(u_xlat7.xyz, u_xlat8.xyz);
					    u_xlat32 = u_xlat32 * 130.0;
					    u_xlat32 = fract(u_xlat32);
					    u_xlat3.x = dot(u_xlat5.zw, vec2(0.366025418, 0.366025418));
					    u_xlat3.xz = u_xlat4.zw * vec2(250.0, 250.0) + u_xlat3.xx;
					    u_xlat3.xz = floor(u_xlat3.xz);
					    u_xlat4.xy = u_xlat4.zw * vec2(250.0, 250.0) + (-u_xlat3.xz);
					    u_xlat33 = dot(u_xlat3.xz, vec2(0.211324871, 0.211324871));
					    u_xlat4.xy = vec2(u_xlat33) + u_xlat4.xy;
					    u_xlatb33 = u_xlat4.y<u_xlat4.x;
					    u_xlat5 = u_xlat4.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
					    u_xlat6 = (bool(u_xlatb33)) ? vec4(0.0, 1.0, -1.0, -0.0) : vec4(1.0, 0.0, -0.0, -1.0);
					    u_xlat5.xy = u_xlat5.xy + u_xlat6.zw;
					    u_xlat24.xy = u_xlat3.xz * vec2(0.00346020772, 0.00346020772);
					    u_xlat24.xy = floor(u_xlat24.xy);
					    u_xlat3.xz = (-u_xlat24.xy) * vec2(289.0, 289.0) + u_xlat3.xz;
					    u_xlat7.x = float(0.0);
					    u_xlat7.z = float(1.0);
					    u_xlat7.y = u_xlat6.x;
					    u_xlat7.xyz = u_xlat3.zzz + u_xlat7.xyz;
					    u_xlat8.xyz = u_xlat7.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz;
					    u_xlat8.xyz = u_xlat7.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat8.xyz = floor(u_xlat8.xyz);
					    u_xlat7.xyz = (-u_xlat8.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat7.xyz;
					    u_xlat3.xzw = u_xlat3.xxx + u_xlat7.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.z = float(1.0);
					    u_xlat3.xzw = u_xlat3.xzw + u_xlat6.xyz;
					    u_xlat6.xyz = u_xlat3.xzw * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat3.xzw = u_xlat3.xzw * u_xlat6.xyz;
					    u_xlat6.xyz = u_xlat3.xzw * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat6.xyz = floor(u_xlat6.xyz);
					    u_xlat3.xzw = (-u_xlat6.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat3.xzw;
					    u_xlat6.x = dot(u_xlat4.xy, u_xlat4.xy);
					    u_xlat6.y = dot(u_xlat5.xy, u_xlat5.xy);
					    u_xlat6.z = dot(u_xlat5.zw, u_xlat5.zw);
					    u_xlat6.xyz = (-u_xlat6.xyz) + vec3(0.5, 0.5, 0.5);
					    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat6.xyz = u_xlat6.xyz * u_xlat6.xyz;
					    u_xlat6.xyz = u_xlat6.xyz * u_xlat6.xyz;
					    u_xlat3.xzw = u_xlat3.xzw * vec3(0.024390243, 0.024390243, 0.024390243);
					    u_xlat3.xzw = fract(u_xlat3.xzw);
					    u_xlat7.xyz = u_xlat3.xzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat8.xyz = abs(u_xlat7.xyz) + vec3(-0.5, -0.5, -0.5);
					    u_xlat3.xzw = u_xlat3.xzw * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
					    u_xlat3.xzw = floor(u_xlat3.xzw);
					    u_xlat3.xzw = (-u_xlat3.xzw) + u_xlat7.xyz;
					    u_xlat7.xyz = u_xlat8.xyz * u_xlat8.xyz;
					    u_xlat7.xyz = u_xlat3.xzw * u_xlat3.xzw + u_xlat7.xyz;
					    u_xlat7.xyz = (-u_xlat7.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
					    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xyz;
					    u_xlat14 = u_xlat4.y * u_xlat8.x;
					    u_xlat4.x = u_xlat3.x * u_xlat4.x + u_xlat14;
					    u_xlat15.xz = u_xlat5.yw * u_xlat8.yz;
					    u_xlat4.yz = u_xlat3.zw * u_xlat5.xz + u_xlat15.xz;
					    u_xlat3.x = dot(u_xlat6.xyz, u_xlat4.xyz);
					    u_xlat3.x = u_xlat3.x * 130.0;
					    u_xlat3.x = fract(u_xlat3.x);
					    u_xlat32 = u_xlat32 + u_xlat3.x;
					    u_xlat32 = (-u_xlat32) + 1.0;
					    u_xlat32 = max(u_xlat32, 0.0);
					    u_xlat3.x = u_xlat32 * 5.0;
					    u_xlat3.x = min(u_xlat3.x, 1.0);
					    u_xlat3.xzw = u_xlat10_2.xyz + u_xlat3.xxx;
					    u_xlat3.xzw = u_xlat3.xzw * _ncol.xyz;
					    u_xlat3.xzw = u_xlat10_2.xyz * vec3(u_xlat32) + u_xlat3.xzw;
					    u_xlat32 = vs_TEXCOORD1 * _Noise;
					    u_xlat3.xzw = (-u_xlat10_2.xyz) + u_xlat3.xzw;
					    u_xlat2.xyz = vec3(u_xlat32) * u_xlat3.xzw + u_xlat10_2.xyz;
					    u_xlat3.xz = vec2(ivec2(_Vignettecntr, _smb));
					    u_xlat0.xw = (-u_xlat10.xy) + u_xlat0.xw;
					    u_xlat0.yz = u_xlat3.xx * u_xlat0.xw + u_xlat10.xy;
					    u_xlat30 = u_xlat31 + -1.0;
					    u_xlat30 = u_xlat3.x * u_xlat30 + 1.0;
					    u_xlat31 = (-u_xlat31) + 1.0;
					    u_xlat32 = (-u_xlat31) + _Vignette;
					    u_xlat31 = u_xlat30 * u_xlat32 + u_xlat31;
					    u_xlat32 = u_xlat31 * vs_TEXCOORD1;
					    u_xlatb3 = _Speedvg==0.0;
					    u_xlat3.x = (u_xlatb3) ? 0.0 : _Time.y;
					    u_xlat13 = cos(u_xlat3.y);
					    u_xlat3.x = _Speedvg * u_xlat13 + u_xlat3.x;
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 0.300000012 + 3.0;
					    u_xlat13 = (-u_xlat32) * _Vignettesmtf + 1.0;
					    u_xlat33 = _Vignettesmtf + 1.0;
					    u_xlat33 = u_xlat33 + u_xlat33;
					    u_xlat4.x = _ScreenParams.x / _ScreenParams.y;
					    u_xlat4.x = u_xlat4.x + u_xlat4.x;
					    u_xlat1.x = u_xlat1.y / u_xlat4.x;
					    u_xlat0.x = u_xlat0.y / u_xlat4.x;
					    u_xlat0.xy = (-u_xlat0.xz) + u_xlat1.xz;
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat10.x = u_xlat0.x * u_xlat33;
					    u_xlat20 = (-u_xlat31) * vs_TEXCOORD1 + 1.0;
					    u_xlat0.x = (-u_xlat33) * u_xlat0.x + u_xlat0.x;
					    u_xlat10.x = u_xlat20 * 0.5 + (-u_xlat10.x);
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat10.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat10.x) * u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat13;
					    u_xlat10.x = u_xlat32 * 0.5;
					    u_xlat10.x = sqrt(u_xlat10.x);
					    u_xlat10.x = u_xlat3.x * u_xlat10.x;
					    u_xlat10.x = u_xlat10.x * 0.5;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat10.x;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + -1.0;
					    u_xlat0.x = u_xlat30 * u_xlat0.x + 1.0;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat30 = u_xlat1.z + -0.500100017;
					    u_xlat1.x = vs_TEXCOORD1 * _bars;
					    u_xlat1.x = (-u_xlat1.x) * 0.00499999989 + 0.5;
					    u_xlatb11 = u_xlat1.x>=abs(u_xlat30);
					    u_xlat21 = u_xlatb11 ? 1.0 : float(0.0);
					    u_xlat31 = -abs(u_xlat30) + 0.5;
					    u_xlat30 = -abs(u_xlat30) + u_xlat1.x;
					    u_xlat1.x = float(1.0) / u_xlat31;
					    u_xlat30 = u_xlat30 * u_xlat1.x;
					    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
					    u_xlat1.x = u_xlat30 * -2.0 + 3.0;
					    u_xlat30 = u_xlat30 * u_xlat30;
					    u_xlat11 = (u_xlatb11) ? -1.0 : -0.0;
					    u_xlat30 = u_xlat1.x * u_xlat30 + u_xlat11;
					    u_xlat30 = u_xlat3.z * u_xlat30 + u_xlat21;
					    SV_Target0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
					    SV_Target0.w = _Alpha;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "LINES_ON" "NOISE_ON" "VIGNETTE_ON" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _Alpha;
						float _Dir;
						float _nspeed;
						float _Speedvg;
						float _Vignette;
						float _Vignettesmtf;
						int _Vignettecntr;
						float _bars;
						int _smb;
						float _TillingX;
						float _TillingY;
						vec4 _ncol;
						float _Noise;
						float _lines;
						float _linescount;
						float _linesspeed;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					layout(std140) uniform UnityPerCameraRare {
						vec4 unused_2_0[6];
						mat4x4 unity_CameraProjection;
						vec4 unused_2_2[8];
						mat4x4 unity_CameraToWorld;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_3_1[6];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_2[2];
					};
					uniform  sampler2D _corpsegp3;
					in  vec4 vs_TEXCOORD0;
					in  float vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat10;
					float u_xlat11;
					bool u_xlatb11;
					vec3 u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					bool u_xlatb13;
					vec2 u_xlat22;
					float u_xlat23;
					vec2 u_xlat24;
					bool u_xlatb24;
					vec2 u_xlat26;
					float u_xlat33;
					float u_xlat34;
					bool u_xlatb34;
					float u_xlat36;
					bool u_xlatb36;
					void main()
					{
					    u_xlatb0 = unity_CameraProjection[0].z!=0.0;
					    u_xlatb11 = unity_CameraProjection[1].z!=0.0;
					    u_xlatb0 = u_xlatb11 || u_xlatb0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.xyz = vs_TEXCOORD0.xwy * vec3(0.5, 0.5, -0.5);
					    u_xlat0.xy = u_xlat0.yy + u_xlat0.xz;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat1.xyz = unity_CameraToWorld[2].xyz + unity_CameraToWorld[3].xyz;
					    u_xlat1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat2.xyz = u_xlat1.xyz * vec3(10000.0, 10000.0, 10000.0) + _WorldSpaceCameraPos.xyz;
					    u_xlat3.xyz = u_xlat2.yyy * unity_MatrixVP[1].xwy;
					    u_xlat2.xyw = unity_MatrixVP[0].xwy * u_xlat2.xxx + u_xlat3.xyz;
					    u_xlat2.xyz = unity_MatrixVP[2].xwy * u_xlat2.zzz + u_xlat2.xyw;
					    u_xlat2.xyz = u_xlat2.xyz + unity_MatrixVP[3].xwy;
					    u_xlat2.xzw = u_xlat2.xyz * vec3(0.5, 0.5, -0.5);
					    u_xlat22.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat22.xy = u_xlat22.xy / u_xlat2.yy;
					    u_xlat2.xyz = unity_ObjectToWorld[3].yyy * unity_MatrixVP[1].xwy;
					    u_xlat2.xyz = unity_MatrixVP[0].xwy * unity_ObjectToWorld[3].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_MatrixVP[2].xwy * unity_ObjectToWorld[3].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_MatrixVP[3].xwy * unity_ObjectToWorld[3].www + u_xlat2.xyz;
					    u_xlat2.xzw = u_xlat2.xyz * vec3(0.5, 0.5, -0.5);
					    u_xlat2.xz = u_xlat2.zz + u_xlat2.xw;
					    u_xlat2.xy = u_xlat2.xz / u_xlat2.yy;
					    u_xlat3.xyz = (-_WorldSpaceCameraPos.xyz) + unity_ObjectToWorld[3].xyz;
					    u_xlat34 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat34 = inversesqrt(u_xlat34);
					    u_xlat1.xyz = vec3(u_xlat34) * u_xlat1.xyz;
					    u_xlat34 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat34 = inversesqrt(u_xlat34);
					    u_xlat3.xyz = vec3(u_xlat34) * u_xlat3.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlatb12 = _Dir<u_xlat1.x;
					    u_xlat1.x = u_xlat1.x + (-_Dir);
					    u_xlat23 = (-_Dir) + 1.0;
					    u_xlat1.x = u_xlat1.x / u_xlat23;
					    u_xlat1.x = u_xlatb12 ? u_xlat1.x : float(0.0);
					    u_xlat10_3 = texture(_corpsegp3, u_xlat0.xy);
					    u_xlat12.xy = _Time.yy * vec2(0.000833333354, 5.0);
					    u_xlatb34 = u_xlat12.x>=(-u_xlat12.x);
					    u_xlat12.x = fract(abs(u_xlat12.x));
					    u_xlat12.x = (u_xlatb34) ? u_xlat12.x : (-u_xlat12.x);
					    u_xlat12.x = u_xlat12.x * _nspeed;
					    u_xlat4 = u_xlat12.xxxx * vec4(-8387.04004, 7297.92041, 7425.35986, -7242.47998) + u_xlat0.xyxy;
					    u_xlat5.x = _TillingX;
					    u_xlat5.y = _TillingY;
					    u_xlat4 = u_xlat4 * u_xlat5.xyxy;
					    u_xlat5 = u_xlat4 * vec4(250.0, 250.0, 250.0, 250.0);
					    u_xlat12.x = dot(u_xlat5.xy, vec2(0.366025418, 0.366025418));
					    u_xlat12.xz = u_xlat4.xy * vec2(250.0, 250.0) + u_xlat12.xx;
					    u_xlat12.xz = floor(u_xlat12.xz);
					    u_xlat24.xy = u_xlat4.xy * vec2(250.0, 250.0) + (-u_xlat12.xz);
					    u_xlat36 = dot(u_xlat12.xz, vec2(0.211324871, 0.211324871));
					    u_xlat24.xy = u_xlat24.xy + vec2(u_xlat36);
					    u_xlatb36 = u_xlat24.y<u_xlat24.x;
					    u_xlat6 = u_xlat24.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
					    u_xlat7 = (bool(u_xlatb36)) ? vec4(0.0, 1.0, -1.0, -0.0) : vec4(1.0, 0.0, -0.0, -1.0);
					    u_xlat6.xy = u_xlat6.xy + u_xlat7.zw;
					    u_xlat4.xy = u_xlat12.xz * vec2(0.00346020772, 0.00346020772);
					    u_xlat4.xy = floor(u_xlat4.xy);
					    u_xlat12.xz = (-u_xlat4.xy) * vec2(289.0, 289.0) + u_xlat12.xz;
					    u_xlat8.x = float(0.0);
					    u_xlat8.z = float(1.0);
					    u_xlat8.y = u_xlat7.x;
					    u_xlat8.xyz = u_xlat12.zzz + u_xlat8.xyz;
					    u_xlat9.xyz = u_xlat8.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat8.xyz = u_xlat8.xyz * u_xlat9.xyz;
					    u_xlat9.xyz = u_xlat8.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat9.xyz = floor(u_xlat9.xyz);
					    u_xlat8.xyz = (-u_xlat9.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat8.xyz;
					    u_xlat8.xyz = u_xlat12.xxx + u_xlat8.xyz;
					    u_xlat7.x = float(0.0);
					    u_xlat7.z = float(1.0);
					    u_xlat7.xyz = u_xlat7.xyz + u_xlat8.xyz;
					    u_xlat8.xyz = u_xlat7.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz;
					    u_xlat8.xyz = u_xlat7.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat8.xyz = floor(u_xlat8.xyz);
					    u_xlat7.xyz = (-u_xlat8.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat7.xyz;
					    u_xlat8.x = dot(u_xlat24.xy, u_xlat24.xy);
					    u_xlat8.y = dot(u_xlat6.xy, u_xlat6.xy);
					    u_xlat8.z = dot(u_xlat6.zw, u_xlat6.zw);
					    u_xlat8.xyz = (-u_xlat8.xyz) + vec3(0.5, 0.5, 0.5);
					    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat8.xyz = u_xlat8.xyz * u_xlat8.xyz;
					    u_xlat8.xyz = u_xlat8.xyz * u_xlat8.xyz;
					    u_xlat7.xyz = u_xlat7.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
					    u_xlat7.xyz = fract(u_xlat7.xyz);
					    u_xlat9.xyz = u_xlat7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10.xyz = abs(u_xlat9.xyz) + vec3(-0.5, -0.5, -0.5);
					    u_xlat7.xyz = u_xlat7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
					    u_xlat7.xyz = floor(u_xlat7.xyz);
					    u_xlat7.xyz = (-u_xlat7.xyz) + u_xlat9.xyz;
					    u_xlat9.xyz = u_xlat10.xyz * u_xlat10.xyz;
					    u_xlat9.xyz = u_xlat7.xyz * u_xlat7.xyz + u_xlat9.xyz;
					    u_xlat9.xyz = (-u_xlat9.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
					    u_xlat8.xyz = u_xlat8.xyz * u_xlat9.xyz;
					    u_xlat12.x = u_xlat24.y * u_xlat10.x;
					    u_xlat9.x = u_xlat7.x * u_xlat24.x + u_xlat12.x;
					    u_xlat12.xz = u_xlat6.yw * u_xlat10.yz;
					    u_xlat9.yz = u_xlat7.yz * u_xlat6.xz + u_xlat12.xz;
					    u_xlat12.x = dot(u_xlat8.xyz, u_xlat9.xyz);
					    u_xlat12.x = u_xlat12.x * 130.0;
					    u_xlat34 = dot(u_xlat5.zw, vec2(0.366025418, 0.366025418));
					    u_xlat24.xy = u_xlat4.zw * vec2(250.0, 250.0) + vec2(u_xlat34);
					    u_xlat24.xy = floor(u_xlat24.xy);
					    u_xlat4.xy = u_xlat4.zw * vec2(250.0, 250.0) + (-u_xlat24.xy);
					    u_xlat34 = dot(u_xlat24.xy, vec2(0.211324871, 0.211324871));
					    u_xlat4.xy = vec2(u_xlat34) + u_xlat4.xy;
					    u_xlatb34 = u_xlat4.y<u_xlat4.x;
					    u_xlat5 = u_xlat4.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
					    u_xlat6 = (bool(u_xlatb34)) ? vec4(0.0, 1.0, -1.0, -0.0) : vec4(1.0, 0.0, -0.0, -1.0);
					    u_xlat5.xy = u_xlat5.xy + u_xlat6.zw;
					    u_xlat26.xy = u_xlat24.xy * vec2(0.00346020772, 0.00346020772);
					    u_xlat26.xy = floor(u_xlat26.xy);
					    u_xlat24.xy = (-u_xlat26.xy) * vec2(289.0, 289.0) + u_xlat24.xy;
					    u_xlat7.x = float(0.0);
					    u_xlat7.z = float(1.0);
					    u_xlat7.y = u_xlat6.x;
					    u_xlat7.xyz = u_xlat24.yyy + u_xlat7.xyz;
					    u_xlat8.xyz = u_xlat7.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz;
					    u_xlat8.xyz = u_xlat7.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat8.xyz = floor(u_xlat8.xyz);
					    u_xlat7.xyz = (-u_xlat8.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat7.xyz;
					    u_xlat7.xyz = u_xlat24.xxx + u_xlat7.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.z = float(1.0);
					    u_xlat6.xyz = u_xlat6.xyz + u_xlat7.xyz;
					    u_xlat7.xyz = u_xlat6.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xyz;
					    u_xlat7.xyz = u_xlat6.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat7.xyz = floor(u_xlat7.xyz);
					    u_xlat6.xyz = (-u_xlat7.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat6.xyz;
					    u_xlat7.x = dot(u_xlat4.xy, u_xlat4.xy);
					    u_xlat7.y = dot(u_xlat5.xy, u_xlat5.xy);
					    u_xlat7.z = dot(u_xlat5.zw, u_xlat5.zw);
					    u_xlat7.xyz = (-u_xlat7.xyz) + vec3(0.5, 0.5, 0.5);
					    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat7.xyz = u_xlat7.xyz * u_xlat7.xyz;
					    u_xlat7.xyz = u_xlat7.xyz * u_xlat7.xyz;
					    u_xlat6.xyz = u_xlat6.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
					    u_xlat6.xyz = fract(u_xlat6.xyz);
					    u_xlat8.xyz = u_xlat6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat9.xyz = abs(u_xlat8.xyz) + vec3(-0.5, -0.5, -0.5);
					    u_xlat6.xyz = u_xlat6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
					    u_xlat6.xyz = floor(u_xlat6.xyz);
					    u_xlat6.xyz = (-u_xlat6.xyz) + u_xlat8.xyz;
					    u_xlat8.xyz = u_xlat9.xyz * u_xlat9.xyz;
					    u_xlat8.xyz = u_xlat6.xyz * u_xlat6.xyz + u_xlat8.xyz;
					    u_xlat8.xyz = (-u_xlat8.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
					    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz;
					    u_xlat34 = u_xlat4.y * u_xlat9.x;
					    u_xlat4.x = u_xlat6.x * u_xlat4.x + u_xlat34;
					    u_xlat24.xy = u_xlat5.yw * u_xlat9.yz;
					    u_xlat4.yz = u_xlat6.yz * u_xlat5.xz + u_xlat24.xy;
					    u_xlat34 = dot(u_xlat7.xyz, u_xlat4.xyz);
					    u_xlat12.z = u_xlat34 * 130.0;
					    u_xlat12.xz = fract(u_xlat12.xz);
					    u_xlat12.x = u_xlat12.z + u_xlat12.x;
					    u_xlat12.x = (-u_xlat12.x) + 1.0;
					    u_xlat12.x = max(u_xlat12.x, 0.0);
					    u_xlat34 = u_xlat12.x * 5.0;
					    u_xlat34 = min(u_xlat34, 1.0);
					    u_xlat4.xyz = vec3(u_xlat34) + u_xlat10_3.xyz;
					    u_xlat4.xyz = u_xlat4.xyz * _ncol.xyz;
					    u_xlat4.xyz = u_xlat10_3.xyz * u_xlat12.xxx + u_xlat4.xyz;
					    u_xlat12.xz = vec2(vs_TEXCOORD1) * vec2(_Noise, _lines);
					    u_xlat4.xyz = (-u_xlat10_3.xyz) + u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat12.xxx * u_xlat4.xyz + u_xlat10_3.xyz;
					    u_xlat12.x = _linesspeed * _Time.y;
					    u_xlat12.x = u_xlat12.x * 10.0;
					    u_xlat12.x = u_xlat0.y * _linescount + u_xlat12.x;
					    u_xlatb24 = u_xlat12.x>=(-u_xlat12.x);
					    u_xlat12.x = fract(abs(u_xlat12.x));
					    u_xlat12.x = (u_xlatb24) ? u_xlat12.x : (-u_xlat12.x);
					    u_xlat12.x = u_xlat12.x + 1.0;
					    u_xlat12.x = u_xlat12.x * 0.5;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat12.xxx + (-u_xlat3.xyz);
					    u_xlat3.xyz = u_xlat12.zzz * u_xlat4.xyz + u_xlat3.xyz;
					    u_xlat12.xz = vec2(ivec2(_Vignettecntr, _smb));
					    u_xlat2.xy = (-u_xlat22.xy) + u_xlat2.xy;
					    u_xlat22.xy = u_xlat12.xx * u_xlat2.xy + u_xlat22.xy;
					    u_xlat2.x = u_xlat1.x + -1.0;
					    u_xlat12.x = u_xlat12.x * u_xlat2.x + 1.0;
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat2.x = (-u_xlat1.x) + _Vignette;
					    u_xlat1.x = u_xlat12.x * u_xlat2.x + u_xlat1.x;
					    u_xlat2.x = u_xlat1.x * vs_TEXCOORD1;
					    u_xlatb13 = _Speedvg==0.0;
					    u_xlat13 = (u_xlatb13) ? 0.0 : _Time.y;
					    u_xlat23 = cos(u_xlat12.y);
					    u_xlat23 = _Speedvg * u_xlat23 + u_xlat13;
					    u_xlat23 = sin(u_xlat23);
					    u_xlat23 = u_xlat23 * 0.300000012 + 3.0;
					    u_xlat13 = (-u_xlat2.x) * _Vignettesmtf + 1.0;
					    u_xlat24.x = _Vignettesmtf + 1.0;
					    u_xlat24.x = u_xlat24.x + u_xlat24.x;
					    u_xlat0.xz = (-u_xlat22.xy) + u_xlat0.xy;
					    u_xlat0.x = dot(u_xlat0.xz, u_xlat0.xz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat22.x = (-u_xlat1.x) * vs_TEXCOORD1 + 1.0;
					    u_xlat33 = (-u_xlat24.x) * u_xlat0.x + u_xlat0.x;
					    u_xlat0.x = (-u_xlat24.x) * u_xlat0.x + u_xlat22.x;
					    u_xlat22.x = float(1.0) / u_xlat33;
					    u_xlat0.x = u_xlat22.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat22.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat22.x) * u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat13;
					    u_xlat22.x = sqrt(u_xlat2.x);
					    u_xlat22.x = u_xlat23 * u_xlat22.x;
					    u_xlat22.x = u_xlat22.x * 0.5;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat22.x;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.xy = u_xlat0.xy + vec2(-1.0, -0.500100017);
					    u_xlat0.x = u_xlat12.x * u_xlat0.x + 1.0;
					    u_xlat0.xzw = u_xlat0.xxx * u_xlat3.xyz;
					    u_xlat1.x = vs_TEXCOORD1 * _bars;
					    u_xlat1.x = (-u_xlat1.x) * 0.00499999989 + 0.5;
					    u_xlatb12 = u_xlat1.x>=abs(u_xlat0.y);
					    u_xlat23 = u_xlatb12 ? 1.0 : float(0.0);
					    u_xlat2.x = -abs(u_xlat0.y) + 0.5;
					    u_xlat11 = -abs(u_xlat0.y) + u_xlat1.x;
					    u_xlat1.x = float(1.0) / u_xlat2.x;
					    u_xlat11 = u_xlat11 * u_xlat1.x;
					    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
					    u_xlat1.x = u_xlat11 * -2.0 + 3.0;
					    u_xlat11 = u_xlat11 * u_xlat11;
					    u_xlat12.x = (u_xlatb12) ? -1.0 : -0.0;
					    u_xlat11 = u_xlat1.x * u_xlat11 + u_xlat12.x;
					    u_xlat11 = u_xlat12.z * u_xlat11 + u_xlat23;
					    SV_Target0.xyz = vec3(u_xlat11) * u_xlat0.xzw;
					    SV_Target0.w = _Alpha;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" "LINES_ON" "NOISE_ON" "VIGNETTE_ON" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _Alpha;
						float _Dir;
						float _nspeed;
						float _Speedvg;
						float _Vignette;
						float _Vignettesmtf;
						int _Vignettecntr;
						float _bars;
						int _smb;
						float _TillingX;
						float _TillingY;
						vec4 _ncol;
						float _Noise;
						float _lines;
						float _linescount;
						float _linesspeed;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
						vec4 _ScreenParams;
						vec4 unused_1_3[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_2[4];
						mat4x4 unity_StereoCameraProjection[2];
						vec4 unused_3_4[20];
						mat4x4 unity_StereoCameraToWorld[2];
						vec4 unused_3_6[4];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_8;
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_3_10;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _corpsegp3;
					in  vec4 vs_TEXCOORD0;
					in  float vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					int u_xlati0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					bool u_xlatb2;
					vec4 u_xlat3;
					bool u_xlatb3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat10;
					bool u_xlatb10;
					float u_xlat11;
					bool u_xlatb11;
					float u_xlat12;
					float u_xlat13;
					float u_xlat14;
					vec3 u_xlat15;
					float u_xlat20;
					bool u_xlatb20;
					float u_xlat21;
					vec2 u_xlat24;
					float u_xlat30;
					int u_xlati30;
					float u_xlat31;
					float u_xlat32;
					bool u_xlatb32;
					float u_xlat33;
					bool u_xlatb33;
					void main()
					{
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlatb10 = 0.0!=unity_StereoCameraProjection[u_xlati0 / 4][u_xlati0 % 4].z;
					    u_xlatb20 = 0.0!=unity_StereoCameraProjection[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4].z;
					    u_xlatb10 = u_xlatb20 || u_xlatb10;
					    if(((int(u_xlatb10) * int(0xffffffffu)))!=0){discard;}
					    u_xlat10.xyz = vs_TEXCOORD0.xwy * vec3(0.5, 0.5, -0.5);
					    u_xlat10.xy = u_xlat10.yy + u_xlat10.xz;
					    u_xlati30 = unity_StereoEyeIndex;
					    u_xlat1.xy = vs_TEXCOORD0.ww * unity_StereoScaleOffset[u_xlati30].zw;
					    u_xlat10.xy = u_xlat10.xy * unity_StereoScaleOffset[u_xlati30].xy + u_xlat1.xy;
					    u_xlat1.yz = u_xlat10.xy / vs_TEXCOORD0.ww;
					    u_xlat2.xyz = (-unity_StereoWorldSpaceCameraPos[0].xyz) + unity_StereoWorldSpaceCameraPos[1].xyz;
					    u_xlat10.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10.x = inversesqrt(u_xlat10.x);
					    u_xlat2.xyz = u_xlat10.xxx * u_xlat2.xyz;
					    u_xlat3.xyz = unity_StereoCameraToWorld[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4].xyz + unity_StereoCameraToWorld[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4].xyz;
					    u_xlat4.xyz = unity_StereoWorldSpaceCameraPos[0].xyz + unity_StereoWorldSpaceCameraPos[1].xyz;
					    u_xlat5.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (-u_xlat4.xyz) * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					    u_xlat10.x = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat2.xyz = (-u_xlat10.xxx) * u_xlat2.xyz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * vec3(10000.0, 10000.0, 10000.0) + u_xlat5.xyz;
					    u_xlat5.xyz = u_xlat3.yyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4].xwy;
					    u_xlat3.xyw = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4].xwy * u_xlat3.xxx + u_xlat5.xyz;
					    u_xlat3.xyz = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4].xwy * u_xlat3.zzz + u_xlat3.xyw;
					    u_xlat3.xyz = u_xlat3.xyz + unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4].xwy;
					    u_xlat3.xzw = u_xlat3.xyz * vec3(0.5, 0.5, -0.5);
					    u_xlat10.xy = u_xlat3.zz + u_xlat3.xw;
					    u_xlat3.xz = u_xlat3.yy * unity_StereoScaleOffset[u_xlati30].zw;
					    u_xlat10.xy = u_xlat10.xy * unity_StereoScaleOffset[u_xlati30].xy + u_xlat3.xz;
					    u_xlat10.xy = u_xlat10.xy / u_xlat3.yy;
					    u_xlat3.xyz = unity_ObjectToWorld[3].yyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4].xwy;
					    u_xlat3.xyz = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4].xwy * unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4].xwy * unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4].xwy * unity_ObjectToWorld[3].www + u_xlat3.xyz;
					    u_xlat3.xzw = u_xlat3.xyz * vec3(0.5, 0.5, -0.5);
					    u_xlat3.xz = u_xlat3.zz + u_xlat3.xw;
					    u_xlat5.xy = u_xlat3.yy * unity_StereoScaleOffset[u_xlati30].zw;
					    u_xlat0.xw = u_xlat3.xz * unity_StereoScaleOffset[u_xlati30].xy + u_xlat5.xy;
					    u_xlat0.xw = u_xlat0.xw / u_xlat3.yy;
					    u_xlat3.xyz = (-u_xlat4.xyz) * vec3(0.5, 0.5, 0.5) + unity_ObjectToWorld[3].xyz;
					    u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat31 = inversesqrt(u_xlat31);
					    u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
					    u_xlat31 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat31 = inversesqrt(u_xlat31);
					    u_xlat3.xyz = vec3(u_xlat31) * u_xlat3.xyz;
					    u_xlat31 = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlatb2 = _Dir<u_xlat31;
					    u_xlat31 = u_xlat31 + (-_Dir);
					    u_xlat12 = (-_Dir) + 1.0;
					    u_xlat31 = u_xlat31 / u_xlat12;
					    u_xlat31 = u_xlatb2 ? u_xlat31 : float(0.0);
					    u_xlat10_2 = texture(_corpsegp3, u_xlat1.yz);
					    u_xlat3.xy = _Time.yy * vec2(0.000833333354, 5.0);
					    u_xlatb32 = u_xlat3.x>=(-u_xlat3.x);
					    u_xlat3.x = fract(abs(u_xlat3.x));
					    u_xlat32 = (u_xlatb32) ? u_xlat3.x : (-u_xlat3.x);
					    u_xlat32 = u_xlat32 * _nspeed;
					    u_xlat4 = vec4(u_xlat32) * vec4(-8387.04004, 7297.92041, 7425.35986, -7242.47998) + u_xlat1.yzyz;
					    u_xlat5.x = _TillingX;
					    u_xlat5.y = _TillingY;
					    u_xlat4 = u_xlat4 * u_xlat5.xyxy;
					    u_xlat5 = u_xlat4 * vec4(250.0, 250.0, 250.0, 250.0);
					    u_xlat32 = dot(u_xlat5.xy, vec2(0.366025418, 0.366025418));
					    u_xlat3.xz = u_xlat4.xy * vec2(250.0, 250.0) + vec2(u_xlat32);
					    u_xlat3.xz = floor(u_xlat3.xz);
					    u_xlat4.xy = u_xlat4.xy * vec2(250.0, 250.0) + (-u_xlat3.xz);
					    u_xlat32 = dot(u_xlat3.xz, vec2(0.211324871, 0.211324871));
					    u_xlat4.xy = vec2(u_xlat32) + u_xlat4.xy;
					    u_xlatb32 = u_xlat4.y<u_xlat4.x;
					    u_xlat6 = u_xlat4.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
					    u_xlat7 = (bool(u_xlatb32)) ? vec4(0.0, 1.0, -1.0, -0.0) : vec4(1.0, 0.0, -0.0, -1.0);
					    u_xlat6.xy = u_xlat6.xy + u_xlat7.zw;
					    u_xlat5.xy = u_xlat3.xz * vec2(0.00346020772, 0.00346020772);
					    u_xlat5.xy = floor(u_xlat5.xy);
					    u_xlat3.xz = (-u_xlat5.xy) * vec2(289.0, 289.0) + u_xlat3.xz;
					    u_xlat8.x = float(0.0);
					    u_xlat8.z = float(1.0);
					    u_xlat8.y = u_xlat7.x;
					    u_xlat8.xyz = u_xlat3.zzz + u_xlat8.xyz;
					    u_xlat9.xyz = u_xlat8.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat8.xyz = u_xlat8.xyz * u_xlat9.xyz;
					    u_xlat9.xyz = u_xlat8.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat9.xyz = floor(u_xlat9.xyz);
					    u_xlat8.xyz = (-u_xlat9.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat8.xyz;
					    u_xlat3.xzw = u_xlat3.xxx + u_xlat8.xyz;
					    u_xlat7.x = float(0.0);
					    u_xlat7.z = float(1.0);
					    u_xlat3.xzw = u_xlat3.xzw + u_xlat7.xyz;
					    u_xlat7.xyz = u_xlat3.xzw * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat3.xzw = u_xlat3.xzw * u_xlat7.xyz;
					    u_xlat7.xyz = u_xlat3.xzw * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat7.xyz = floor(u_xlat7.xyz);
					    u_xlat3.xzw = (-u_xlat7.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat3.xzw;
					    u_xlat7.x = dot(u_xlat4.xy, u_xlat4.xy);
					    u_xlat7.y = dot(u_xlat6.xy, u_xlat6.xy);
					    u_xlat7.z = dot(u_xlat6.zw, u_xlat6.zw);
					    u_xlat7.xyz = (-u_xlat7.xyz) + vec3(0.5, 0.5, 0.5);
					    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat7.xyz = u_xlat7.xyz * u_xlat7.xyz;
					    u_xlat7.xyz = u_xlat7.xyz * u_xlat7.xyz;
					    u_xlat3.xzw = u_xlat3.xzw * vec3(0.024390243, 0.024390243, 0.024390243);
					    u_xlat3.xzw = fract(u_xlat3.xzw);
					    u_xlat8.xyz = u_xlat3.xzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat9.xyz = abs(u_xlat8.xyz) + vec3(-0.5, -0.5, -0.5);
					    u_xlat3.xzw = u_xlat3.xzw * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
					    u_xlat3.xzw = floor(u_xlat3.xzw);
					    u_xlat3.xzw = (-u_xlat3.xzw) + u_xlat8.xyz;
					    u_xlat8.xyz = u_xlat9.xyz * u_xlat9.xyz;
					    u_xlat8.xyz = u_xlat3.xzw * u_xlat3.xzw + u_xlat8.xyz;
					    u_xlat8.xyz = (-u_xlat8.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
					    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz;
					    u_xlat32 = u_xlat4.y * u_xlat9.x;
					    u_xlat8.x = u_xlat3.x * u_xlat4.x + u_xlat32;
					    u_xlat4.xy = u_xlat6.yw * u_xlat9.yz;
					    u_xlat8.yz = u_xlat3.zw * u_xlat6.xz + u_xlat4.xy;
					    u_xlat32 = dot(u_xlat7.xyz, u_xlat8.xyz);
					    u_xlat32 = u_xlat32 * 130.0;
					    u_xlat32 = fract(u_xlat32);
					    u_xlat3.x = dot(u_xlat5.zw, vec2(0.366025418, 0.366025418));
					    u_xlat3.xz = u_xlat4.zw * vec2(250.0, 250.0) + u_xlat3.xx;
					    u_xlat3.xz = floor(u_xlat3.xz);
					    u_xlat4.xy = u_xlat4.zw * vec2(250.0, 250.0) + (-u_xlat3.xz);
					    u_xlat33 = dot(u_xlat3.xz, vec2(0.211324871, 0.211324871));
					    u_xlat4.xy = vec2(u_xlat33) + u_xlat4.xy;
					    u_xlatb33 = u_xlat4.y<u_xlat4.x;
					    u_xlat5 = u_xlat4.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
					    u_xlat6 = (bool(u_xlatb33)) ? vec4(0.0, 1.0, -1.0, -0.0) : vec4(1.0, 0.0, -0.0, -1.0);
					    u_xlat5.xy = u_xlat5.xy + u_xlat6.zw;
					    u_xlat24.xy = u_xlat3.xz * vec2(0.00346020772, 0.00346020772);
					    u_xlat24.xy = floor(u_xlat24.xy);
					    u_xlat3.xz = (-u_xlat24.xy) * vec2(289.0, 289.0) + u_xlat3.xz;
					    u_xlat7.x = float(0.0);
					    u_xlat7.z = float(1.0);
					    u_xlat7.y = u_xlat6.x;
					    u_xlat7.xyz = u_xlat3.zzz + u_xlat7.xyz;
					    u_xlat8.xyz = u_xlat7.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz;
					    u_xlat8.xyz = u_xlat7.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat8.xyz = floor(u_xlat8.xyz);
					    u_xlat7.xyz = (-u_xlat8.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat7.xyz;
					    u_xlat3.xzw = u_xlat3.xxx + u_xlat7.xyz;
					    u_xlat6.x = float(0.0);
					    u_xlat6.z = float(1.0);
					    u_xlat3.xzw = u_xlat3.xzw + u_xlat6.xyz;
					    u_xlat6.xyz = u_xlat3.xzw * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat3.xzw = u_xlat3.xzw * u_xlat6.xyz;
					    u_xlat6.xyz = u_xlat3.xzw * vec3(0.00346020772, 0.00346020772, 0.00346020772);
					    u_xlat6.xyz = floor(u_xlat6.xyz);
					    u_xlat3.xzw = (-u_xlat6.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat3.xzw;
					    u_xlat6.x = dot(u_xlat4.xy, u_xlat4.xy);
					    u_xlat6.y = dot(u_xlat5.xy, u_xlat5.xy);
					    u_xlat6.z = dot(u_xlat5.zw, u_xlat5.zw);
					    u_xlat6.xyz = (-u_xlat6.xyz) + vec3(0.5, 0.5, 0.5);
					    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat6.xyz = u_xlat6.xyz * u_xlat6.xyz;
					    u_xlat6.xyz = u_xlat6.xyz * u_xlat6.xyz;
					    u_xlat3.xzw = u_xlat3.xzw * vec3(0.024390243, 0.024390243, 0.024390243);
					    u_xlat3.xzw = fract(u_xlat3.xzw);
					    u_xlat7.xyz = u_xlat3.xzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat8.xyz = abs(u_xlat7.xyz) + vec3(-0.5, -0.5, -0.5);
					    u_xlat3.xzw = u_xlat3.xzw * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
					    u_xlat3.xzw = floor(u_xlat3.xzw);
					    u_xlat3.xzw = (-u_xlat3.xzw) + u_xlat7.xyz;
					    u_xlat7.xyz = u_xlat8.xyz * u_xlat8.xyz;
					    u_xlat7.xyz = u_xlat3.xzw * u_xlat3.xzw + u_xlat7.xyz;
					    u_xlat7.xyz = (-u_xlat7.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
					    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xyz;
					    u_xlat14 = u_xlat4.y * u_xlat8.x;
					    u_xlat4.x = u_xlat3.x * u_xlat4.x + u_xlat14;
					    u_xlat15.xz = u_xlat5.yw * u_xlat8.yz;
					    u_xlat4.yz = u_xlat3.zw * u_xlat5.xz + u_xlat15.xz;
					    u_xlat3.x = dot(u_xlat6.xyz, u_xlat4.xyz);
					    u_xlat3.x = u_xlat3.x * 130.0;
					    u_xlat3.x = fract(u_xlat3.x);
					    u_xlat32 = u_xlat32 + u_xlat3.x;
					    u_xlat32 = (-u_xlat32) + 1.0;
					    u_xlat32 = max(u_xlat32, 0.0);
					    u_xlat3.x = u_xlat32 * 5.0;
					    u_xlat3.x = min(u_xlat3.x, 1.0);
					    u_xlat3.xzw = u_xlat10_2.xyz + u_xlat3.xxx;
					    u_xlat3.xzw = u_xlat3.xzw * _ncol.xyz;
					    u_xlat3.xzw = u_xlat10_2.xyz * vec3(u_xlat32) + u_xlat3.xzw;
					    u_xlat4.xy = vec2(vs_TEXCOORD1) * vec2(_Noise, _lines);
					    u_xlat3.xzw = (-u_xlat10_2.xyz) + u_xlat3.xzw;
					    u_xlat2.xyz = u_xlat4.xxx * u_xlat3.xzw + u_xlat10_2.xyz;
					    u_xlat32 = _linesspeed * _Time.y;
					    u_xlat32 = u_xlat32 * 10.0;
					    u_xlat32 = u_xlat1.z * _linescount + u_xlat32;
					    u_xlatb3 = u_xlat32>=(-u_xlat32);
					    u_xlat32 = fract(abs(u_xlat32));
					    u_xlat32 = (u_xlatb3) ? u_xlat32 : (-u_xlat32);
					    u_xlat32 = u_xlat32 + 1.0;
					    u_xlat32 = u_xlat32 * 0.5;
					    u_xlat3.xzw = u_xlat2.xyz * vec3(u_xlat32) + (-u_xlat2.xyz);
					    u_xlat2.xyz = u_xlat4.yyy * u_xlat3.xzw + u_xlat2.xyz;
					    u_xlat3.xz = vec2(ivec2(_Vignettecntr, _smb));
					    u_xlat0.xw = (-u_xlat10.xy) + u_xlat0.xw;
					    u_xlat0.yz = u_xlat3.xx * u_xlat0.xw + u_xlat10.xy;
					    u_xlat30 = u_xlat31 + -1.0;
					    u_xlat30 = u_xlat3.x * u_xlat30 + 1.0;
					    u_xlat31 = (-u_xlat31) + 1.0;
					    u_xlat32 = (-u_xlat31) + _Vignette;
					    u_xlat31 = u_xlat30 * u_xlat32 + u_xlat31;
					    u_xlat32 = u_xlat31 * vs_TEXCOORD1;
					    u_xlatb3 = _Speedvg==0.0;
					    u_xlat3.x = (u_xlatb3) ? 0.0 : _Time.y;
					    u_xlat13 = cos(u_xlat3.y);
					    u_xlat3.x = _Speedvg * u_xlat13 + u_xlat3.x;
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 0.300000012 + 3.0;
					    u_xlat13 = (-u_xlat32) * _Vignettesmtf + 1.0;
					    u_xlat33 = _Vignettesmtf + 1.0;
					    u_xlat33 = u_xlat33 + u_xlat33;
					    u_xlat4.x = _ScreenParams.x / _ScreenParams.y;
					    u_xlat4.x = u_xlat4.x + u_xlat4.x;
					    u_xlat1.x = u_xlat1.y / u_xlat4.x;
					    u_xlat0.x = u_xlat0.y / u_xlat4.x;
					    u_xlat0.xy = (-u_xlat0.xz) + u_xlat1.xz;
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat10.x = u_xlat0.x * u_xlat33;
					    u_xlat20 = (-u_xlat31) * vs_TEXCOORD1 + 1.0;
					    u_xlat0.x = (-u_xlat33) * u_xlat0.x + u_xlat0.x;
					    u_xlat10.x = u_xlat20 * 0.5 + (-u_xlat10.x);
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat10.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat10.x) * u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat13;
					    u_xlat10.x = u_xlat32 * 0.5;
					    u_xlat10.x = sqrt(u_xlat10.x);
					    u_xlat10.x = u_xlat3.x * u_xlat10.x;
					    u_xlat10.x = u_xlat10.x * 0.5;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat10.x;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + -1.0;
					    u_xlat0.x = u_xlat30 * u_xlat0.x + 1.0;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat30 = u_xlat1.z + -0.500100017;
					    u_xlat1.x = vs_TEXCOORD1 * _bars;
					    u_xlat1.x = (-u_xlat1.x) * 0.00499999989 + 0.5;
					    u_xlatb11 = u_xlat1.x>=abs(u_xlat30);
					    u_xlat21 = u_xlatb11 ? 1.0 : float(0.0);
					    u_xlat31 = -abs(u_xlat30) + 0.5;
					    u_xlat30 = -abs(u_xlat30) + u_xlat1.x;
					    u_xlat1.x = float(1.0) / u_xlat31;
					    u_xlat30 = u_xlat30 * u_xlat1.x;
					    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
					    u_xlat1.x = u_xlat30 * -2.0 + 3.0;
					    u_xlat30 = u_xlat30 * u_xlat30;
					    u_xlat11 = (u_xlatb11) ? -1.0 : -0.0;
					    u_xlat30 = u_xlat1.x * u_xlat30 + u_xlat11;
					    u_xlat30 = u_xlat3.z * u_xlat30 + u_xlat21;
					    SV_Target0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
					    SV_Target0.w = _Alpha;
					    return;
					}"
				}
			}
		}
	}
}