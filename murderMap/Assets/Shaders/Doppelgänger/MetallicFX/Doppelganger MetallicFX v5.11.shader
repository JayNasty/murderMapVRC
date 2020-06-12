// v5.11
// Made by Doppelgänger#8376 with Amplify Shader Editor.
// Metallic map for metallic, matcap, moving reflections, reflection cubamap.
// Normal map support.
// Added grayscaled ligtning.
// Added Emission map.
Shader "Doppels shaders/MetallicFX v5.11"
{
	Properties
	{
		[Header (Settings)]
		[Space]
		[Toggle]_us("Unlit switch", Float) = 0
		[Toggle]_gsl("Grayscale Lightning", Float) = 0
		[Enum(UnityEngine.Rendering.CullMode)] _Cull("Cull", Int) = 2
		[Header (Metallic)]
		[Space]
		_metp("Metallic Power", Range(0, 1)) = 0.85
		[HDR]_Mettint("Metallic tint", Color) = (1,1,1,1)
		[Toggle]_BlackRim("Black Rim", Float) = 0
		_Power("Power", Range( 0 , 1)) = 0.75
		_Multiplyer("Multiplyer", Range( 0 , 3)) = 0.25
		[Header (MatCap)]
		[Space]
		[NoScaleOffset]_MatCap("MatCap", 2D) = "black" {}
		[HDR]_MatCaptint("MatCap tint", Color) = (1,1,1,1)
		[Header (Fake Moving Reflections)]
		[Space]
		[NoScaleOffset]_MR("Moving Reflections", 2D) = "black" {}
		[NoScaleOffset]_MRn("Moving Reflections Normals", 2D) = "bump" {}
		[HDR]_MRt("Moving Reflections Tint", Color) = (1,1,1,1)
		_I("Intensity", Range( 0 , 1)) = 0.5
		_In("Intensity Normals Scale", Range( 0 , 1)) = 0.5
		_Speed("Speed", Range( 0 , 1)) = 0.1
		[Header (Reflection Cubemap)]
		[Space]
		[NoScaleOffset]_RC("Reflection Cubemap", CUBE) = "black" {}
		[HDR]_Cubemaptint("Cubemap tint", Color) = (0,0,0,1)
		_RCn("Cubemap Normals", 2D) = "bump" {}
		_RCns("Cubemap Normals Scale", Range( 0 , 1)) = 0
		[Header (Main Settings)]
		[Space]
		_MainTex("Main Texture", 2D) = "white" {}
		_Color("Main tint", Color) = (0,0,0,0)
		_EmissionMap("Emission Map", 2D) = "white" {}
		[HDR]_EmissionColor("Emission Color", Color) = (0,0,0,0)
		_Metmap("Metallic Map (RGB)", 2D) = "white" {}
		_BumpMap("Normal Map", 2D) = "bump" {}
		_BumpScale("Normals Scale", Range( 0 , 1)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#include "UnityStandardUtils.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		#ifdef UNITY_PASS_SHADOWCASTER
			#undef INTERNAL_DATA
			#undef WorldReflectionVector
			#undef WorldNormalVector
			#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
			#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
			#define WorldNormalVector(data,normal) half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))
		#endif
		struct Input
		{
			float2 uv_texcoord;
			float3 viewDir;
			INTERNAL_DATA
			float3 worldNormal;
			float3 worldPos;
			float3 worldRefl;
		};

		struct SurfaceOutputCustomLightingCustom
		{
			half3 Albedo;
			half3 Normal;
			half3 Emission;
			half Metallic;
			half Smoothness;
			half Occlusion;
			half Alpha;
			Input SurfInput;
			UnityGIInput GIData;
		};

		uniform float4 _EmissionColor;
		uniform sampler2D _EmissionMap;
		uniform float4 _EmissionMap_ST;
		uniform float _us;
		uniform float _gsl;
		uniform float4 _Color;
		uniform sampler2D _MainTex;
		uniform float4 _MainTex_ST;
		uniform float4 _Mettint;
		uniform sampler2D _BumpMap;
		uniform float _BumpScale;
		uniform float4 _BumpMap_ST;
		uniform float _metp;
		uniform sampler2D _Metmap;
		uniform float4 _Metmap_ST;
		uniform float4 _MatCaptint;
		uniform sampler2D _MatCap;
		uniform float4 _MRt;
		uniform sampler2D _MR;
		uniform sampler2D _MRn;
		uniform float _In;
		uniform float _I;
		uniform float _Speed;
		uniform float4 _Cubemaptint;
		uniform samplerCUBE _RC;
		uniform sampler2D _RCn;
		uniform float _RCns;
		uniform float4 _RCn_ST;
		uniform float _Power;
		uniform float _BlackRim;
		uniform float _Multiplyer;


		float3 ShadeSH9177(  )
		{
			return ShadeSH9(float4(0.0, 1.0, 0.0, 1.0));
		}


		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			#ifdef UNITY_PASS_FORWARDBASE
			float ase_lightAtten = data.atten;
			if( _LightColor0.a == 0)
			ase_lightAtten = 0;
			#else
			float3 ase_lightAttenRGB = gi.light.color / ( ( _LightColor0.rgb ) + 0.000001 );
			float ase_lightAtten = max( max( ase_lightAttenRGB.r, ase_lightAttenRGB.g ), ase_lightAttenRGB.b );
			#endif
			#if defined(HANDLE_SHADOWS_BLENDING_IN_GI)
			half bakedAtten = UnitySampleBakedOcclusion(data.lightmapUV.xy, data.worldPos);
			float zDist = dot(_WorldSpaceCameraPos - data.worldPos, UNITY_MATRIX_V[2].xyz);
			float fadeDist = UnityComputeShadowFadeDistance(data.worldPos, zDist);
			ase_lightAtten = UnityMixRealtimeAndBakedShadows(data.atten, bakedAtten, UnityComputeShadowFade(fadeDist));
			#endif
			float2 uv_EmissionMap = i.uv_texcoord * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
			float3 localShadeSH9177 = ShadeSH9177();
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float4 temp_output_186_0 = ( float4( localShadeSH9177 , 0.0 ) + ( ase_lightAtten * ase_lightColor ) );
			float4 break567 = temp_output_186_0;
			float temp_output_569_0 = ( ( break567.r + break567.g + break567.b ) / 3.0 );
			float3 appendResult570 = (float3(temp_output_569_0 , temp_output_569_0 , temp_output_569_0));
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float2 uv_BumpMap = i.uv_texcoord * _BumpMap_ST.xy + _BumpMap_ST.zw;
			float3 tex2DNode259 = UnpackScaleNormal( tex2D( _BumpMap, uv_BumpMap ), _BumpScale );
			float3 normalizeResult4 = normalize( i.viewDir );
			float dotResult56 = dot( tex2DNode259 , normalizeResult4 );
			float3 temp_output_21_0 = ( 1.0 - normalizeResult4 );
			float dotResult3 = dot( tex2DNode259 , temp_output_21_0 );
			float temp_output_8_0 = saturate( dotResult3 );
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 temp_output_363_0 = ( ( mul( UNITY_MATRIX_V, float4( ase_worldNormal , 0.0 ) ).xyz * float3( 0.5,0.5,0.5 ) ) + float3( 0.5,0.5,0.5 ) );
			float dotResult351 = dot( temp_output_363_0 , float3(1,-0.25,1) );
			float dotResult369 = dot( temp_output_363_0 , float3(1,1,0.25) );
			float2 uv_Metmap = i.uv_texcoord * _Metmap_ST.xy + _Metmap_ST.zw;
			float4 tex2DNode302 = tex2D( _Metmap, uv_Metmap );
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 normalizeResult101 = normalize( i.viewDir );
			float3 appendResult100 = (float3(0.0 , 0.0 , ( _I * 2.0 )));
			float dotResult103 = dot( normalizeResult101 , appendResult100 );
			float2 temp_cast_14 = (( (temp_output_363_0).z + dotResult103 )).xx;
			float mulTime104 = _Time.y * ( _Speed * 0.05 );
			float cos117 = cos( mulTime104 );
			float sin117 = sin( mulTime104 );
			float2 rotator117 = mul( ( float3(-1,-1,1) * reflect( mul( unity_WorldToCamera, float4( ase_worldViewDir , 0.0 ) ).xyz , mul( unity_WorldToCamera, float4( (WorldNormalVector( i , UnpackScaleNormal( tex2D( _MRn, temp_cast_14 ), _In ) )) , 0.0 ) ).xyz ) ).xy - float2( 0.5,0.5 ) , float2x2( cos117 , -sin117 , sin117 , cos117 )) + float2( 0.5,0.5 );
			float2 uv_RCn = i.uv_texcoord * _RCn_ST.xy + _RCn_ST.zw;
			float dotResult207 = dot( temp_output_21_0 , float3( 0,0,1 ) );
			float4 temp_cast_20 = (( pow( saturate( dotResult207 ) , (30.0 + (_Power - 0.0) * (0.0 - 30.0) / (1.0 - 0.0)) ) * lerp(0.0,_Multiplyer,_BlackRim) )).xxxx;
			float4 temp_cast_26 = (( pow( saturate( dotResult207 ) , (30.0 + (_Power - 0.0) * (0.0 - 30.0) / (1.0 - 0.0)) ) * lerp(0.0,_Multiplyer,_BlackRim) )).xxxx;
			float4 temp_cast_27 = (0.0).xxxx;
			float4 temp_cast_28 = (5.0).xxxx;
			float4 clampResult255 = clamp( ( ( _EmissionColor * tex2D( _EmissionMap, uv_EmissionMap ) ) + lerp(( saturate( lerp(temp_output_186_0,float4( appendResult570 , 0.0 ),_gsl) ) * ( ( ( _Color * tex2D( _MainTex, uv_MainTex ) ) + ( _Mettint * ( ( pow( saturate( dotResult56 ) , (30.0 + (_metp - 0.0) * (5.0 - 30.0) / (1.0 - 0.0)) ) + ( pow( temp_output_8_0 , (30.0 + (_metp - 0.0) * (3.0 - 30.0) / (1.0 - 0.0)) ) * 2.0 ) ) * dotResult351 * dotResult369 * ( 1.0 - pow( temp_output_8_0 , 10.0 ) ) ) * tex2DNode302 ) + ( _MatCaptint * tex2D( _MatCap, ( temp_output_363_0 + tex2DNode259 ).xy ) * tex2DNode302 * 4.0 ) + ( _MRt * 4.0 * tex2DNode302 * tex2D( _MR, ( tex2DNode259 + float3( rotator117 ,  0.0 ) ).xy ) ) + ( _Cubemaptint * texCUBE( _RC, WorldReflectionVector( i , UnpackScaleNormal( tex2D( _RCn, uv_RCn ), _RCns ) ) ) * tex2DNode302 ) ) - temp_cast_20 ) ),( ( ( _Color * tex2D( _MainTex, uv_MainTex ) ) + ( _Mettint * ( ( pow( saturate( dotResult56 ) , (30.0 + (_metp - 0.0) * (5.0 - 30.0) / (1.0 - 0.0)) ) + ( pow( temp_output_8_0 , (30.0 + (_metp - 0.0) * (3.0 - 30.0) / (1.0 - 0.0)) ) * 2.0 ) ) * dotResult351 * dotResult369 * ( 1.0 - pow( temp_output_8_0 , 10.0 ) ) ) * tex2DNode302 ) + ( _MatCaptint * tex2D( _MatCap, ( temp_output_363_0 + tex2DNode259 ).xy ) * tex2DNode302 * 4.0 ) + ( _MRt * 4.0 * tex2DNode302 * tex2D( _MR, ( tex2DNode259 + float3( rotator117 ,  0.0 ) ).xy ) ) + ( _Cubemaptint * texCUBE( _RC, WorldReflectionVector( i , UnpackScaleNormal( tex2D( _RCn, uv_RCn ), _RCns ) ) ) * tex2DNode302 ) ) - temp_cast_20 ),_us) ) , temp_cast_27 , temp_cast_28 );
			c.rgb = clampResult255.rgb;
			c.a = 1;
			return c;
		}

		inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
		{
			s.GIData = data;
		}

		void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
		{
			o.SurfInput = i;
			o.Normal = float3(0,0,1);
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf StandardCustomLighting keepalpha fullforwardshadows noshadow 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float2 customPack1 : TEXCOORD1;
				float4 tSpace0 : TEXCOORD2;
				float4 tSpace1 : TEXCOORD3;
				float4 tSpace2 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				half3 worldTangent = UnityObjectToWorldDir( v.tangent.xyz );
				half tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				half3 worldBinormal = cross( worldNormal, worldTangent ) * tangentSign;
				o.tSpace0 = float4( worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x );
				o.tSpace1 = float4( worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y );
				o.tSpace2 = float4( worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z );
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv_texcoord = IN.customPack1.xy;
				float3 worldPos = float3( IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w );
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.viewDir = IN.tSpace0.xyz * worldViewDir.x + IN.tSpace1.xyz * worldViewDir.y + IN.tSpace2.xyz * worldViewDir.z;
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = float3( IN.tSpace0.z, IN.tSpace1.z, IN.tSpace2.z );
				surfIN.worldRefl = -worldViewDir;
				surfIN.internalSurfaceTtoW0 = IN.tSpace0.xyz;
				surfIN.internalSurfaceTtoW1 = IN.tSpace1.xyz;
				surfIN.internalSurfaceTtoW2 = IN.tSpace2.xyz;
				SurfaceOutputCustomLightingCustom o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputCustomLightingCustom, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}