Shader "Rollthered/Fire" {
	Properties {
		_FresnelPower ("Fresnel Power", Range(0, 5)) = 2
		[HideInInspector] _FresnelScale ("Fresnel Scale", Range(0, 0.3)) = 1.5
		_EdgeLength ("Edge length", Range(2, 50)) = 13.5
		_FresnelBias ("Fresnel Bias", Range(0, 0.2)) = 0.2364706
		[HDR] _Flamecolor2 ("Flame color 2", Vector) = (1,0,0,0)
		[HDR] _FlameColor ("Flame Color", Vector) = (1,0.8068966,0,0)
		_Y_Mask ("Y_Mask", Range(0, 5)) = 0
		_FlameHeight ("Flame Height", Range(0, 1)) = 0
		_Flamenoise ("Flame noise", 2D) = "white" {}
		_FlameWave ("Flame Wave", 2D) = "white" {}
		_v ("v", Range(-1, 1)) = 0
		_u ("u", Range(-1, 1)) = 0
		_Alpha ("Alpha", Range(0, 1)) = 0
		[HideInInspector] __dirty ("", Float) = 1
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "QUEUE" = "Transparent+100" "RenderType" = "Transparent" }
		Pass {
			Name "FORWARD"
			Tags { "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent+100" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ColorMask RGB -1
			ZWrite Off
			Cull Front
			GpuProgramID 53104
			Program "vp" {
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" }
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec4 in_TANGENT0;
					layout(location = 2) in  vec3 in_NORMAL0;
					layout(location = 3) in  vec4 in_TEXCOORD0;
					layout(location = 4) in  vec4 in_TEXCOORD1;
					layout(location = 5) in  vec4 in_TEXCOORD2;
					layout(location = 6) in  vec4 in_TEXCOORD3;
					layout(location = 7) in  vec4 in_COLOR0;
					layout(location = 0) out vec4 vs_INTERNALTESSPOS0;
					layout(location = 1) out vec4 vs_TANGENT0;
					layout(location = 2) out vec3 vs_NORMAL0;
					layout(location = 3) out vec4 vs_TEXCOORD0;
					layout(location = 4) out vec4 vs_TEXCOORD1;
					layout(location = 5) out vec4 vs_TEXCOORD2;
					layout(location = 6) out vec4 vs_TEXCOORD3;
					layout(location = 7) out vec4 vs_COLOR0;
					void main()
					{
					    vs_INTERNALTESSPOS0 = in_POSITION0;
					    vs_TANGENT0 = in_TANGENT0;
					    vs_NORMAL0.xyz = in_NORMAL0.xyz;
					    vs_TEXCOORD0 = in_TEXCOORD0;
					    vs_TEXCOORD1 = in_TEXCOORD1;
					    vs_TEXCOORD2 = in_TEXCOORD2;
					    vs_TEXCOORD3 = in_TEXCOORD3;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec4 in_TANGENT0;
					layout(location = 2) in  vec3 in_NORMAL0;
					layout(location = 3) in  vec4 in_TEXCOORD0;
					layout(location = 4) in  vec4 in_TEXCOORD1;
					layout(location = 5) in  vec4 in_TEXCOORD2;
					layout(location = 6) in  vec4 in_TEXCOORD3;
					layout(location = 7) in  vec4 in_COLOR0;
					layout(location = 0) out vec4 vs_INTERNALTESSPOS0;
					layout(location = 1) out vec4 vs_TANGENT0;
					layout(location = 2) out vec3 vs_NORMAL0;
					layout(location = 3) out vec4 vs_TEXCOORD0;
					layout(location = 4) out vec4 vs_TEXCOORD1;
					layout(location = 5) out vec4 vs_TEXCOORD2;
					layout(location = 6) out vec4 vs_TEXCOORD3;
					layout(location = 7) out vec4 vs_COLOR0;
					void main()
					{
					    vs_INTERNALTESSPOS0 = in_POSITION0;
					    vs_TANGENT0 = in_TANGENT0;
					    vs_NORMAL0.xyz = in_NORMAL0.xyz;
					    vs_TEXCOORD0 = in_TEXCOORD0;
					    vs_TEXCOORD1 = in_TEXCOORD1;
					    vs_TEXCOORD2 = in_TEXCOORD2;
					    vs_TEXCOORD3 = in_TEXCOORD3;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec4 in_TANGENT0;
					layout(location = 2) in  vec3 in_NORMAL0;
					layout(location = 3) in  vec4 in_TEXCOORD0;
					layout(location = 4) in  vec4 in_TEXCOORD1;
					layout(location = 5) in  vec4 in_TEXCOORD2;
					layout(location = 6) in  vec4 in_TEXCOORD3;
					layout(location = 7) in  vec4 in_COLOR0;
					layout(location = 0) out vec4 vs_INTERNALTESSPOS0;
					layout(location = 1) out vec4 vs_TANGENT0;
					layout(location = 2) out vec3 vs_NORMAL0;
					layout(location = 3) out vec4 vs_TEXCOORD0;
					layout(location = 4) out vec4 vs_TEXCOORD1;
					layout(location = 5) out vec4 vs_TEXCOORD2;
					layout(location = 6) out vec4 vs_TEXCOORD3;
					layout(location = 7) out vec4 vs_COLOR0;
					void main()
					{
					    vs_INTERNALTESSPOS0 = in_POSITION0;
					    vs_TANGENT0 = in_TANGENT0;
					    vs_NORMAL0.xyz = in_NORMAL0.xyz;
					    vs_TEXCOORD0 = in_TEXCOORD0;
					    vs_TEXCOORD1 = in_TEXCOORD1;
					    vs_TEXCOORD2 = in_TEXCOORD2;
					    vs_TEXCOORD3 = in_TEXCOORD3;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec4 in_TANGENT0;
					layout(location = 2) in  vec3 in_NORMAL0;
					layout(location = 3) in  vec4 in_TEXCOORD0;
					layout(location = 4) in  vec4 in_TEXCOORD1;
					layout(location = 5) in  vec4 in_TEXCOORD2;
					layout(location = 6) in  vec4 in_TEXCOORD3;
					layout(location = 7) in  vec4 in_COLOR0;
					layout(location = 0) out vec4 vs_INTERNALTESSPOS0;
					layout(location = 1) out vec4 vs_TANGENT0;
					layout(location = 2) out vec3 vs_NORMAL0;
					layout(location = 3) out vec4 vs_TEXCOORD0;
					layout(location = 4) out vec4 vs_TEXCOORD1;
					layout(location = 5) out vec4 vs_TEXCOORD2;
					layout(location = 6) out vec4 vs_TEXCOORD3;
					layout(location = 7) out vec4 vs_COLOR0;
					void main()
					{
					    vs_INTERNALTESSPOS0 = in_POSITION0;
					    vs_TANGENT0 = in_TANGENT0;
					    vs_NORMAL0.xyz = in_NORMAL0.xyz;
					    vs_TEXCOORD0 = in_TEXCOORD0;
					    vs_TEXCOORD1 = in_TEXCOORD1;
					    vs_TEXCOORD2 = in_TEXCOORD2;
					    vs_TEXCOORD3 = in_TEXCOORD3;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" }
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2[3];
						float _Y_Mask;
						vec4 _Flamecolor2;
						vec4 _FlameColor;
						float _FresnelBias;
						float _FresnelScale;
						float _FresnelPower;
						float _Alpha;
						vec4 unused_0_10;
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(binding = 2, std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_2_3;
					};
					layout(binding = 3, std140) uniform UnityReflectionProbes {
						vec4 unity_SpecCube0_BoxMax;
						vec4 unity_SpecCube0_BoxMin;
						vec4 unity_SpecCube0_ProbePosition;
						vec4 unity_SpecCube0_HDR;
						vec4 unity_SpecCube1_BoxMax;
						vec4 unity_SpecCube1_BoxMin;
						vec4 unity_SpecCube1_ProbePosition;
						vec4 unity_SpecCube1_HDR;
					};
					layout(binding = 4, std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					layout(location = 5) uniform  samplerCube unity_SpecCube0;
					layout(location = 6) uniform  samplerCube unity_SpecCube1;
					layout(location = 7) uniform  sampler3D unity_ProbeVolumeSH;
					layout(location = 0) in  vec3 vs_TEXCOORD0;
					layout(location = 1) in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					float u_xlat16_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat10_5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					vec4 u_xlat10_7;
					vec3 u_xlat8;
					bvec3 u_xlatb8;
					vec3 u_xlat9;
					bvec3 u_xlatb10;
					vec3 u_xlat11;
					float u_xlat33;
					float u_xlat34;
					float u_xlat35;
					float u_xlat16_35;
					bool u_xlatb35;
					float u_xlat36;
					bool u_xlatb36;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat33 = inversesqrt(u_xlat33);
					    u_xlat1.xyz = vec3(u_xlat33) * u_xlat0.xyz;
					    u_xlat34 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
					    u_xlat34 = inversesqrt(u_xlat34);
					    u_xlat2.xyz = vec3(u_xlat34) * vs_TEXCOORD0.xyz;
					    u_xlat34 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat35 = (-u_xlat34) + 1.0;
					    u_xlat35 = log2(u_xlat35);
					    u_xlat35 = u_xlat35 * _FresnelPower;
					    u_xlat35 = exp2(u_xlat35);
					    u_xlat35 = _FresnelScale * u_xlat35 + _FresnelBias;
					    u_xlat3.xyz = (-_Flamecolor2.xyz) + _FlameColor.xyz;
					    u_xlat3.xyz = vec3(u_xlat35) * u_xlat3.xyz + _Flamecolor2.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat36 = (-vs_TEXCOORD0.y) + _Y_Mask;
					    u_xlat36 = abs(u_xlat36) + (-_Y_Mask);
					    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
					    u_xlat36 = (-u_xlat36) + 1.0;
					    u_xlat35 = u_xlat35 * u_xlat36;
					    SV_Target0.w = u_xlat35 * _Alpha;
					    u_xlatb35 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb35){
					        u_xlatb35 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat4.xyz = vs_TEXCOORD1.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat4.xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD1.zzz + u_xlat4.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat4.xyz : vs_TEXCOORD1.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat35 = u_xlat4.y * 0.25 + 0.75;
					        u_xlat36 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat4.x = max(u_xlat35, u_xlat36);
					        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
					    } else {
					        u_xlat4.x = float(1.0);
					        u_xlat4.y = float(1.0);
					        u_xlat4.z = float(1.0);
					        u_xlat4.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat35 = dot(u_xlat4, unity_OcclusionMaskSelector);
					    u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
					    u_xlat36 = dot((-u_xlat1.xyz), vs_TEXCOORD0.xyz);
					    u_xlat36 = u_xlat36 + u_xlat36;
					    u_xlat1.xyz = vs_TEXCOORD0.xyz * (-vec3(u_xlat36)) + (-u_xlat1.xyz);
					    u_xlat4.xyz = vec3(u_xlat35) * _LightColor0.xyz;
					    u_xlatb35 = 0.0<unity_SpecCube0_ProbePosition.w;
					    if(u_xlatb35){
					        u_xlat35 = dot(u_xlat1.xyz, u_xlat1.xyz);
					        u_xlat35 = inversesqrt(u_xlat35);
					        u_xlat5.xyz = u_xlat1.xyz * vec3(u_xlat35);
					        u_xlat6.xyz = (-vs_TEXCOORD1.xyz) + unity_SpecCube0_BoxMax.xyz;
					        u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
					        u_xlat7.xyz = (-vs_TEXCOORD1.xyz) + unity_SpecCube0_BoxMin.xyz;
					        u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
					        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
					        {
					            vec3 hlslcc_movcTemp = u_xlat6;
					            hlslcc_movcTemp.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
					            hlslcc_movcTemp.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
					            hlslcc_movcTemp.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
					            u_xlat6 = hlslcc_movcTemp;
					        }
					        u_xlat35 = min(u_xlat6.y, u_xlat6.x);
					        u_xlat35 = min(u_xlat6.z, u_xlat35);
					        u_xlat6.xyz = vs_TEXCOORD1.xyz + (-unity_SpecCube0_ProbePosition.xyz);
					        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat6.xyz;
					    } else {
					        u_xlat5.xyz = u_xlat1.xyz;
					    //ENDIF
					    }
					    u_xlat10_5 = textureLod(unity_SpecCube0, u_xlat5.xyz, 6.0);
					    u_xlat16_35 = u_xlat10_5.w + -1.0;
					    u_xlat35 = unity_SpecCube0_HDR.w * u_xlat16_35 + 1.0;
					    u_xlat35 = log2(u_xlat35);
					    u_xlat35 = u_xlat35 * unity_SpecCube0_HDR.y;
					    u_xlat35 = exp2(u_xlat35);
					    u_xlat35 = u_xlat35 * unity_SpecCube0_HDR.x;
					    u_xlat6.xyz = u_xlat10_5.xyz * vec3(u_xlat35);
					    u_xlatb36 = unity_SpecCube0_BoxMin.w<0.999989986;
					    if(u_xlatb36){
					        u_xlatb36 = 0.0<unity_SpecCube1_ProbePosition.w;
					        if(u_xlatb36){
					            u_xlat36 = dot(u_xlat1.xyz, u_xlat1.xyz);
					            u_xlat36 = inversesqrt(u_xlat36);
					            u_xlat7.xyz = u_xlat1.xyz * vec3(u_xlat36);
					            u_xlat8.xyz = (-vs_TEXCOORD1.xyz) + unity_SpecCube1_BoxMax.xyz;
					            u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
					            u_xlat9.xyz = (-vs_TEXCOORD1.xyz) + unity_SpecCube1_BoxMin.xyz;
					            u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
					            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
					            {
					                vec3 hlslcc_movcTemp = u_xlat8;
					                hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
					                hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
					                hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
					                u_xlat8 = hlslcc_movcTemp;
					            }
					            u_xlat36 = min(u_xlat8.y, u_xlat8.x);
					            u_xlat36 = min(u_xlat8.z, u_xlat36);
					            u_xlat8.xyz = vs_TEXCOORD1.xyz + (-unity_SpecCube1_ProbePosition.xyz);
					            u_xlat1.xyz = u_xlat7.xyz * vec3(u_xlat36) + u_xlat8.xyz;
					        //ENDIF
					        }
					        u_xlat10_7 = textureLod(unity_SpecCube1, u_xlat1.xyz, 6.0);
					        u_xlat16_1 = u_xlat10_7.w + -1.0;
					        u_xlat1.x = unity_SpecCube1_HDR.w * u_xlat16_1 + 1.0;
					        u_xlat1.x = log2(u_xlat1.x);
					        u_xlat1.x = u_xlat1.x * unity_SpecCube1_HDR.y;
					        u_xlat1.x = exp2(u_xlat1.x);
					        u_xlat1.x = u_xlat1.x * unity_SpecCube1_HDR.x;
					        u_xlat1.xyz = u_xlat10_7.xyz * u_xlat1.xxx;
					        u_xlat5.xyz = vec3(u_xlat35) * u_xlat10_5.xyz + (-u_xlat1.xyz);
					        u_xlat6.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat1.xyz;
					    //ENDIF
					    }
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat33) + _WorldSpaceLightPos0.xyz;
					    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat33 = max(u_xlat33, 0.00100000005);
					    u_xlat33 = inversesqrt(u_xlat33);
					    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
					    u_xlat33 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
					    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat11.x = abs(u_xlat34) + u_xlat33;
					    u_xlat11.x = u_xlat11.x + 9.99999975e-06;
					    u_xlat11.x = 0.5 / u_xlat11.x;
					    u_xlat11.x = u_xlat11.x * 0.999999881;
					    u_xlat11.x = u_xlat33 * u_xlat11.x;
					    u_xlat11.xyz = u_xlat4.xyz * u_xlat11.xxx;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * 0.959999979 + 0.0399999991;
					    u_xlat1.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat34 = -abs(u_xlat34) + 1.0;
					    u_xlat2.x = u_xlat34 * u_xlat34;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat34 = u_xlat34 * u_xlat2.x;
					    u_xlat34 = u_xlat34 * 2.23517418e-08 + 0.0399999991;
					    u_xlat1.xyz = vec3(u_xlat34) * u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat11.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat3.xyz + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2[3];
						float _Y_Mask;
						vec4 _Flamecolor2;
						vec4 _FlameColor;
						float _FresnelBias;
						float _FresnelScale;
						float _FresnelPower;
						float _Alpha;
						vec4 unused_0_10;
					};
					layout(binding = 1, std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_1_3;
					};
					layout(binding = 2, std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(binding = 3, std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(binding = 4, std140) uniform UnityReflectionProbes {
						vec4 unity_SpecCube0_BoxMax;
						vec4 unity_SpecCube0_BoxMin;
						vec4 unity_SpecCube0_ProbePosition;
						vec4 unity_SpecCube0_HDR;
						vec4 unity_SpecCube1_BoxMax;
						vec4 unity_SpecCube1_BoxMin;
						vec4 unity_SpecCube1_ProbePosition;
						vec4 unity_SpecCube1_HDR;
					};
					layout(binding = 5, std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					layout(location = 6) uniform  samplerCube unity_SpecCube0;
					layout(location = 7) uniform  samplerCube unity_SpecCube1;
					layout(location = 8) uniform  sampler3D unity_ProbeVolumeSH;
					layout(location = 0) in  vec3 vs_TEXCOORD0;
					layout(location = 1) in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					int u_xlati0;
					vec3 u_xlat1;
					float u_xlat16_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat10_5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					vec4 u_xlat10_7;
					vec3 u_xlat8;
					bvec3 u_xlatb8;
					vec3 u_xlat9;
					bvec3 u_xlatb10;
					vec3 u_xlat11;
					float u_xlat33;
					float u_xlat34;
					float u_xlat35;
					float u_xlat16_35;
					bool u_xlatb35;
					float u_xlat36;
					bool u_xlatb36;
					void main()
					{
					    u_xlati0 = unity_StereoEyeIndex;
					    u_xlat0.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati0].xyz;
					    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat33 = inversesqrt(u_xlat33);
					    u_xlat1.xyz = vec3(u_xlat33) * u_xlat0.xyz;
					    u_xlat34 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
					    u_xlat34 = inversesqrt(u_xlat34);
					    u_xlat2.xyz = vec3(u_xlat34) * vs_TEXCOORD0.xyz;
					    u_xlat34 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat35 = (-u_xlat34) + 1.0;
					    u_xlat35 = log2(u_xlat35);
					    u_xlat35 = u_xlat35 * _FresnelPower;
					    u_xlat35 = exp2(u_xlat35);
					    u_xlat35 = _FresnelScale * u_xlat35 + _FresnelBias;
					    u_xlat3.xyz = (-_Flamecolor2.xyz) + _FlameColor.xyz;
					    u_xlat3.xyz = vec3(u_xlat35) * u_xlat3.xyz + _Flamecolor2.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat36 = (-vs_TEXCOORD0.y) + _Y_Mask;
					    u_xlat36 = abs(u_xlat36) + (-_Y_Mask);
					    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
					    u_xlat36 = (-u_xlat36) + 1.0;
					    u_xlat35 = u_xlat35 * u_xlat36;
					    SV_Target0.w = u_xlat35 * _Alpha;
					    u_xlatb35 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb35){
					        u_xlatb35 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat4.xyz = vs_TEXCOORD1.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat4.xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD1.zzz + u_xlat4.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat4.xyz : vs_TEXCOORD1.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat35 = u_xlat4.y * 0.25 + 0.75;
					        u_xlat36 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat4.x = max(u_xlat35, u_xlat36);
					        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
					    } else {
					        u_xlat4.x = float(1.0);
					        u_xlat4.y = float(1.0);
					        u_xlat4.z = float(1.0);
					        u_xlat4.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat35 = dot(u_xlat4, unity_OcclusionMaskSelector);
					    u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
					    u_xlat36 = dot((-u_xlat1.xyz), vs_TEXCOORD0.xyz);
					    u_xlat36 = u_xlat36 + u_xlat36;
					    u_xlat1.xyz = vs_TEXCOORD0.xyz * (-vec3(u_xlat36)) + (-u_xlat1.xyz);
					    u_xlat4.xyz = vec3(u_xlat35) * _LightColor0.xyz;
					    u_xlatb35 = 0.0<unity_SpecCube0_ProbePosition.w;
					    if(u_xlatb35){
					        u_xlat35 = dot(u_xlat1.xyz, u_xlat1.xyz);
					        u_xlat35 = inversesqrt(u_xlat35);
					        u_xlat5.xyz = u_xlat1.xyz * vec3(u_xlat35);
					        u_xlat6.xyz = (-vs_TEXCOORD1.xyz) + unity_SpecCube0_BoxMax.xyz;
					        u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
					        u_xlat7.xyz = (-vs_TEXCOORD1.xyz) + unity_SpecCube0_BoxMin.xyz;
					        u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
					        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
					        {
					            vec3 hlslcc_movcTemp = u_xlat6;
					            hlslcc_movcTemp.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
					            hlslcc_movcTemp.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
					            hlslcc_movcTemp.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
					            u_xlat6 = hlslcc_movcTemp;
					        }
					        u_xlat35 = min(u_xlat6.y, u_xlat6.x);
					        u_xlat35 = min(u_xlat6.z, u_xlat35);
					        u_xlat6.xyz = vs_TEXCOORD1.xyz + (-unity_SpecCube0_ProbePosition.xyz);
					        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat6.xyz;
					    } else {
					        u_xlat5.xyz = u_xlat1.xyz;
					    //ENDIF
					    }
					    u_xlat10_5 = textureLod(unity_SpecCube0, u_xlat5.xyz, 6.0);
					    u_xlat16_35 = u_xlat10_5.w + -1.0;
					    u_xlat35 = unity_SpecCube0_HDR.w * u_xlat16_35 + 1.0;
					    u_xlat35 = log2(u_xlat35);
					    u_xlat35 = u_xlat35 * unity_SpecCube0_HDR.y;
					    u_xlat35 = exp2(u_xlat35);
					    u_xlat35 = u_xlat35 * unity_SpecCube0_HDR.x;
					    u_xlat6.xyz = u_xlat10_5.xyz * vec3(u_xlat35);
					    u_xlatb36 = unity_SpecCube0_BoxMin.w<0.999989986;
					    if(u_xlatb36){
					        u_xlatb36 = 0.0<unity_SpecCube1_ProbePosition.w;
					        if(u_xlatb36){
					            u_xlat36 = dot(u_xlat1.xyz, u_xlat1.xyz);
					            u_xlat36 = inversesqrt(u_xlat36);
					            u_xlat7.xyz = u_xlat1.xyz * vec3(u_xlat36);
					            u_xlat8.xyz = (-vs_TEXCOORD1.xyz) + unity_SpecCube1_BoxMax.xyz;
					            u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
					            u_xlat9.xyz = (-vs_TEXCOORD1.xyz) + unity_SpecCube1_BoxMin.xyz;
					            u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
					            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
					            {
					                vec3 hlslcc_movcTemp = u_xlat8;
					                hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
					                hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
					                hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
					                u_xlat8 = hlslcc_movcTemp;
					            }
					            u_xlat36 = min(u_xlat8.y, u_xlat8.x);
					            u_xlat36 = min(u_xlat8.z, u_xlat36);
					            u_xlat8.xyz = vs_TEXCOORD1.xyz + (-unity_SpecCube1_ProbePosition.xyz);
					            u_xlat1.xyz = u_xlat7.xyz * vec3(u_xlat36) + u_xlat8.xyz;
					        //ENDIF
					        }
					        u_xlat10_7 = textureLod(unity_SpecCube1, u_xlat1.xyz, 6.0);
					        u_xlat16_1 = u_xlat10_7.w + -1.0;
					        u_xlat1.x = unity_SpecCube1_HDR.w * u_xlat16_1 + 1.0;
					        u_xlat1.x = log2(u_xlat1.x);
					        u_xlat1.x = u_xlat1.x * unity_SpecCube1_HDR.y;
					        u_xlat1.x = exp2(u_xlat1.x);
					        u_xlat1.x = u_xlat1.x * unity_SpecCube1_HDR.x;
					        u_xlat1.xyz = u_xlat10_7.xyz * u_xlat1.xxx;
					        u_xlat5.xyz = vec3(u_xlat35) * u_xlat10_5.xyz + (-u_xlat1.xyz);
					        u_xlat6.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat1.xyz;
					    //ENDIF
					    }
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat33) + _WorldSpaceLightPos0.xyz;
					    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat33 = max(u_xlat33, 0.00100000005);
					    u_xlat33 = inversesqrt(u_xlat33);
					    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
					    u_xlat33 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
					    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat11.x = abs(u_xlat34) + u_xlat33;
					    u_xlat11.x = u_xlat11.x + 9.99999975e-06;
					    u_xlat11.x = 0.5 / u_xlat11.x;
					    u_xlat11.x = u_xlat11.x * 0.999999881;
					    u_xlat11.x = u_xlat33 * u_xlat11.x;
					    u_xlat11.xyz = u_xlat4.xyz * u_xlat11.xxx;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * 0.959999979 + 0.0399999991;
					    u_xlat1.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat34 = -abs(u_xlat34) + 1.0;
					    u_xlat2.x = u_xlat34 * u_xlat34;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat34 = u_xlat34 * u_xlat2.x;
					    u_xlat34 = u_xlat34 * 2.23517418e-08 + 0.0399999991;
					    u_xlat1.xyz = vec3(u_xlat34) * u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat11.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat3.xyz + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2[3];
						float _Y_Mask;
						vec4 _Flamecolor2;
						vec4 _FlameColor;
						float _FresnelBias;
						float _FresnelScale;
						float _FresnelPower;
						float _Alpha;
						vec4 unused_0_10;
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(binding = 2, std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_2_3;
					};
					layout(binding = 3, std140) uniform UnityReflectionProbes {
						vec4 unity_SpecCube0_BoxMax;
						vec4 unity_SpecCube0_BoxMin;
						vec4 unity_SpecCube0_ProbePosition;
						vec4 unity_SpecCube0_HDR;
						vec4 unity_SpecCube1_BoxMax;
						vec4 unity_SpecCube1_BoxMin;
						vec4 unity_SpecCube1_ProbePosition;
						vec4 unity_SpecCube1_HDR;
					};
					layout(binding = 4, std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					layout(location = 5) uniform  samplerCube unity_SpecCube0;
					layout(location = 6) uniform  samplerCube unity_SpecCube1;
					layout(location = 7) uniform  sampler3D unity_ProbeVolumeSH;
					layout(location = 0) in  vec3 vs_TEXCOORD0;
					layout(location = 1) in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					float u_xlat16_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat10_5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					vec4 u_xlat10_7;
					vec3 u_xlat8;
					bvec3 u_xlatb8;
					vec3 u_xlat9;
					bvec3 u_xlatb10;
					vec3 u_xlat11;
					float u_xlat33;
					float u_xlat34;
					float u_xlat35;
					float u_xlat16_35;
					bool u_xlatb35;
					float u_xlat36;
					bool u_xlatb36;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat33 = inversesqrt(u_xlat33);
					    u_xlat1.xyz = vec3(u_xlat33) * u_xlat0.xyz;
					    u_xlat34 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
					    u_xlat34 = inversesqrt(u_xlat34);
					    u_xlat2.xyz = vec3(u_xlat34) * vs_TEXCOORD0.xyz;
					    u_xlat34 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat35 = (-u_xlat34) + 1.0;
					    u_xlat35 = log2(u_xlat35);
					    u_xlat35 = u_xlat35 * _FresnelPower;
					    u_xlat35 = exp2(u_xlat35);
					    u_xlat35 = _FresnelScale * u_xlat35 + _FresnelBias;
					    u_xlat3.xyz = (-_Flamecolor2.xyz) + _FlameColor.xyz;
					    u_xlat3.xyz = vec3(u_xlat35) * u_xlat3.xyz + _Flamecolor2.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat36 = (-vs_TEXCOORD0.y) + _Y_Mask;
					    u_xlat36 = abs(u_xlat36) + (-_Y_Mask);
					    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
					    u_xlat36 = (-u_xlat36) + 1.0;
					    u_xlat35 = u_xlat35 * u_xlat36;
					    SV_Target0.w = u_xlat35 * _Alpha;
					    u_xlatb35 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb35){
					        u_xlatb35 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat4.xyz = vs_TEXCOORD1.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat4.xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD1.zzz + u_xlat4.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat4.xyz : vs_TEXCOORD1.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat35 = u_xlat4.y * 0.25 + 0.75;
					        u_xlat36 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat4.x = max(u_xlat35, u_xlat36);
					        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
					    } else {
					        u_xlat4.x = float(1.0);
					        u_xlat4.y = float(1.0);
					        u_xlat4.z = float(1.0);
					        u_xlat4.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat35 = dot(u_xlat4, unity_OcclusionMaskSelector);
					    u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
					    u_xlat36 = dot((-u_xlat1.xyz), vs_TEXCOORD0.xyz);
					    u_xlat36 = u_xlat36 + u_xlat36;
					    u_xlat1.xyz = vs_TEXCOORD0.xyz * (-vec3(u_xlat36)) + (-u_xlat1.xyz);
					    u_xlat4.xyz = vec3(u_xlat35) * _LightColor0.xyz;
					    u_xlatb35 = 0.0<unity_SpecCube0_ProbePosition.w;
					    if(u_xlatb35){
					        u_xlat35 = dot(u_xlat1.xyz, u_xlat1.xyz);
					        u_xlat35 = inversesqrt(u_xlat35);
					        u_xlat5.xyz = u_xlat1.xyz * vec3(u_xlat35);
					        u_xlat6.xyz = (-vs_TEXCOORD1.xyz) + unity_SpecCube0_BoxMax.xyz;
					        u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
					        u_xlat7.xyz = (-vs_TEXCOORD1.xyz) + unity_SpecCube0_BoxMin.xyz;
					        u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
					        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
					        {
					            vec3 hlslcc_movcTemp = u_xlat6;
					            hlslcc_movcTemp.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
					            hlslcc_movcTemp.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
					            hlslcc_movcTemp.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
					            u_xlat6 = hlslcc_movcTemp;
					        }
					        u_xlat35 = min(u_xlat6.y, u_xlat6.x);
					        u_xlat35 = min(u_xlat6.z, u_xlat35);
					        u_xlat6.xyz = vs_TEXCOORD1.xyz + (-unity_SpecCube0_ProbePosition.xyz);
					        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat6.xyz;
					    } else {
					        u_xlat5.xyz = u_xlat1.xyz;
					    //ENDIF
					    }
					    u_xlat10_5 = textureLod(unity_SpecCube0, u_xlat5.xyz, 6.0);
					    u_xlat16_35 = u_xlat10_5.w + -1.0;
					    u_xlat35 = unity_SpecCube0_HDR.w * u_xlat16_35 + 1.0;
					    u_xlat35 = log2(u_xlat35);
					    u_xlat35 = u_xlat35 * unity_SpecCube0_HDR.y;
					    u_xlat35 = exp2(u_xlat35);
					    u_xlat35 = u_xlat35 * unity_SpecCube0_HDR.x;
					    u_xlat6.xyz = u_xlat10_5.xyz * vec3(u_xlat35);
					    u_xlatb36 = unity_SpecCube0_BoxMin.w<0.999989986;
					    if(u_xlatb36){
					        u_xlatb36 = 0.0<unity_SpecCube1_ProbePosition.w;
					        if(u_xlatb36){
					            u_xlat36 = dot(u_xlat1.xyz, u_xlat1.xyz);
					            u_xlat36 = inversesqrt(u_xlat36);
					            u_xlat7.xyz = u_xlat1.xyz * vec3(u_xlat36);
					            u_xlat8.xyz = (-vs_TEXCOORD1.xyz) + unity_SpecCube1_BoxMax.xyz;
					            u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
					            u_xlat9.xyz = (-vs_TEXCOORD1.xyz) + unity_SpecCube1_BoxMin.xyz;
					            u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
					            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
					            {
					                vec3 hlslcc_movcTemp = u_xlat8;
					                hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
					                hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
					                hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
					                u_xlat8 = hlslcc_movcTemp;
					            }
					            u_xlat36 = min(u_xlat8.y, u_xlat8.x);
					            u_xlat36 = min(u_xlat8.z, u_xlat36);
					            u_xlat8.xyz = vs_TEXCOORD1.xyz + (-unity_SpecCube1_ProbePosition.xyz);
					            u_xlat1.xyz = u_xlat7.xyz * vec3(u_xlat36) + u_xlat8.xyz;
					        //ENDIF
					        }
					        u_xlat10_7 = textureLod(unity_SpecCube1, u_xlat1.xyz, 6.0);
					        u_xlat16_1 = u_xlat10_7.w + -1.0;
					        u_xlat1.x = unity_SpecCube1_HDR.w * u_xlat16_1 + 1.0;
					        u_xlat1.x = log2(u_xlat1.x);
					        u_xlat1.x = u_xlat1.x * unity_SpecCube1_HDR.y;
					        u_xlat1.x = exp2(u_xlat1.x);
					        u_xlat1.x = u_xlat1.x * unity_SpecCube1_HDR.x;
					        u_xlat1.xyz = u_xlat10_7.xyz * u_xlat1.xxx;
					        u_xlat5.xyz = vec3(u_xlat35) * u_xlat10_5.xyz + (-u_xlat1.xyz);
					        u_xlat6.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat1.xyz;
					    //ENDIF
					    }
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat33) + _WorldSpaceLightPos0.xyz;
					    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat33 = max(u_xlat33, 0.00100000005);
					    u_xlat33 = inversesqrt(u_xlat33);
					    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
					    u_xlat33 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
					    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat11.x = abs(u_xlat34) + u_xlat33;
					    u_xlat11.x = u_xlat11.x + 9.99999975e-06;
					    u_xlat11.x = 0.5 / u_xlat11.x;
					    u_xlat11.x = u_xlat11.x * 0.999999881;
					    u_xlat11.x = u_xlat33 * u_xlat11.x;
					    u_xlat11.xyz = u_xlat4.xyz * u_xlat11.xxx;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * 0.959999979 + 0.0399999991;
					    u_xlat1.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat34 = -abs(u_xlat34) + 1.0;
					    u_xlat2.x = u_xlat34 * u_xlat34;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat34 = u_xlat34 * u_xlat2.x;
					    u_xlat34 = u_xlat34 * 2.23517418e-08 + 0.0399999991;
					    u_xlat1.xyz = vec3(u_xlat34) * u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat11.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat3.xyz + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2[3];
						float _Y_Mask;
						vec4 _Flamecolor2;
						vec4 _FlameColor;
						float _FresnelBias;
						float _FresnelScale;
						float _FresnelPower;
						float _Alpha;
						vec4 unused_0_10;
					};
					layout(binding = 1, std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_1_3;
					};
					layout(binding = 2, std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(binding = 3, std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(binding = 4, std140) uniform UnityReflectionProbes {
						vec4 unity_SpecCube0_BoxMax;
						vec4 unity_SpecCube0_BoxMin;
						vec4 unity_SpecCube0_ProbePosition;
						vec4 unity_SpecCube0_HDR;
						vec4 unity_SpecCube1_BoxMax;
						vec4 unity_SpecCube1_BoxMin;
						vec4 unity_SpecCube1_ProbePosition;
						vec4 unity_SpecCube1_HDR;
					};
					layout(binding = 5, std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					layout(location = 6) uniform  samplerCube unity_SpecCube0;
					layout(location = 7) uniform  samplerCube unity_SpecCube1;
					layout(location = 8) uniform  sampler3D unity_ProbeVolumeSH;
					layout(location = 0) in  vec3 vs_TEXCOORD0;
					layout(location = 1) in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					int u_xlati0;
					vec3 u_xlat1;
					float u_xlat16_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat10_5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					vec4 u_xlat10_7;
					vec3 u_xlat8;
					bvec3 u_xlatb8;
					vec3 u_xlat9;
					bvec3 u_xlatb10;
					vec3 u_xlat11;
					float u_xlat33;
					float u_xlat34;
					float u_xlat35;
					float u_xlat16_35;
					bool u_xlatb35;
					float u_xlat36;
					bool u_xlatb36;
					void main()
					{
					    u_xlati0 = unity_StereoEyeIndex;
					    u_xlat0.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati0].xyz;
					    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat33 = inversesqrt(u_xlat33);
					    u_xlat1.xyz = vec3(u_xlat33) * u_xlat0.xyz;
					    u_xlat34 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
					    u_xlat34 = inversesqrt(u_xlat34);
					    u_xlat2.xyz = vec3(u_xlat34) * vs_TEXCOORD0.xyz;
					    u_xlat34 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat35 = (-u_xlat34) + 1.0;
					    u_xlat35 = log2(u_xlat35);
					    u_xlat35 = u_xlat35 * _FresnelPower;
					    u_xlat35 = exp2(u_xlat35);
					    u_xlat35 = _FresnelScale * u_xlat35 + _FresnelBias;
					    u_xlat3.xyz = (-_Flamecolor2.xyz) + _FlameColor.xyz;
					    u_xlat3.xyz = vec3(u_xlat35) * u_xlat3.xyz + _Flamecolor2.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(5.0, 5.0, 5.0));
					    u_xlat36 = (-vs_TEXCOORD0.y) + _Y_Mask;
					    u_xlat36 = abs(u_xlat36) + (-_Y_Mask);
					    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
					    u_xlat36 = (-u_xlat36) + 1.0;
					    u_xlat35 = u_xlat35 * u_xlat36;
					    SV_Target0.w = u_xlat35 * _Alpha;
					    u_xlatb35 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb35){
					        u_xlatb35 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat4.xyz = vs_TEXCOORD1.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat4.xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD1.zzz + u_xlat4.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat4.xyz : vs_TEXCOORD1.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat35 = u_xlat4.y * 0.25 + 0.75;
					        u_xlat36 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat4.x = max(u_xlat35, u_xlat36);
					        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
					    } else {
					        u_xlat4.x = float(1.0);
					        u_xlat4.y = float(1.0);
					        u_xlat4.z = float(1.0);
					        u_xlat4.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat35 = dot(u_xlat4, unity_OcclusionMaskSelector);
					    u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
					    u_xlat36 = dot((-u_xlat1.xyz), vs_TEXCOORD0.xyz);
					    u_xlat36 = u_xlat36 + u_xlat36;
					    u_xlat1.xyz = vs_TEXCOORD0.xyz * (-vec3(u_xlat36)) + (-u_xlat1.xyz);
					    u_xlat4.xyz = vec3(u_xlat35) * _LightColor0.xyz;
					    u_xlatb35 = 0.0<unity_SpecCube0_ProbePosition.w;
					    if(u_xlatb35){
					        u_xlat35 = dot(u_xlat1.xyz, u_xlat1.xyz);
					        u_xlat35 = inversesqrt(u_xlat35);
					        u_xlat5.xyz = u_xlat1.xyz * vec3(u_xlat35);
					        u_xlat6.xyz = (-vs_TEXCOORD1.xyz) + unity_SpecCube0_BoxMax.xyz;
					        u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
					        u_xlat7.xyz = (-vs_TEXCOORD1.xyz) + unity_SpecCube0_BoxMin.xyz;
					        u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
					        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
					        {
					            vec3 hlslcc_movcTemp = u_xlat6;
					            hlslcc_movcTemp.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
					            hlslcc_movcTemp.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
					            hlslcc_movcTemp.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
					            u_xlat6 = hlslcc_movcTemp;
					        }
					        u_xlat35 = min(u_xlat6.y, u_xlat6.x);
					        u_xlat35 = min(u_xlat6.z, u_xlat35);
					        u_xlat6.xyz = vs_TEXCOORD1.xyz + (-unity_SpecCube0_ProbePosition.xyz);
					        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat6.xyz;
					    } else {
					        u_xlat5.xyz = u_xlat1.xyz;
					    //ENDIF
					    }
					    u_xlat10_5 = textureLod(unity_SpecCube0, u_xlat5.xyz, 6.0);
					    u_xlat16_35 = u_xlat10_5.w + -1.0;
					    u_xlat35 = unity_SpecCube0_HDR.w * u_xlat16_35 + 1.0;
					    u_xlat35 = log2(u_xlat35);
					    u_xlat35 = u_xlat35 * unity_SpecCube0_HDR.y;
					    u_xlat35 = exp2(u_xlat35);
					    u_xlat35 = u_xlat35 * unity_SpecCube0_HDR.x;
					    u_xlat6.xyz = u_xlat10_5.xyz * vec3(u_xlat35);
					    u_xlatb36 = unity_SpecCube0_BoxMin.w<0.999989986;
					    if(u_xlatb36){
					        u_xlatb36 = 0.0<unity_SpecCube1_ProbePosition.w;
					        if(u_xlatb36){
					            u_xlat36 = dot(u_xlat1.xyz, u_xlat1.xyz);
					            u_xlat36 = inversesqrt(u_xlat36);
					            u_xlat7.xyz = u_xlat1.xyz * vec3(u_xlat36);
					            u_xlat8.xyz = (-vs_TEXCOORD1.xyz) + unity_SpecCube1_BoxMax.xyz;
					            u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
					            u_xlat9.xyz = (-vs_TEXCOORD1.xyz) + unity_SpecCube1_BoxMin.xyz;
					            u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
					            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
					            {
					                vec3 hlslcc_movcTemp = u_xlat8;
					                hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
					                hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
					                hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
					                u_xlat8 = hlslcc_movcTemp;
					            }
					            u_xlat36 = min(u_xlat8.y, u_xlat8.x);
					            u_xlat36 = min(u_xlat8.z, u_xlat36);
					            u_xlat8.xyz = vs_TEXCOORD1.xyz + (-unity_SpecCube1_ProbePosition.xyz);
					            u_xlat1.xyz = u_xlat7.xyz * vec3(u_xlat36) + u_xlat8.xyz;
					        //ENDIF
					        }
					        u_xlat10_7 = textureLod(unity_SpecCube1, u_xlat1.xyz, 6.0);
					        u_xlat16_1 = u_xlat10_7.w + -1.0;
					        u_xlat1.x = unity_SpecCube1_HDR.w * u_xlat16_1 + 1.0;
					        u_xlat1.x = log2(u_xlat1.x);
					        u_xlat1.x = u_xlat1.x * unity_SpecCube1_HDR.y;
					        u_xlat1.x = exp2(u_xlat1.x);
					        u_xlat1.x = u_xlat1.x * unity_SpecCube1_HDR.x;
					        u_xlat1.xyz = u_xlat10_7.xyz * u_xlat1.xxx;
					        u_xlat5.xyz = vec3(u_xlat35) * u_xlat10_5.xyz + (-u_xlat1.xyz);
					        u_xlat6.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat1.xyz;
					    //ENDIF
					    }
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat33) + _WorldSpaceLightPos0.xyz;
					    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat33 = max(u_xlat33, 0.00100000005);
					    u_xlat33 = inversesqrt(u_xlat33);
					    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
					    u_xlat33 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
					    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat11.x = abs(u_xlat34) + u_xlat33;
					    u_xlat11.x = u_xlat11.x + 9.99999975e-06;
					    u_xlat11.x = 0.5 / u_xlat11.x;
					    u_xlat11.x = u_xlat11.x * 0.999999881;
					    u_xlat11.x = u_xlat33 * u_xlat11.x;
					    u_xlat11.xyz = u_xlat4.xyz * u_xlat11.xxx;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * 0.959999979 + 0.0399999991;
					    u_xlat1.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat34 = -abs(u_xlat34) + 1.0;
					    u_xlat2.x = u_xlat34 * u_xlat34;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat34 = u_xlat34 * u_xlat2.x;
					    u_xlat34 = u_xlat34 * 2.23517418e-08 + 0.0399999991;
					    u_xlat1.xyz = vec3(u_xlat34) * u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat11.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat3.xyz + u_xlat0.xyz;
					    return;
					}"
				}
			}
			Program "hp" {
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" }
					"!!hs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(vertices=3) out;
					layout(binding = 0, std140) uniform HGlobals {
						vec4 unused_0_0[10];
						float _EdgeLength;
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(location = 0) in vec4 vs_INTERNALTESSPOS0[];
					layout(location = 0) out vec4 hs_INTERNALTESSPOS0[];
					layout(location = 1) in vec4 vs_TANGENT0[];
					layout(location = 1) out vec4 hs_TANGENT0[];
					layout(location = 2) in vec3 vs_NORMAL0[];
					layout(location = 2) out vec3 hs_NORMAL0[];
					layout(location = 3) in vec4 vs_TEXCOORD0[];
					layout(location = 3) out vec4 hs_TEXCOORD0[];
					layout(location = 4) in vec4 vs_TEXCOORD1[];
					layout(location = 4) out vec4 hs_TEXCOORD1[];
					layout(location = 5) in vec4 vs_TEXCOORD2[];
					layout(location = 5) out vec4 hs_TEXCOORD2[];
					layout(location = 6) in vec4 vs_TEXCOORD3[];
					layout(location = 6) out vec4 hs_TEXCOORD3[];
					layout(location = 7) in vec4 vs_COLOR0[];
					layout(location = 7) out vec4 hs_COLOR0[];
					void passthrough_ctrl_points()
					{
					    hs_INTERNALTESSPOS0[gl_InvocationID] = vs_INTERNALTESSPOS0[gl_InvocationID];
					    hs_TANGENT0[gl_InvocationID] = vs_TANGENT0[gl_InvocationID];
					    hs_NORMAL0[gl_InvocationID] = vs_NORMAL0[gl_InvocationID];
					    hs_TEXCOORD0[gl_InvocationID] = vs_TEXCOORD0[gl_InvocationID];
					    hs_TEXCOORD1[gl_InvocationID] = vs_TEXCOORD1[gl_InvocationID];
					    hs_TEXCOORD2[gl_InvocationID] = vs_TEXCOORD2[gl_InvocationID];
					    hs_TEXCOORD3[gl_InvocationID] = vs_TEXCOORD3[gl_InvocationID];
					    hs_COLOR0[gl_InvocationID] = vs_COLOR0[gl_InvocationID];
					}
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat12;
					float u_xlat13;
					void fork_phase2(int phaseInstanceID)
					{
					    u_xlat0.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[1].yyy;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[1].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[1].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[1].www + u_xlat0.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[2].yyy;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[2].www + u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + (-_WorldSpaceCameraPos.xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _EdgeLength;
					    u_xlat2.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = sqrt(u_xlat13);
					    u_xlat13 = u_xlat13 * _ScreenParams.y;
					    u_xlat12 = u_xlat13 / u_xlat12;
					    gl_TessLevelOuter[0] = max(u_xlat12, 1.0);
					    u_xlat2.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[0].yyy;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[0].www + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _ScreenParams.y;
					    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * _EdgeLength;
					    u_xlat12 = u_xlat12 / u_xlat1.x;
					    gl_TessLevelOuter[1] = max(u_xlat12, 1.0);
					    u_xlat1.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _ScreenParams.y;
					    u_xlat4.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + (-_WorldSpaceCameraPos.xyz);
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * _EdgeLength;
					    u_xlat0.x = u_xlat0.x / u_xlat4.x;
					    gl_TessLevelOuter[2] = max(u_xlat0.x, 1.0);
					}
					void join_phase3(int phaseInstanceID)
					{
					    u_xlat0.x = gl_TessLevelOuter[2] + gl_TessLevelOuter[2];
					    u_xlat0.x = u_xlat0.x + gl_TessLevelOuter[2];
					    gl_TessLevelInner[0] = u_xlat0.x * 0.333333343;
					}
					void main()
					{
					    passthrough_ctrl_points();
					    barrier();
					    if (gl_InvocationID == 0)
					    {
					        fork_phase2(0);
					        join_phase3(0);
					    }
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "UNITY_SINGLE_PASS_STEREO" }
					"!!hs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(vertices=3) out;
					layout(binding = 0, std140) uniform HGlobals {
						vec4 unused_0_0[10];
						float _EdgeLength;
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(binding = 3, std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(binding = 4, std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(location = 0) in vec4 vs_INTERNALTESSPOS0[];
					layout(location = 0) out vec4 hs_INTERNALTESSPOS0[];
					layout(location = 1) in vec4 vs_TANGENT0[];
					layout(location = 1) out vec4 hs_TANGENT0[];
					layout(location = 2) in vec3 vs_NORMAL0[];
					layout(location = 2) out vec3 hs_NORMAL0[];
					layout(location = 3) in vec4 vs_TEXCOORD0[];
					layout(location = 3) out vec4 hs_TEXCOORD0[];
					layout(location = 4) in vec4 vs_TEXCOORD1[];
					layout(location = 4) out vec4 hs_TEXCOORD1[];
					layout(location = 5) in vec4 vs_TEXCOORD2[];
					layout(location = 5) out vec4 hs_TEXCOORD2[];
					layout(location = 6) in vec4 vs_TEXCOORD3[];
					layout(location = 6) out vec4 hs_TEXCOORD3[];
					layout(location = 7) in vec4 vs_COLOR0[];
					layout(location = 7) out vec4 hs_COLOR0[];
					void passthrough_ctrl_points()
					{
					    hs_INTERNALTESSPOS0[gl_InvocationID] = vs_INTERNALTESSPOS0[gl_InvocationID];
					    hs_TANGENT0[gl_InvocationID] = vs_TANGENT0[gl_InvocationID];
					    hs_NORMAL0[gl_InvocationID] = vs_NORMAL0[gl_InvocationID];
					    hs_TEXCOORD0[gl_InvocationID] = vs_TEXCOORD0[gl_InvocationID];
					    hs_TEXCOORD1[gl_InvocationID] = vs_TEXCOORD1[gl_InvocationID];
					    hs_TEXCOORD2[gl_InvocationID] = vs_TEXCOORD2[gl_InvocationID];
					    hs_TEXCOORD3[gl_InvocationID] = vs_TEXCOORD3[gl_InvocationID];
					    hs_COLOR0[gl_InvocationID] = vs_COLOR0[gl_InvocationID];
					}
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat12;
					int u_xlati13;
					void fork_phase2(int phaseInstanceID)
					{
					    u_xlat0.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[1].yyy;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[1].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[1].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[1].www + u_xlat0.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[2].yyy;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[2].www + u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _ScreenParams.y;
					    u_xlat2.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlati13 = unity_StereoEyeIndex;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + (-unity_StereoWorldSpaceCameraPos[u_xlati13].xyz);
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat2.x = sqrt(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * _EdgeLength;
					    u_xlat12 = u_xlat12 / u_xlat2.x;
					    gl_TessLevelOuter[0] = max(u_xlat12, 1.0);
					    u_xlat2.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[0].yyy;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[0].www + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _ScreenParams.y;
					    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + (-unity_StereoWorldSpaceCameraPos[u_xlati13].xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * _EdgeLength;
					    u_xlat12 = u_xlat12 / u_xlat1.x;
					    gl_TessLevelOuter[1] = max(u_xlat12, 1.0);
					    u_xlat1.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _ScreenParams.y;
					    u_xlat4.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + (-unity_StereoWorldSpaceCameraPos[u_xlati13].xyz);
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * _EdgeLength;
					    u_xlat0.x = u_xlat0.x / u_xlat4.x;
					    gl_TessLevelOuter[2] = max(u_xlat0.x, 1.0);
					}
					void join_phase3(int phaseInstanceID)
					{
					    u_xlat0.x = gl_TessLevelOuter[2] + gl_TessLevelOuter[2];
					    u_xlat0.x = u_xlat0.x + gl_TessLevelOuter[2];
					    gl_TessLevelInner[0] = u_xlat0.x * 0.333333343;
					}
					void main()
					{
					    passthrough_ctrl_points();
					    barrier();
					    if (gl_InvocationID == 0)
					    {
					        fork_phase2(0);
					        join_phase3(0);
					    }
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!hs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(vertices=3) out;
					layout(binding = 0, std140) uniform HGlobals {
						vec4 unused_0_0[10];
						float _EdgeLength;
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(location = 0) in vec4 vs_INTERNALTESSPOS0[];
					layout(location = 0) out vec4 hs_INTERNALTESSPOS0[];
					layout(location = 1) in vec4 vs_TANGENT0[];
					layout(location = 1) out vec4 hs_TANGENT0[];
					layout(location = 2) in vec3 vs_NORMAL0[];
					layout(location = 2) out vec3 hs_NORMAL0[];
					layout(location = 3) in vec4 vs_TEXCOORD0[];
					layout(location = 3) out vec4 hs_TEXCOORD0[];
					layout(location = 4) in vec4 vs_TEXCOORD1[];
					layout(location = 4) out vec4 hs_TEXCOORD1[];
					layout(location = 5) in vec4 vs_TEXCOORD2[];
					layout(location = 5) out vec4 hs_TEXCOORD2[];
					layout(location = 6) in vec4 vs_TEXCOORD3[];
					layout(location = 6) out vec4 hs_TEXCOORD3[];
					layout(location = 7) in vec4 vs_COLOR0[];
					layout(location = 7) out vec4 hs_COLOR0[];
					void passthrough_ctrl_points()
					{
					    hs_INTERNALTESSPOS0[gl_InvocationID] = vs_INTERNALTESSPOS0[gl_InvocationID];
					    hs_TANGENT0[gl_InvocationID] = vs_TANGENT0[gl_InvocationID];
					    hs_NORMAL0[gl_InvocationID] = vs_NORMAL0[gl_InvocationID];
					    hs_TEXCOORD0[gl_InvocationID] = vs_TEXCOORD0[gl_InvocationID];
					    hs_TEXCOORD1[gl_InvocationID] = vs_TEXCOORD1[gl_InvocationID];
					    hs_TEXCOORD2[gl_InvocationID] = vs_TEXCOORD2[gl_InvocationID];
					    hs_TEXCOORD3[gl_InvocationID] = vs_TEXCOORD3[gl_InvocationID];
					    hs_COLOR0[gl_InvocationID] = vs_COLOR0[gl_InvocationID];
					}
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat12;
					float u_xlat13;
					void fork_phase2(int phaseInstanceID)
					{
					    u_xlat0.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[1].yyy;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[1].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[1].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[1].www + u_xlat0.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[2].yyy;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[2].www + u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + (-_WorldSpaceCameraPos.xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _EdgeLength;
					    u_xlat2.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = sqrt(u_xlat13);
					    u_xlat13 = u_xlat13 * _ScreenParams.y;
					    u_xlat12 = u_xlat13 / u_xlat12;
					    gl_TessLevelOuter[0] = max(u_xlat12, 1.0);
					    u_xlat2.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[0].yyy;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[0].www + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _ScreenParams.y;
					    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * _EdgeLength;
					    u_xlat12 = u_xlat12 / u_xlat1.x;
					    gl_TessLevelOuter[1] = max(u_xlat12, 1.0);
					    u_xlat1.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _ScreenParams.y;
					    u_xlat4.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + (-_WorldSpaceCameraPos.xyz);
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * _EdgeLength;
					    u_xlat0.x = u_xlat0.x / u_xlat4.x;
					    gl_TessLevelOuter[2] = max(u_xlat0.x, 1.0);
					}
					void join_phase3(int phaseInstanceID)
					{
					    u_xlat0.x = gl_TessLevelOuter[2] + gl_TessLevelOuter[2];
					    u_xlat0.x = u_xlat0.x + gl_TessLevelOuter[2];
					    gl_TessLevelInner[0] = u_xlat0.x * 0.333333343;
					}
					void main()
					{
					    passthrough_ctrl_points();
					    barrier();
					    if (gl_InvocationID == 0)
					    {
					        fork_phase2(0);
					        join_phase3(0);
					    }
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "UNITY_SINGLE_PASS_STEREO" }
					"!!hs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(vertices=3) out;
					layout(binding = 0, std140) uniform HGlobals {
						vec4 unused_0_0[10];
						float _EdgeLength;
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(binding = 3, std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(binding = 4, std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(location = 0) in vec4 vs_INTERNALTESSPOS0[];
					layout(location = 0) out vec4 hs_INTERNALTESSPOS0[];
					layout(location = 1) in vec4 vs_TANGENT0[];
					layout(location = 1) out vec4 hs_TANGENT0[];
					layout(location = 2) in vec3 vs_NORMAL0[];
					layout(location = 2) out vec3 hs_NORMAL0[];
					layout(location = 3) in vec4 vs_TEXCOORD0[];
					layout(location = 3) out vec4 hs_TEXCOORD0[];
					layout(location = 4) in vec4 vs_TEXCOORD1[];
					layout(location = 4) out vec4 hs_TEXCOORD1[];
					layout(location = 5) in vec4 vs_TEXCOORD2[];
					layout(location = 5) out vec4 hs_TEXCOORD2[];
					layout(location = 6) in vec4 vs_TEXCOORD3[];
					layout(location = 6) out vec4 hs_TEXCOORD3[];
					layout(location = 7) in vec4 vs_COLOR0[];
					layout(location = 7) out vec4 hs_COLOR0[];
					void passthrough_ctrl_points()
					{
					    hs_INTERNALTESSPOS0[gl_InvocationID] = vs_INTERNALTESSPOS0[gl_InvocationID];
					    hs_TANGENT0[gl_InvocationID] = vs_TANGENT0[gl_InvocationID];
					    hs_NORMAL0[gl_InvocationID] = vs_NORMAL0[gl_InvocationID];
					    hs_TEXCOORD0[gl_InvocationID] = vs_TEXCOORD0[gl_InvocationID];
					    hs_TEXCOORD1[gl_InvocationID] = vs_TEXCOORD1[gl_InvocationID];
					    hs_TEXCOORD2[gl_InvocationID] = vs_TEXCOORD2[gl_InvocationID];
					    hs_TEXCOORD3[gl_InvocationID] = vs_TEXCOORD3[gl_InvocationID];
					    hs_COLOR0[gl_InvocationID] = vs_COLOR0[gl_InvocationID];
					}
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat12;
					int u_xlati13;
					void fork_phase2(int phaseInstanceID)
					{
					    u_xlat0.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[1].yyy;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[1].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[1].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[1].www + u_xlat0.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[2].yyy;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[2].www + u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _ScreenParams.y;
					    u_xlat2.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlati13 = unity_StereoEyeIndex;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + (-unity_StereoWorldSpaceCameraPos[u_xlati13].xyz);
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat2.x = sqrt(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * _EdgeLength;
					    u_xlat12 = u_xlat12 / u_xlat2.x;
					    gl_TessLevelOuter[0] = max(u_xlat12, 1.0);
					    u_xlat2.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[0].yyy;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[0].www + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _ScreenParams.y;
					    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + (-unity_StereoWorldSpaceCameraPos[u_xlati13].xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * _EdgeLength;
					    u_xlat12 = u_xlat12 / u_xlat1.x;
					    gl_TessLevelOuter[1] = max(u_xlat12, 1.0);
					    u_xlat1.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _ScreenParams.y;
					    u_xlat4.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + (-unity_StereoWorldSpaceCameraPos[u_xlati13].xyz);
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * _EdgeLength;
					    u_xlat0.x = u_xlat0.x / u_xlat4.x;
					    gl_TessLevelOuter[2] = max(u_xlat0.x, 1.0);
					}
					void join_phase3(int phaseInstanceID)
					{
					    u_xlat0.x = gl_TessLevelOuter[2] + gl_TessLevelOuter[2];
					    u_xlat0.x = u_xlat0.x + gl_TessLevelOuter[2];
					    gl_TessLevelInner[0] = u_xlat0.x * 0.333333343;
					}
					void main()
					{
					    passthrough_ctrl_points();
					    barrier();
					    if (gl_InvocationID == 0)
					    {
					        fork_phase2(0);
					        join_phase3(0);
					    }
					}"
				}
			}
			Program "dp" {
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" }
					"!!ds_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(triangles) in;
					layout(binding = 0, std140) uniform DGlobals {
						vec4 unused_0_0[4];
						float _u;
						float _v;
						vec4 _Flamenoise_ST;
						float _Y_Mask;
						float _FlameHeight;
						vec4 unused_0_6[4];
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
					};
					layout(binding = 3, std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					layout(location = 4) uniform  sampler2D _FlameWave;
					layout(location = 5) uniform  sampler2D _Flamenoise;
					layout(location = 0) in  vec4 hs_INTERNALTESSPOS0 [];
					layout(location = 1) in  vec3 hs_NORMAL0 [];
					layout(location = 2) in  vec4 hs_TEXCOORD0 [];
					layout(location = 0) out vec3 ds_TEXCOORD0;
					layout(location = 1) out vec3 ds_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = gl_TessCoord.yy * hs_TEXCOORD0[1].xy;
					    u_xlat0.xy = hs_TEXCOORD0[0].xy * gl_TessCoord.xx + u_xlat0.xy;
					    u_xlat0.xy = hs_TEXCOORD0[2].xy * gl_TessCoord.zz + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy * _Flamenoise_ST.xy + _Flamenoise_ST.zw;
					    u_xlat0.xy = _Time.yy * vec2(_u, _v) + u_xlat0.xy;
					    u_xlat6 = textureLod(_FlameWave, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = textureLod(_Flamenoise, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.xyz = u_xlat0.xxx * unity_WorldToObject[1].xyz;
					    u_xlat1.xyz = gl_TessCoord.yyy * hs_NORMAL0[1].xyz;
					    u_xlat1.xyz = hs_NORMAL0[0].xyz * gl_TessCoord.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hs_NORMAL0[2].xyz * gl_TessCoord.zzz + u_xlat1.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.z = dot(u_xlat1.xyz, unity_WorldToObject[2].xyz);
					    u_xlat2.y = dot(u_xlat1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.x = (-u_xlat2.y) * u_xlat9 + _Y_Mask;
					    ds_TEXCOORD0.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    u_xlat9 = abs(u_xlat1.x) + (-_Y_Mask);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    u_xlat1 = gl_TessCoord.yyyy * hs_INTERNALTESSPOS0[1];
					    u_xlat1 = hs_INTERNALTESSPOS0[0] * gl_TessCoord.xxxx + u_xlat1;
					    u_xlat1 = hs_INTERNALTESSPOS0[2] * gl_TessCoord.zzzz + u_xlat1;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_FlameHeight, _FlameHeight, _FlameHeight)) + u_xlat1.xyz;
					    u_xlat2 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat0 + unity_ObjectToWorld[3];
					    ds_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "UNITY_SINGLE_PASS_STEREO" }
					"!!ds_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(triangles) in;
					layout(binding = 0, std140) uniform DGlobals {
						vec4 unused_0_0[4];
						float _u;
						float _v;
						vec4 _Flamenoise_ST;
						float _Y_Mask;
						float _FlameHeight;
						vec4 unused_0_6[4];
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
					};
					layout(binding = 3, std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_2[40];
					};
					layout(binding = 4, std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(location = 5) uniform  sampler2D _FlameWave;
					layout(location = 6) uniform  sampler2D _Flamenoise;
					layout(location = 0) in  vec4 hs_INTERNALTESSPOS0 [];
					layout(location = 1) in  vec3 hs_NORMAL0 [];
					layout(location = 2) in  vec4 hs_TEXCOORD0 [];
					layout(location = 0) out vec3 ds_TEXCOORD0;
					layout(location = 1) out vec3 ds_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = gl_TessCoord.yy * hs_TEXCOORD0[1].xy;
					    u_xlat0.xy = hs_TEXCOORD0[0].xy * gl_TessCoord.xx + u_xlat0.xy;
					    u_xlat0.xy = hs_TEXCOORD0[2].xy * gl_TessCoord.zz + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy * _Flamenoise_ST.xy + _Flamenoise_ST.zw;
					    u_xlat0.xy = _Time.yy * vec2(_u, _v) + u_xlat0.xy;
					    u_xlat6 = textureLod(_FlameWave, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = textureLod(_Flamenoise, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.xyz = u_xlat0.xxx * unity_WorldToObject[1].xyz;
					    u_xlat1.xyz = gl_TessCoord.yyy * hs_NORMAL0[1].xyz;
					    u_xlat1.xyz = hs_NORMAL0[0].xyz * gl_TessCoord.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hs_NORMAL0[2].xyz * gl_TessCoord.zzz + u_xlat1.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.z = dot(u_xlat1.xyz, unity_WorldToObject[2].xyz);
					    u_xlat2.y = dot(u_xlat1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.x = (-u_xlat2.y) * u_xlat9 + _Y_Mask;
					    ds_TEXCOORD0.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    u_xlat9 = abs(u_xlat1.x) + (-_Y_Mask);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    u_xlat1 = gl_TessCoord.yyyy * hs_INTERNALTESSPOS0[1];
					    u_xlat1 = hs_INTERNALTESSPOS0[0] * gl_TessCoord.xxxx + u_xlat1;
					    u_xlat1 = hs_INTERNALTESSPOS0[2] * gl_TessCoord.zzzz + u_xlat1;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_FlameHeight, _FlameHeight, _FlameHeight)) + u_xlat1.xyz;
					    u_xlat2 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat0 + unity_ObjectToWorld[3];
					    ds_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat0.xyz;
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat1 = u_xlat2.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat1 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat2.wwww + u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!ds_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(triangles) in;
					layout(binding = 0, std140) uniform DGlobals {
						vec4 unused_0_0[4];
						float _u;
						float _v;
						vec4 _Flamenoise_ST;
						float _Y_Mask;
						float _FlameHeight;
						vec4 unused_0_6[4];
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(binding = 2, std140) uniform UnityLighting {
						vec4 unused_2_0[42];
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_5[2];
					};
					layout(binding = 3, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[2];
					};
					layout(binding = 4, std140) uniform UnityPerFrame {
						vec4 unused_4_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_2[2];
					};
					layout(location = 5) uniform  sampler2D _FlameWave;
					layout(location = 6) uniform  sampler2D _Flamenoise;
					layout(location = 0) in  vec4 hs_INTERNALTESSPOS0 [];
					layout(location = 1) in  vec3 hs_NORMAL0 [];
					layout(location = 2) in  vec4 hs_TEXCOORD0 [];
					layout(location = 0) out vec3 ds_TEXCOORD0;
					layout(location = 1) out vec3 ds_TEXCOORD1;
					layout(location = 2) out vec3 ds_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat5;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xy = gl_TessCoord.yy * hs_TEXCOORD0[1].xy;
					    u_xlat0.xy = hs_TEXCOORD0[0].xy * gl_TessCoord.xx + u_xlat0.xy;
					    u_xlat0.xy = hs_TEXCOORD0[2].xy * gl_TessCoord.zz + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy * _Flamenoise_ST.xy + _Flamenoise_ST.zw;
					    u_xlat0.xy = _Time.yy * vec2(_u, _v) + u_xlat0.xy;
					    u_xlat8 = textureLod(_FlameWave, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = textureLod(_Flamenoise, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = u_xlat0.x * u_xlat8;
					    u_xlat0.xyz = u_xlat0.xxx * unity_WorldToObject[1].xyz;
					    u_xlat1.xyz = gl_TessCoord.yyy * hs_NORMAL0[1].xyz;
					    u_xlat1.xyz = hs_NORMAL0[0].xyz * gl_TessCoord.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hs_NORMAL0[2].xyz * gl_TessCoord.zzz + u_xlat1.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.z = dot(u_xlat1.xyz, unity_WorldToObject[2].xyz);
					    u_xlat2.y = dot(u_xlat1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.x = (-u_xlat2.y) * u_xlat12 + _Y_Mask;
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = abs(u_xlat1.x) + (-_Y_Mask);
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12);
					    u_xlat2 = gl_TessCoord.yyyy * hs_INTERNALTESSPOS0[1];
					    u_xlat2 = hs_INTERNALTESSPOS0[0] * gl_TessCoord.xxxx + u_xlat2;
					    u_xlat2 = hs_INTERNALTESSPOS0[2] * gl_TessCoord.zzzz + u_xlat2;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_FlameHeight, _FlameHeight, _FlameHeight)) + u_xlat2.xyz;
					    u_xlat3 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat3 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat3;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat3;
					    u_xlat3 = u_xlat0 + unity_ObjectToWorld[3];
					    ds_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * u_xlat2.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat3.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat3.wwww + u_xlat0;
					    ds_TEXCOORD0.xyz = u_xlat5.xyz;
					    u_xlat0.x = u_xlat5.y * u_xlat5.y;
					    u_xlat0.x = u_xlat5.x * u_xlat5.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat5.yzzx * u_xlat5.xyzz;
					    u_xlat2.x = dot(unity_SHBr, u_xlat1);
					    u_xlat2.y = dot(unity_SHBg, u_xlat1);
					    u_xlat2.z = dot(unity_SHBb, u_xlat1);
					    ds_TEXCOORD2.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "UNITY_SINGLE_PASS_STEREO" }
					"!!ds_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(triangles) in;
					layout(binding = 0, std140) uniform DGlobals {
						vec4 unused_0_0[4];
						float _u;
						float _v;
						vec4 _Flamenoise_ST;
						float _Y_Mask;
						float _FlameHeight;
						vec4 unused_0_6[4];
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(binding = 2, std140) uniform UnityLighting {
						vec4 unused_2_0[42];
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_5[2];
					};
					layout(binding = 3, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[2];
					};
					layout(binding = 4, std140) uniform UnityStereoGlobals {
						vec4 unused_4_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_4_2[40];
					};
					layout(binding = 5, std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(location = 6) uniform  sampler2D _FlameWave;
					layout(location = 7) uniform  sampler2D _Flamenoise;
					layout(location = 0) in  vec4 hs_INTERNALTESSPOS0 [];
					layout(location = 1) in  vec3 hs_NORMAL0 [];
					layout(location = 2) in  vec4 hs_TEXCOORD0 [];
					layout(location = 0) out vec3 ds_TEXCOORD0;
					layout(location = 1) out vec3 ds_TEXCOORD1;
					layout(location = 2) out vec3 ds_TEXCOORD2;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat5;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xy = gl_TessCoord.yy * hs_TEXCOORD0[1].xy;
					    u_xlat0.xy = hs_TEXCOORD0[0].xy * gl_TessCoord.xx + u_xlat0.xy;
					    u_xlat0.xy = hs_TEXCOORD0[2].xy * gl_TessCoord.zz + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy * _Flamenoise_ST.xy + _Flamenoise_ST.zw;
					    u_xlat0.xy = _Time.yy * vec2(_u, _v) + u_xlat0.xy;
					    u_xlat8 = textureLod(_FlameWave, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = textureLod(_Flamenoise, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = u_xlat0.x * u_xlat8;
					    u_xlat0.xyz = u_xlat0.xxx * unity_WorldToObject[1].xyz;
					    u_xlat1.xyz = gl_TessCoord.yyy * hs_NORMAL0[1].xyz;
					    u_xlat1.xyz = hs_NORMAL0[0].xyz * gl_TessCoord.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hs_NORMAL0[2].xyz * gl_TessCoord.zzz + u_xlat1.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.z = dot(u_xlat1.xyz, unity_WorldToObject[2].xyz);
					    u_xlat2.y = dot(u_xlat1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.x = (-u_xlat2.y) * u_xlat12 + _Y_Mask;
					    u_xlat5.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = abs(u_xlat1.x) + (-_Y_Mask);
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12);
					    u_xlat2 = gl_TessCoord.yyyy * hs_INTERNALTESSPOS0[1];
					    u_xlat2 = hs_INTERNALTESSPOS0[0] * gl_TessCoord.xxxx + u_xlat2;
					    u_xlat2 = hs_INTERNALTESSPOS0[2] * gl_TessCoord.zzzz + u_xlat2;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_FlameHeight, _FlameHeight, _FlameHeight)) + u_xlat2.xyz;
					    u_xlat3 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat3 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat3;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat3;
					    u_xlat3 = u_xlat0 + unity_ObjectToWorld[3];
					    ds_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * u_xlat2.www + u_xlat0.xyz;
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat2 = u_xlat3.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat3.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat3.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat3.wwww + u_xlat2;
					    ds_TEXCOORD0.xyz = u_xlat5.xyz;
					    u_xlat0.x = u_xlat5.y * u_xlat5.y;
					    u_xlat0.x = u_xlat5.x * u_xlat5.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat5.yzzx * u_xlat5.xyzz;
					    u_xlat2.x = dot(unity_SHBr, u_xlat1);
					    u_xlat2.y = dot(unity_SHBg, u_xlat1);
					    u_xlat2.z = dot(unity_SHBb, u_xlat1);
					    ds_TEXCOORD2.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    return;
					}"
				}
			}
		}
		Pass {
			Name "FORWARD"
			Tags { "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent+100" "RenderType" = "Transparent" }
			Blend SrcAlpha One, SrcAlpha One
			ColorMask RGB -1
			ZWrite Off
			Cull Front
			GpuProgramID 121139
			Program "vp" {
				SubProgram "d3d11 " {
					Keywords { "POINT" }
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec4 in_TANGENT0;
					layout(location = 2) in  vec3 in_NORMAL0;
					layout(location = 3) in  vec4 in_TEXCOORD0;
					layout(location = 4) in  vec4 in_TEXCOORD1;
					layout(location = 5) in  vec4 in_TEXCOORD2;
					layout(location = 6) in  vec4 in_TEXCOORD3;
					layout(location = 7) in  vec4 in_COLOR0;
					layout(location = 0) out vec4 vs_INTERNALTESSPOS0;
					layout(location = 1) out vec4 vs_TANGENT0;
					layout(location = 2) out vec3 vs_NORMAL0;
					layout(location = 3) out vec4 vs_TEXCOORD0;
					layout(location = 4) out vec4 vs_TEXCOORD1;
					layout(location = 5) out vec4 vs_TEXCOORD2;
					layout(location = 6) out vec4 vs_TEXCOORD3;
					layout(location = 7) out vec4 vs_COLOR0;
					void main()
					{
					    vs_INTERNALTESSPOS0 = in_POSITION0;
					    vs_TANGENT0 = in_TANGENT0;
					    vs_NORMAL0.xyz = in_NORMAL0.xyz;
					    vs_TEXCOORD0 = in_TEXCOORD0;
					    vs_TEXCOORD1 = in_TEXCOORD1;
					    vs_TEXCOORD2 = in_TEXCOORD2;
					    vs_TEXCOORD3 = in_TEXCOORD3;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec4 in_TANGENT0;
					layout(location = 2) in  vec3 in_NORMAL0;
					layout(location = 3) in  vec4 in_TEXCOORD0;
					layout(location = 4) in  vec4 in_TEXCOORD1;
					layout(location = 5) in  vec4 in_TEXCOORD2;
					layout(location = 6) in  vec4 in_TEXCOORD3;
					layout(location = 7) in  vec4 in_COLOR0;
					layout(location = 0) out vec4 vs_INTERNALTESSPOS0;
					layout(location = 1) out vec4 vs_TANGENT0;
					layout(location = 2) out vec3 vs_NORMAL0;
					layout(location = 3) out vec4 vs_TEXCOORD0;
					layout(location = 4) out vec4 vs_TEXCOORD1;
					layout(location = 5) out vec4 vs_TEXCOORD2;
					layout(location = 6) out vec4 vs_TEXCOORD3;
					layout(location = 7) out vec4 vs_COLOR0;
					void main()
					{
					    vs_INTERNALTESSPOS0 = in_POSITION0;
					    vs_TANGENT0 = in_TANGENT0;
					    vs_NORMAL0.xyz = in_NORMAL0.xyz;
					    vs_TEXCOORD0 = in_TEXCOORD0;
					    vs_TEXCOORD1 = in_TEXCOORD1;
					    vs_TEXCOORD2 = in_TEXCOORD2;
					    vs_TEXCOORD3 = in_TEXCOORD3;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" }
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec4 in_TANGENT0;
					layout(location = 2) in  vec3 in_NORMAL0;
					layout(location = 3) in  vec4 in_TEXCOORD0;
					layout(location = 4) in  vec4 in_TEXCOORD1;
					layout(location = 5) in  vec4 in_TEXCOORD2;
					layout(location = 6) in  vec4 in_TEXCOORD3;
					layout(location = 7) in  vec4 in_COLOR0;
					layout(location = 0) out vec4 vs_INTERNALTESSPOS0;
					layout(location = 1) out vec4 vs_TANGENT0;
					layout(location = 2) out vec3 vs_NORMAL0;
					layout(location = 3) out vec4 vs_TEXCOORD0;
					layout(location = 4) out vec4 vs_TEXCOORD1;
					layout(location = 5) out vec4 vs_TEXCOORD2;
					layout(location = 6) out vec4 vs_TEXCOORD3;
					layout(location = 7) out vec4 vs_COLOR0;
					void main()
					{
					    vs_INTERNALTESSPOS0 = in_POSITION0;
					    vs_TANGENT0 = in_TANGENT0;
					    vs_NORMAL0.xyz = in_NORMAL0.xyz;
					    vs_TEXCOORD0 = in_TEXCOORD0;
					    vs_TEXCOORD1 = in_TEXCOORD1;
					    vs_TEXCOORD2 = in_TEXCOORD2;
					    vs_TEXCOORD3 = in_TEXCOORD3;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec4 in_TANGENT0;
					layout(location = 2) in  vec3 in_NORMAL0;
					layout(location = 3) in  vec4 in_TEXCOORD0;
					layout(location = 4) in  vec4 in_TEXCOORD1;
					layout(location = 5) in  vec4 in_TEXCOORD2;
					layout(location = 6) in  vec4 in_TEXCOORD3;
					layout(location = 7) in  vec4 in_COLOR0;
					layout(location = 0) out vec4 vs_INTERNALTESSPOS0;
					layout(location = 1) out vec4 vs_TANGENT0;
					layout(location = 2) out vec3 vs_NORMAL0;
					layout(location = 3) out vec4 vs_TEXCOORD0;
					layout(location = 4) out vec4 vs_TEXCOORD1;
					layout(location = 5) out vec4 vs_TEXCOORD2;
					layout(location = 6) out vec4 vs_TEXCOORD3;
					layout(location = 7) out vec4 vs_COLOR0;
					void main()
					{
					    vs_INTERNALTESSPOS0 = in_POSITION0;
					    vs_TANGENT0 = in_TANGENT0;
					    vs_NORMAL0.xyz = in_NORMAL0.xyz;
					    vs_TEXCOORD0 = in_TEXCOORD0;
					    vs_TEXCOORD1 = in_TEXCOORD1;
					    vs_TEXCOORD2 = in_TEXCOORD2;
					    vs_TEXCOORD3 = in_TEXCOORD3;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" }
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec4 in_TANGENT0;
					layout(location = 2) in  vec3 in_NORMAL0;
					layout(location = 3) in  vec4 in_TEXCOORD0;
					layout(location = 4) in  vec4 in_TEXCOORD1;
					layout(location = 5) in  vec4 in_TEXCOORD2;
					layout(location = 6) in  vec4 in_TEXCOORD3;
					layout(location = 7) in  vec4 in_COLOR0;
					layout(location = 0) out vec4 vs_INTERNALTESSPOS0;
					layout(location = 1) out vec4 vs_TANGENT0;
					layout(location = 2) out vec3 vs_NORMAL0;
					layout(location = 3) out vec4 vs_TEXCOORD0;
					layout(location = 4) out vec4 vs_TEXCOORD1;
					layout(location = 5) out vec4 vs_TEXCOORD2;
					layout(location = 6) out vec4 vs_TEXCOORD3;
					layout(location = 7) out vec4 vs_COLOR0;
					void main()
					{
					    vs_INTERNALTESSPOS0 = in_POSITION0;
					    vs_TANGENT0 = in_TANGENT0;
					    vs_NORMAL0.xyz = in_NORMAL0.xyz;
					    vs_TEXCOORD0 = in_TEXCOORD0;
					    vs_TEXCOORD1 = in_TEXCOORD1;
					    vs_TEXCOORD2 = in_TEXCOORD2;
					    vs_TEXCOORD3 = in_TEXCOORD3;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec4 in_TANGENT0;
					layout(location = 2) in  vec3 in_NORMAL0;
					layout(location = 3) in  vec4 in_TEXCOORD0;
					layout(location = 4) in  vec4 in_TEXCOORD1;
					layout(location = 5) in  vec4 in_TEXCOORD2;
					layout(location = 6) in  vec4 in_TEXCOORD3;
					layout(location = 7) in  vec4 in_COLOR0;
					layout(location = 0) out vec4 vs_INTERNALTESSPOS0;
					layout(location = 1) out vec4 vs_TANGENT0;
					layout(location = 2) out vec3 vs_NORMAL0;
					layout(location = 3) out vec4 vs_TEXCOORD0;
					layout(location = 4) out vec4 vs_TEXCOORD1;
					layout(location = 5) out vec4 vs_TEXCOORD2;
					layout(location = 6) out vec4 vs_TEXCOORD3;
					layout(location = 7) out vec4 vs_COLOR0;
					void main()
					{
					    vs_INTERNALTESSPOS0 = in_POSITION0;
					    vs_TANGENT0 = in_TANGENT0;
					    vs_NORMAL0.xyz = in_NORMAL0.xyz;
					    vs_TEXCOORD0 = in_TEXCOORD0;
					    vs_TEXCOORD1 = in_TEXCOORD1;
					    vs_TEXCOORD2 = in_TEXCOORD2;
					    vs_TEXCOORD3 = in_TEXCOORD3;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" }
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec4 in_TANGENT0;
					layout(location = 2) in  vec3 in_NORMAL0;
					layout(location = 3) in  vec4 in_TEXCOORD0;
					layout(location = 4) in  vec4 in_TEXCOORD1;
					layout(location = 5) in  vec4 in_TEXCOORD2;
					layout(location = 6) in  vec4 in_TEXCOORD3;
					layout(location = 7) in  vec4 in_COLOR0;
					layout(location = 0) out vec4 vs_INTERNALTESSPOS0;
					layout(location = 1) out vec4 vs_TANGENT0;
					layout(location = 2) out vec3 vs_NORMAL0;
					layout(location = 3) out vec4 vs_TEXCOORD0;
					layout(location = 4) out vec4 vs_TEXCOORD1;
					layout(location = 5) out vec4 vs_TEXCOORD2;
					layout(location = 6) out vec4 vs_TEXCOORD3;
					layout(location = 7) out vec4 vs_COLOR0;
					void main()
					{
					    vs_INTERNALTESSPOS0 = in_POSITION0;
					    vs_TANGENT0 = in_TANGENT0;
					    vs_NORMAL0.xyz = in_NORMAL0.xyz;
					    vs_TEXCOORD0 = in_TEXCOORD0;
					    vs_TEXCOORD1 = in_TEXCOORD1;
					    vs_TEXCOORD2 = in_TEXCOORD2;
					    vs_TEXCOORD3 = in_TEXCOORD3;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec4 in_TANGENT0;
					layout(location = 2) in  vec3 in_NORMAL0;
					layout(location = 3) in  vec4 in_TEXCOORD0;
					layout(location = 4) in  vec4 in_TEXCOORD1;
					layout(location = 5) in  vec4 in_TEXCOORD2;
					layout(location = 6) in  vec4 in_TEXCOORD3;
					layout(location = 7) in  vec4 in_COLOR0;
					layout(location = 0) out vec4 vs_INTERNALTESSPOS0;
					layout(location = 1) out vec4 vs_TANGENT0;
					layout(location = 2) out vec3 vs_NORMAL0;
					layout(location = 3) out vec4 vs_TEXCOORD0;
					layout(location = 4) out vec4 vs_TEXCOORD1;
					layout(location = 5) out vec4 vs_TEXCOORD2;
					layout(location = 6) out vec4 vs_TEXCOORD3;
					layout(location = 7) out vec4 vs_COLOR0;
					void main()
					{
					    vs_INTERNALTESSPOS0 = in_POSITION0;
					    vs_TANGENT0 = in_TANGENT0;
					    vs_NORMAL0.xyz = in_NORMAL0.xyz;
					    vs_TEXCOORD0 = in_TEXCOORD0;
					    vs_TEXCOORD1 = in_TEXCOORD1;
					    vs_TEXCOORD2 = in_TEXCOORD2;
					    vs_TEXCOORD3 = in_TEXCOORD3;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec4 in_TANGENT0;
					layout(location = 2) in  vec3 in_NORMAL0;
					layout(location = 3) in  vec4 in_TEXCOORD0;
					layout(location = 4) in  vec4 in_TEXCOORD1;
					layout(location = 5) in  vec4 in_TEXCOORD2;
					layout(location = 6) in  vec4 in_TEXCOORD3;
					layout(location = 7) in  vec4 in_COLOR0;
					layout(location = 0) out vec4 vs_INTERNALTESSPOS0;
					layout(location = 1) out vec4 vs_TANGENT0;
					layout(location = 2) out vec3 vs_NORMAL0;
					layout(location = 3) out vec4 vs_TEXCOORD0;
					layout(location = 4) out vec4 vs_TEXCOORD1;
					layout(location = 5) out vec4 vs_TEXCOORD2;
					layout(location = 6) out vec4 vs_TEXCOORD3;
					layout(location = 7) out vec4 vs_COLOR0;
					void main()
					{
					    vs_INTERNALTESSPOS0 = in_POSITION0;
					    vs_TANGENT0 = in_TANGENT0;
					    vs_NORMAL0.xyz = in_NORMAL0.xyz;
					    vs_TEXCOORD0 = in_TEXCOORD0;
					    vs_TEXCOORD1 = in_TEXCOORD1;
					    vs_TEXCOORD2 = in_TEXCOORD2;
					    vs_TEXCOORD3 = in_TEXCOORD3;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec4 in_TANGENT0;
					layout(location = 2) in  vec3 in_NORMAL0;
					layout(location = 3) in  vec4 in_TEXCOORD0;
					layout(location = 4) in  vec4 in_TEXCOORD1;
					layout(location = 5) in  vec4 in_TEXCOORD2;
					layout(location = 6) in  vec4 in_TEXCOORD3;
					layout(location = 7) in  vec4 in_COLOR0;
					layout(location = 0) out vec4 vs_INTERNALTESSPOS0;
					layout(location = 1) out vec4 vs_TANGENT0;
					layout(location = 2) out vec3 vs_NORMAL0;
					layout(location = 3) out vec4 vs_TEXCOORD0;
					layout(location = 4) out vec4 vs_TEXCOORD1;
					layout(location = 5) out vec4 vs_TEXCOORD2;
					layout(location = 6) out vec4 vs_TEXCOORD3;
					layout(location = 7) out vec4 vs_COLOR0;
					void main()
					{
					    vs_INTERNALTESSPOS0 = in_POSITION0;
					    vs_TANGENT0 = in_TANGENT0;
					    vs_NORMAL0.xyz = in_NORMAL0.xyz;
					    vs_TEXCOORD0 = in_TEXCOORD0;
					    vs_TEXCOORD1 = in_TEXCOORD1;
					    vs_TEXCOORD2 = in_TEXCOORD2;
					    vs_TEXCOORD3 = in_TEXCOORD3;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					Keywords { "POINT" }
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						mat4x4 unity_WorldToLight;
						vec4 unused_0_4[2];
						float _Y_Mask;
						vec4 unused_0_6[2];
						float _FresnelBias;
						float _FresnelScale;
						float _FresnelPower;
						float _Alpha;
						vec4 unused_0_11;
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(binding = 2, std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_2_3;
					};
					layout(binding = 3, std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					layout(location = 4) uniform  sampler2D _LightTexture0;
					layout(location = 5) uniform  sampler3D unity_ProbeVolumeSH;
					layout(location = 0) in  vec3 vs_TEXCOORD0;
					layout(location = 1) in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					float u_xlat18;
					float u_xlat19;
					float u_xlat20;
					bool u_xlatb20;
					float u_xlat21;
					float u_xlat10_21;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
					    u_xlat19 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * vs_TEXCOORD0.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat2.xyz);
					    u_xlat20 = (-u_xlat19) + 1.0;
					    u_xlat20 = log2(u_xlat20);
					    u_xlat20 = u_xlat20 * _FresnelPower;
					    u_xlat20 = exp2(u_xlat20);
					    u_xlat20 = _FresnelScale * u_xlat20 + _FresnelBias;
					    u_xlat21 = (-vs_TEXCOORD0.y) + _Y_Mask;
					    u_xlat21 = abs(u_xlat21) + (-_Y_Mask);
					    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
					    u_xlat21 = (-u_xlat21) + 1.0;
					    u_xlat20 = u_xlat20 * u_xlat21;
					    SV_Target0.w = u_xlat20 * _Alpha;
					    u_xlat4.xyz = vs_TEXCOORD1.yyy * unity_WorldToLight[1].xyz;
					    u_xlat4.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD1.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD1.zzz + u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + unity_WorldToLight[3].xyz;
					    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb20){
					        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat5.xyz = vs_TEXCOORD1.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat5.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD1.zzz + u_xlat5.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat5.xyz = (bool(u_xlatb20)) ? u_xlat5.xyz : vs_TEXCOORD1.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat20 = u_xlat5.y * 0.25 + 0.75;
					        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat5.x = max(u_xlat20, u_xlat21);
					        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
					    } else {
					        u_xlat5.x = float(1.0);
					        u_xlat5.y = float(1.0);
					        u_xlat5.z = float(1.0);
					        u_xlat5.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat20 = dot(u_xlat5, unity_OcclusionMaskSelector);
					    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
					    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat10_21 = texture(_LightTexture0, vec2(u_xlat21)).x;
					    u_xlat20 = u_xlat20 * u_xlat10_21;
					    u_xlat4.xyz = vec3(u_xlat20) * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat2.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = max(u_xlat18, 0.00100000005);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat6.x = abs(u_xlat19) + u_xlat18;
					    u_xlat6.x = u_xlat6.x + 9.99999975e-06;
					    u_xlat6.x = 0.5 / u_xlat6.x;
					    u_xlat6.x = u_xlat6.x * 0.999999881;
					    u_xlat6.x = u_xlat18 * u_xlat6.x;
					    u_xlat6.xyz = u_xlat4.xyz * u_xlat6.xxx;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * 0.959999979 + 0.0399999991;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat6.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						mat4x4 unity_WorldToLight;
						vec4 unused_0_4[2];
						float _Y_Mask;
						vec4 unused_0_6[2];
						float _FresnelBias;
						float _FresnelScale;
						float _FresnelPower;
						float _Alpha;
						vec4 unused_0_11;
					};
					layout(binding = 1, std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_1_3;
					};
					layout(binding = 2, std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(binding = 3, std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(binding = 4, std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					layout(location = 5) uniform  sampler2D _LightTexture0;
					layout(location = 6) uniform  sampler3D unity_ProbeVolumeSH;
					layout(location = 0) in  vec3 vs_TEXCOORD0;
					layout(location = 1) in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					float u_xlat18;
					float u_xlat19;
					int u_xlati19;
					float u_xlat20;
					bool u_xlatb20;
					float u_xlat21;
					float u_xlat10_21;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlati19 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati19].xyz;
					    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
					    u_xlat19 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * vs_TEXCOORD0.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat2.xyz);
					    u_xlat20 = (-u_xlat19) + 1.0;
					    u_xlat20 = log2(u_xlat20);
					    u_xlat20 = u_xlat20 * _FresnelPower;
					    u_xlat20 = exp2(u_xlat20);
					    u_xlat20 = _FresnelScale * u_xlat20 + _FresnelBias;
					    u_xlat21 = (-vs_TEXCOORD0.y) + _Y_Mask;
					    u_xlat21 = abs(u_xlat21) + (-_Y_Mask);
					    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
					    u_xlat21 = (-u_xlat21) + 1.0;
					    u_xlat20 = u_xlat20 * u_xlat21;
					    SV_Target0.w = u_xlat20 * _Alpha;
					    u_xlat4.xyz = vs_TEXCOORD1.yyy * unity_WorldToLight[1].xyz;
					    u_xlat4.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD1.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD1.zzz + u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + unity_WorldToLight[3].xyz;
					    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb20){
					        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat5.xyz = vs_TEXCOORD1.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat5.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD1.zzz + u_xlat5.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat5.xyz = (bool(u_xlatb20)) ? u_xlat5.xyz : vs_TEXCOORD1.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat20 = u_xlat5.y * 0.25 + 0.75;
					        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat5.x = max(u_xlat20, u_xlat21);
					        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
					    } else {
					        u_xlat5.x = float(1.0);
					        u_xlat5.y = float(1.0);
					        u_xlat5.z = float(1.0);
					        u_xlat5.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat20 = dot(u_xlat5, unity_OcclusionMaskSelector);
					    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
					    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat10_21 = texture(_LightTexture0, vec2(u_xlat21)).x;
					    u_xlat20 = u_xlat20 * u_xlat10_21;
					    u_xlat4.xyz = vec3(u_xlat20) * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat2.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = max(u_xlat18, 0.00100000005);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat6.x = abs(u_xlat19) + u_xlat18;
					    u_xlat6.x = u_xlat6.x + 9.99999975e-06;
					    u_xlat6.x = 0.5 / u_xlat6.x;
					    u_xlat6.x = u_xlat6.x * 0.999999881;
					    u_xlat6.x = u_xlat18 * u_xlat6.x;
					    u_xlat6.xyz = u_xlat4.xyz * u_xlat6.xxx;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * 0.959999979 + 0.0399999991;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat6.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" }
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2[3];
						float _Y_Mask;
						vec4 unused_0_4[2];
						float _FresnelBias;
						float _FresnelScale;
						float _FresnelPower;
						float _Alpha;
						vec4 unused_0_9;
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(binding = 2, std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_2_3;
					};
					layout(binding = 3, std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					layout(location = 4) uniform  sampler3D unity_ProbeVolumeSH;
					layout(location = 0) in  vec3 vs_TEXCOORD0;
					layout(location = 1) in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					bool u_xlatb5;
					float u_xlat9;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat13 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * vs_TEXCOORD0.xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat5.x = (-u_xlat1.x) + 1.0;
					    u_xlat5.x = log2(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x * _FresnelPower;
					    u_xlat5.x = exp2(u_xlat5.x);
					    u_xlat5.x = _FresnelScale * u_xlat5.x + _FresnelBias;
					    u_xlat9 = (-vs_TEXCOORD0.y) + _Y_Mask;
					    u_xlat9 = abs(u_xlat9) + (-_Y_Mask);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat5.x = u_xlat9 * u_xlat5.x;
					    SV_Target0.w = u_xlat5.x * _Alpha;
					    u_xlatb5 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb5){
					        u_xlatb5 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat3.xyz = vs_TEXCOORD1.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat3.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat3.xyz;
					        u_xlat3.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD1.zzz + u_xlat3.xyz;
					        u_xlat3.xyz = u_xlat3.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat3.xyz : vs_TEXCOORD1.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat3.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat5.x = u_xlat3.y * 0.25 + 0.75;
					        u_xlat9 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat3.x = max(u_xlat9, u_xlat5.x);
					        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
					    } else {
					        u_xlat3.x = float(1.0);
					        u_xlat3.y = float(1.0);
					        u_xlat3.z = float(1.0);
					        u_xlat3.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat5.x = dot(u_xlat3, unity_OcclusionMaskSelector);
					    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
					    u_xlat5.xyz = u_xlat5.xxx * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = max(u_xlat12, 0.00100000005);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4.x = abs(u_xlat1.x) + u_xlat12;
					    u_xlat4.x = u_xlat4.x + 9.99999975e-06;
					    u_xlat4.x = 0.5 / u_xlat4.x;
					    u_xlat4.x = u_xlat4.x * 0.999999881;
					    u_xlat4.x = u_xlat12 * u_xlat4.x;
					    u_xlat4.xyz = u_xlat5.xyz * u_xlat4.xxx;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * 0.959999979 + 0.0399999991;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat4.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2[3];
						float _Y_Mask;
						vec4 unused_0_4[2];
						float _FresnelBias;
						float _FresnelScale;
						float _FresnelPower;
						float _Alpha;
						vec4 unused_0_9;
					};
					layout(binding = 1, std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_1_3;
					};
					layout(binding = 2, std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(binding = 3, std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(binding = 4, std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					layout(location = 5) uniform  sampler3D unity_ProbeVolumeSH;
					layout(location = 0) in  vec3 vs_TEXCOORD0;
					layout(location = 1) in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					int u_xlati0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					bool u_xlatb5;
					float u_xlat9;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlati0 = unity_StereoEyeIndex;
					    u_xlat0.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati0].xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat13 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * vs_TEXCOORD0.xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat5.x = (-u_xlat1.x) + 1.0;
					    u_xlat5.x = log2(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x * _FresnelPower;
					    u_xlat5.x = exp2(u_xlat5.x);
					    u_xlat5.x = _FresnelScale * u_xlat5.x + _FresnelBias;
					    u_xlat9 = (-vs_TEXCOORD0.y) + _Y_Mask;
					    u_xlat9 = abs(u_xlat9) + (-_Y_Mask);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat5.x = u_xlat9 * u_xlat5.x;
					    SV_Target0.w = u_xlat5.x * _Alpha;
					    u_xlatb5 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb5){
					        u_xlatb5 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat3.xyz = vs_TEXCOORD1.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat3.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat3.xyz;
					        u_xlat3.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD1.zzz + u_xlat3.xyz;
					        u_xlat3.xyz = u_xlat3.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat3.xyz : vs_TEXCOORD1.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat3.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat5.x = u_xlat3.y * 0.25 + 0.75;
					        u_xlat9 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat3.x = max(u_xlat9, u_xlat5.x);
					        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
					    } else {
					        u_xlat3.x = float(1.0);
					        u_xlat3.y = float(1.0);
					        u_xlat3.z = float(1.0);
					        u_xlat3.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat5.x = dot(u_xlat3, unity_OcclusionMaskSelector);
					    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
					    u_xlat5.xyz = u_xlat5.xxx * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = max(u_xlat12, 0.00100000005);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4.x = abs(u_xlat1.x) + u_xlat12;
					    u_xlat4.x = u_xlat4.x + 9.99999975e-06;
					    u_xlat4.x = 0.5 / u_xlat4.x;
					    u_xlat4.x = u_xlat4.x * 0.999999881;
					    u_xlat4.x = u_xlat12 * u_xlat4.x;
					    u_xlat4.xyz = u_xlat5.xyz * u_xlat4.xxx;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * 0.959999979 + 0.0399999991;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat4.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" }
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						mat4x4 unity_WorldToLight;
						vec4 unused_0_4[2];
						float _Y_Mask;
						vec4 unused_0_6[2];
						float _FresnelBias;
						float _FresnelScale;
						float _FresnelPower;
						float _Alpha;
						vec4 unused_0_11;
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(binding = 2, std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_2_3;
					};
					layout(binding = 3, std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					layout(location = 4) uniform  sampler2D _LightTexture0;
					layout(location = 5) uniform  sampler2D _LightTextureB0;
					layout(location = 6) uniform  sampler3D unity_ProbeVolumeSH;
					layout(location = 0) in  vec3 vs_TEXCOORD0;
					layout(location = 1) in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat4;
					float u_xlat10_4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					float u_xlat18;
					float u_xlat19;
					float u_xlat20;
					bool u_xlatb20;
					float u_xlat21;
					bool u_xlatb21;
					float u_xlat10_22;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
					    u_xlat19 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * vs_TEXCOORD0.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat2.xyz);
					    u_xlat20 = (-u_xlat19) + 1.0;
					    u_xlat20 = log2(u_xlat20);
					    u_xlat20 = u_xlat20 * _FresnelPower;
					    u_xlat20 = exp2(u_xlat20);
					    u_xlat20 = _FresnelScale * u_xlat20 + _FresnelBias;
					    u_xlat21 = (-vs_TEXCOORD0.y) + _Y_Mask;
					    u_xlat21 = abs(u_xlat21) + (-_Y_Mask);
					    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
					    u_xlat21 = (-u_xlat21) + 1.0;
					    u_xlat20 = u_xlat20 * u_xlat21;
					    SV_Target0.w = u_xlat20 * _Alpha;
					    u_xlat4 = vs_TEXCOORD1.yyyy * unity_WorldToLight[1];
					    u_xlat4 = unity_WorldToLight[0] * vs_TEXCOORD1.xxxx + u_xlat4;
					    u_xlat4 = unity_WorldToLight[2] * vs_TEXCOORD1.zzzz + u_xlat4;
					    u_xlat4 = u_xlat4 + unity_WorldToLight[3];
					    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb20){
					        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat5.xyz = vs_TEXCOORD1.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat5.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD1.zzz + u_xlat5.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat5.xyz = (bool(u_xlatb20)) ? u_xlat5.xyz : vs_TEXCOORD1.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat20 = u_xlat5.y * 0.25 + 0.75;
					        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat5.x = max(u_xlat20, u_xlat21);
					        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
					    } else {
					        u_xlat5.x = float(1.0);
					        u_xlat5.y = float(1.0);
					        u_xlat5.z = float(1.0);
					        u_xlat5.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat20 = dot(u_xlat5, unity_OcclusionMaskSelector);
					    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
					    u_xlatb21 = 0.0<u_xlat4.z;
					    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
					    u_xlat5.xy = u_xlat4.xy / u_xlat4.ww;
					    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
					    u_xlat10_22 = texture(_LightTexture0, u_xlat5.xy).w;
					    u_xlat21 = u_xlat21 * u_xlat10_22;
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat10_4 = texture(_LightTextureB0, u_xlat4.xx).x;
					    u_xlat21 = u_xlat21 * u_xlat10_4;
					    u_xlat20 = u_xlat20 * u_xlat21;
					    u_xlat4.xyz = vec3(u_xlat20) * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat2.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = max(u_xlat18, 0.00100000005);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat6.x = abs(u_xlat19) + u_xlat18;
					    u_xlat6.x = u_xlat6.x + 9.99999975e-06;
					    u_xlat6.x = 0.5 / u_xlat6.x;
					    u_xlat6.x = u_xlat6.x * 0.999999881;
					    u_xlat6.x = u_xlat18 * u_xlat6.x;
					    u_xlat6.xyz = u_xlat4.xyz * u_xlat6.xxx;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * 0.959999979 + 0.0399999991;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat6.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						mat4x4 unity_WorldToLight;
						vec4 unused_0_4[2];
						float _Y_Mask;
						vec4 unused_0_6[2];
						float _FresnelBias;
						float _FresnelScale;
						float _FresnelPower;
						float _Alpha;
						vec4 unused_0_11;
					};
					layout(binding = 1, std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_1_3;
					};
					layout(binding = 2, std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(binding = 3, std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(binding = 4, std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					layout(location = 5) uniform  sampler2D _LightTexture0;
					layout(location = 6) uniform  sampler2D _LightTextureB0;
					layout(location = 7) uniform  sampler3D unity_ProbeVolumeSH;
					layout(location = 0) in  vec3 vs_TEXCOORD0;
					layout(location = 1) in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat4;
					float u_xlat10_4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					float u_xlat18;
					float u_xlat19;
					int u_xlati19;
					float u_xlat20;
					bool u_xlatb20;
					float u_xlat21;
					bool u_xlatb21;
					float u_xlat10_22;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlati19 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati19].xyz;
					    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
					    u_xlat19 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * vs_TEXCOORD0.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat2.xyz);
					    u_xlat20 = (-u_xlat19) + 1.0;
					    u_xlat20 = log2(u_xlat20);
					    u_xlat20 = u_xlat20 * _FresnelPower;
					    u_xlat20 = exp2(u_xlat20);
					    u_xlat20 = _FresnelScale * u_xlat20 + _FresnelBias;
					    u_xlat21 = (-vs_TEXCOORD0.y) + _Y_Mask;
					    u_xlat21 = abs(u_xlat21) + (-_Y_Mask);
					    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
					    u_xlat21 = (-u_xlat21) + 1.0;
					    u_xlat20 = u_xlat20 * u_xlat21;
					    SV_Target0.w = u_xlat20 * _Alpha;
					    u_xlat4 = vs_TEXCOORD1.yyyy * unity_WorldToLight[1];
					    u_xlat4 = unity_WorldToLight[0] * vs_TEXCOORD1.xxxx + u_xlat4;
					    u_xlat4 = unity_WorldToLight[2] * vs_TEXCOORD1.zzzz + u_xlat4;
					    u_xlat4 = u_xlat4 + unity_WorldToLight[3];
					    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb20){
					        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat5.xyz = vs_TEXCOORD1.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat5.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD1.zzz + u_xlat5.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat5.xyz = (bool(u_xlatb20)) ? u_xlat5.xyz : vs_TEXCOORD1.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat20 = u_xlat5.y * 0.25 + 0.75;
					        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat5.x = max(u_xlat20, u_xlat21);
					        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
					    } else {
					        u_xlat5.x = float(1.0);
					        u_xlat5.y = float(1.0);
					        u_xlat5.z = float(1.0);
					        u_xlat5.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat20 = dot(u_xlat5, unity_OcclusionMaskSelector);
					    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
					    u_xlatb21 = 0.0<u_xlat4.z;
					    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
					    u_xlat5.xy = u_xlat4.xy / u_xlat4.ww;
					    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
					    u_xlat10_22 = texture(_LightTexture0, u_xlat5.xy).w;
					    u_xlat21 = u_xlat21 * u_xlat10_22;
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat10_4 = texture(_LightTextureB0, u_xlat4.xx).x;
					    u_xlat21 = u_xlat21 * u_xlat10_4;
					    u_xlat20 = u_xlat20 * u_xlat21;
					    u_xlat4.xyz = vec3(u_xlat20) * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat2.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = max(u_xlat18, 0.00100000005);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat6.x = abs(u_xlat19) + u_xlat18;
					    u_xlat6.x = u_xlat6.x + 9.99999975e-06;
					    u_xlat6.x = 0.5 / u_xlat6.x;
					    u_xlat6.x = u_xlat6.x * 0.999999881;
					    u_xlat6.x = u_xlat18 * u_xlat6.x;
					    u_xlat6.xyz = u_xlat4.xyz * u_xlat6.xxx;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * 0.959999979 + 0.0399999991;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat6.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" }
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						mat4x4 unity_WorldToLight;
						vec4 unused_0_4[2];
						float _Y_Mask;
						vec4 unused_0_6[2];
						float _FresnelBias;
						float _FresnelScale;
						float _FresnelPower;
						float _Alpha;
						vec4 unused_0_11;
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(binding = 2, std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_2_3;
					};
					layout(binding = 3, std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					layout(location = 4) uniform  sampler2D _LightTextureB0;
					layout(location = 5) uniform  samplerCube _LightTexture0;
					layout(location = 6) uniform  sampler3D unity_ProbeVolumeSH;
					layout(location = 0) in  vec3 vs_TEXCOORD0;
					layout(location = 1) in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat10_4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					float u_xlat18;
					float u_xlat19;
					float u_xlat20;
					bool u_xlatb20;
					float u_xlat21;
					float u_xlat16_21;
					float u_xlat10_21;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
					    u_xlat19 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * vs_TEXCOORD0.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat2.xyz);
					    u_xlat20 = (-u_xlat19) + 1.0;
					    u_xlat20 = log2(u_xlat20);
					    u_xlat20 = u_xlat20 * _FresnelPower;
					    u_xlat20 = exp2(u_xlat20);
					    u_xlat20 = _FresnelScale * u_xlat20 + _FresnelBias;
					    u_xlat21 = (-vs_TEXCOORD0.y) + _Y_Mask;
					    u_xlat21 = abs(u_xlat21) + (-_Y_Mask);
					    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
					    u_xlat21 = (-u_xlat21) + 1.0;
					    u_xlat20 = u_xlat20 * u_xlat21;
					    SV_Target0.w = u_xlat20 * _Alpha;
					    u_xlat4.xyz = vs_TEXCOORD1.yyy * unity_WorldToLight[1].xyz;
					    u_xlat4.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD1.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD1.zzz + u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + unity_WorldToLight[3].xyz;
					    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb20){
					        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat5.xyz = vs_TEXCOORD1.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat5.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD1.zzz + u_xlat5.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat5.xyz = (bool(u_xlatb20)) ? u_xlat5.xyz : vs_TEXCOORD1.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat20 = u_xlat5.y * 0.25 + 0.75;
					        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat5.x = max(u_xlat20, u_xlat21);
					        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
					    } else {
					        u_xlat5.x = float(1.0);
					        u_xlat5.y = float(1.0);
					        u_xlat5.z = float(1.0);
					        u_xlat5.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat20 = dot(u_xlat5, unity_OcclusionMaskSelector);
					    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
					    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat10_21 = texture(_LightTextureB0, vec2(u_xlat21)).x;
					    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xyz).w;
					    u_xlat16_21 = u_xlat10_21 * u_xlat10_4;
					    u_xlat20 = u_xlat20 * u_xlat16_21;
					    u_xlat4.xyz = vec3(u_xlat20) * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat2.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = max(u_xlat18, 0.00100000005);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat6.x = abs(u_xlat19) + u_xlat18;
					    u_xlat6.x = u_xlat6.x + 9.99999975e-06;
					    u_xlat6.x = 0.5 / u_xlat6.x;
					    u_xlat6.x = u_xlat6.x * 0.999999881;
					    u_xlat6.x = u_xlat18 * u_xlat6.x;
					    u_xlat6.xyz = u_xlat4.xyz * u_xlat6.xxx;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * 0.959999979 + 0.0399999991;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat6.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						mat4x4 unity_WorldToLight;
						vec4 unused_0_4[2];
						float _Y_Mask;
						vec4 unused_0_6[2];
						float _FresnelBias;
						float _FresnelScale;
						float _FresnelPower;
						float _Alpha;
						vec4 unused_0_11;
					};
					layout(binding = 1, std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_1_3;
					};
					layout(binding = 2, std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(binding = 3, std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(binding = 4, std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					layout(location = 5) uniform  sampler2D _LightTextureB0;
					layout(location = 6) uniform  samplerCube _LightTexture0;
					layout(location = 7) uniform  sampler3D unity_ProbeVolumeSH;
					layout(location = 0) in  vec3 vs_TEXCOORD0;
					layout(location = 1) in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat10_4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					float u_xlat18;
					float u_xlat19;
					int u_xlati19;
					float u_xlat20;
					bool u_xlatb20;
					float u_xlat21;
					float u_xlat16_21;
					float u_xlat10_21;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlati19 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati19].xyz;
					    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
					    u_xlat19 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.xyz = vec3(u_xlat19) * vs_TEXCOORD0.xyz;
					    u_xlat19 = dot(u_xlat3.xyz, u_xlat2.xyz);
					    u_xlat20 = (-u_xlat19) + 1.0;
					    u_xlat20 = log2(u_xlat20);
					    u_xlat20 = u_xlat20 * _FresnelPower;
					    u_xlat20 = exp2(u_xlat20);
					    u_xlat20 = _FresnelScale * u_xlat20 + _FresnelBias;
					    u_xlat21 = (-vs_TEXCOORD0.y) + _Y_Mask;
					    u_xlat21 = abs(u_xlat21) + (-_Y_Mask);
					    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
					    u_xlat21 = (-u_xlat21) + 1.0;
					    u_xlat20 = u_xlat20 * u_xlat21;
					    SV_Target0.w = u_xlat20 * _Alpha;
					    u_xlat4.xyz = vs_TEXCOORD1.yyy * unity_WorldToLight[1].xyz;
					    u_xlat4.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD1.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD1.zzz + u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + unity_WorldToLight[3].xyz;
					    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb20){
					        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat5.xyz = vs_TEXCOORD1.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat5.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD1.zzz + u_xlat5.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat5.xyz = (bool(u_xlatb20)) ? u_xlat5.xyz : vs_TEXCOORD1.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat20 = u_xlat5.y * 0.25 + 0.75;
					        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat5.x = max(u_xlat20, u_xlat21);
					        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
					    } else {
					        u_xlat5.x = float(1.0);
					        u_xlat5.y = float(1.0);
					        u_xlat5.z = float(1.0);
					        u_xlat5.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat20 = dot(u_xlat5, unity_OcclusionMaskSelector);
					    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
					    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat10_21 = texture(_LightTextureB0, vec2(u_xlat21)).x;
					    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xyz).w;
					    u_xlat16_21 = u_xlat10_21 * u_xlat10_4;
					    u_xlat20 = u_xlat20 * u_xlat16_21;
					    u_xlat4.xyz = vec3(u_xlat20) * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat2.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = max(u_xlat18, 0.00100000005);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat6.x = abs(u_xlat19) + u_xlat18;
					    u_xlat6.x = u_xlat6.x + 9.99999975e-06;
					    u_xlat6.x = 0.5 / u_xlat6.x;
					    u_xlat6.x = u_xlat6.x * 0.999999881;
					    u_xlat6.x = u_xlat18 * u_xlat6.x;
					    u_xlat6.xyz = u_xlat4.xyz * u_xlat6.xxx;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * 0.959999979 + 0.0399999991;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat6.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						mat4x4 unity_WorldToLight;
						vec4 unused_0_4[2];
						float _Y_Mask;
						vec4 unused_0_6[2];
						float _FresnelBias;
						float _FresnelScale;
						float _FresnelPower;
						float _Alpha;
						vec4 unused_0_11;
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(binding = 2, std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_2_3;
					};
					layout(binding = 3, std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					layout(location = 4) uniform  sampler2D _LightTexture0;
					layout(location = 5) uniform  sampler3D unity_ProbeVolumeSH;
					layout(location = 0) in  vec3 vs_TEXCOORD0;
					layout(location = 1) in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat10_5;
					float u_xlat9;
					float u_xlat12;
					float u_xlat13;
					bool u_xlatb13;
					float u_xlat14;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat13 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * vs_TEXCOORD0.xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat5.x = (-u_xlat1.x) + 1.0;
					    u_xlat5.x = log2(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x * _FresnelPower;
					    u_xlat5.x = exp2(u_xlat5.x);
					    u_xlat5.x = _FresnelScale * u_xlat5.x + _FresnelBias;
					    u_xlat9 = (-vs_TEXCOORD0.y) + _Y_Mask;
					    u_xlat9 = abs(u_xlat9) + (-_Y_Mask);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat5.x = u_xlat9 * u_xlat5.x;
					    SV_Target0.w = u_xlat5.x * _Alpha;
					    u_xlat5.xy = vs_TEXCOORD1.yy * unity_WorldToLight[1].xy;
					    u_xlat5.xy = unity_WorldToLight[0].xy * vs_TEXCOORD1.xx + u_xlat5.xy;
					    u_xlat5.xy = unity_WorldToLight[2].xy * vs_TEXCOORD1.zz + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy + unity_WorldToLight[3].xy;
					    u_xlatb13 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb13){
					        u_xlatb13 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat3.xyz = vs_TEXCOORD1.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat3.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat3.xyz;
					        u_xlat3.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD1.zzz + u_xlat3.xyz;
					        u_xlat3.xyz = u_xlat3.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat3.xyz = (bool(u_xlatb13)) ? u_xlat3.xyz : vs_TEXCOORD1.xyz;
					        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat13 = u_xlat3.y * 0.25 + 0.75;
					        u_xlat14 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat3.x = max(u_xlat13, u_xlat14);
					        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
					    } else {
					        u_xlat3.x = float(1.0);
					        u_xlat3.y = float(1.0);
					        u_xlat3.z = float(1.0);
					        u_xlat3.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat13 = dot(u_xlat3, unity_OcclusionMaskSelector);
					    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
					    u_xlat10_5 = texture(_LightTexture0, u_xlat5.xy).w;
					    u_xlat5.x = u_xlat13 * u_xlat10_5;
					    u_xlat5.xyz = u_xlat5.xxx * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = max(u_xlat12, 0.00100000005);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4.x = abs(u_xlat1.x) + u_xlat12;
					    u_xlat4.x = u_xlat4.x + 9.99999975e-06;
					    u_xlat4.x = 0.5 / u_xlat4.x;
					    u_xlat4.x = u_xlat4.x * 0.999999881;
					    u_xlat4.x = u_xlat12 * u_xlat4.x;
					    u_xlat4.xyz = u_xlat5.xyz * u_xlat4.xxx;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * 0.959999979 + 0.0399999991;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat4.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						mat4x4 unity_WorldToLight;
						vec4 unused_0_4[2];
						float _Y_Mask;
						vec4 unused_0_6[2];
						float _FresnelBias;
						float _FresnelScale;
						float _FresnelPower;
						float _Alpha;
						vec4 unused_0_11;
					};
					layout(binding = 1, std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[45];
						vec4 unity_OcclusionMaskSelector;
						vec4 unused_1_3;
					};
					layout(binding = 2, std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_2[3];
					};
					layout(binding = 3, std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(binding = 4, std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					layout(location = 5) uniform  sampler2D _LightTexture0;
					layout(location = 6) uniform  sampler3D unity_ProbeVolumeSH;
					layout(location = 0) in  vec3 vs_TEXCOORD0;
					layout(location = 1) in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					int u_xlati0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat10_5;
					float u_xlat9;
					float u_xlat12;
					float u_xlat13;
					bool u_xlatb13;
					float u_xlat14;
					void main()
					{
					    u_xlati0 = unity_StereoEyeIndex;
					    u_xlat0.xyz = (-vs_TEXCOORD1.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati0].xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat13 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2.xyz = vec3(u_xlat13) * vs_TEXCOORD0.xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat5.x = (-u_xlat1.x) + 1.0;
					    u_xlat5.x = log2(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x * _FresnelPower;
					    u_xlat5.x = exp2(u_xlat5.x);
					    u_xlat5.x = _FresnelScale * u_xlat5.x + _FresnelBias;
					    u_xlat9 = (-vs_TEXCOORD0.y) + _Y_Mask;
					    u_xlat9 = abs(u_xlat9) + (-_Y_Mask);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat5.x = u_xlat9 * u_xlat5.x;
					    SV_Target0.w = u_xlat5.x * _Alpha;
					    u_xlat5.xy = vs_TEXCOORD1.yy * unity_WorldToLight[1].xy;
					    u_xlat5.xy = unity_WorldToLight[0].xy * vs_TEXCOORD1.xx + u_xlat5.xy;
					    u_xlat5.xy = unity_WorldToLight[2].xy * vs_TEXCOORD1.zz + u_xlat5.xy;
					    u_xlat5.xy = u_xlat5.xy + unity_WorldToLight[3].xy;
					    u_xlatb13 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb13){
					        u_xlatb13 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat3.xyz = vs_TEXCOORD1.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat3.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat3.xyz;
					        u_xlat3.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD1.zzz + u_xlat3.xyz;
					        u_xlat3.xyz = u_xlat3.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat3.xyz = (bool(u_xlatb13)) ? u_xlat3.xyz : vs_TEXCOORD1.xyz;
					        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat13 = u_xlat3.y * 0.25 + 0.75;
					        u_xlat14 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
					        u_xlat3.x = max(u_xlat13, u_xlat14);
					        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
					    } else {
					        u_xlat3.x = float(1.0);
					        u_xlat3.y = float(1.0);
					        u_xlat3.z = float(1.0);
					        u_xlat3.w = float(1.0);
					    //ENDIF
					    }
					    u_xlat13 = dot(u_xlat3, unity_OcclusionMaskSelector);
					    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
					    u_xlat10_5 = texture(_LightTexture0, u_xlat5.xy).w;
					    u_xlat5.x = u_xlat13 * u_xlat10_5;
					    u_xlat5.xyz = u_xlat5.xxx * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = max(u_xlat12, 0.00100000005);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4.x = abs(u_xlat1.x) + u_xlat12;
					    u_xlat4.x = u_xlat4.x + 9.99999975e-06;
					    u_xlat4.x = 0.5 / u_xlat4.x;
					    u_xlat4.x = u_xlat4.x * 0.999999881;
					    u_xlat4.x = u_xlat12 * u_xlat4.x;
					    u_xlat4.xyz = u_xlat5.xyz * u_xlat4.xxx;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * 0.959999979 + 0.0399999991;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat4.xyz;
					    return;
					}"
				}
			}
			Program "hp" {
				SubProgram "d3d11 " {
					Keywords { "POINT" }
					"!!hs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(vertices=3) out;
					layout(binding = 0, std140) uniform HGlobals {
						vec4 unused_0_0[14];
						float _EdgeLength;
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(location = 0) in vec4 vs_INTERNALTESSPOS0[];
					layout(location = 0) out vec4 hs_INTERNALTESSPOS0[];
					layout(location = 1) in vec4 vs_TANGENT0[];
					layout(location = 1) out vec4 hs_TANGENT0[];
					layout(location = 2) in vec3 vs_NORMAL0[];
					layout(location = 2) out vec3 hs_NORMAL0[];
					layout(location = 3) in vec4 vs_TEXCOORD0[];
					layout(location = 3) out vec4 hs_TEXCOORD0[];
					layout(location = 4) in vec4 vs_TEXCOORD1[];
					layout(location = 4) out vec4 hs_TEXCOORD1[];
					layout(location = 5) in vec4 vs_TEXCOORD2[];
					layout(location = 5) out vec4 hs_TEXCOORD2[];
					layout(location = 6) in vec4 vs_TEXCOORD3[];
					layout(location = 6) out vec4 hs_TEXCOORD3[];
					layout(location = 7) in vec4 vs_COLOR0[];
					layout(location = 7) out vec4 hs_COLOR0[];
					void passthrough_ctrl_points()
					{
					    hs_INTERNALTESSPOS0[gl_InvocationID] = vs_INTERNALTESSPOS0[gl_InvocationID];
					    hs_TANGENT0[gl_InvocationID] = vs_TANGENT0[gl_InvocationID];
					    hs_NORMAL0[gl_InvocationID] = vs_NORMAL0[gl_InvocationID];
					    hs_TEXCOORD0[gl_InvocationID] = vs_TEXCOORD0[gl_InvocationID];
					    hs_TEXCOORD1[gl_InvocationID] = vs_TEXCOORD1[gl_InvocationID];
					    hs_TEXCOORD2[gl_InvocationID] = vs_TEXCOORD2[gl_InvocationID];
					    hs_TEXCOORD3[gl_InvocationID] = vs_TEXCOORD3[gl_InvocationID];
					    hs_COLOR0[gl_InvocationID] = vs_COLOR0[gl_InvocationID];
					}
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat12;
					float u_xlat13;
					void fork_phase2(int phaseInstanceID)
					{
					    u_xlat0.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[1].yyy;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[1].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[1].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[1].www + u_xlat0.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[2].yyy;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[2].www + u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + (-_WorldSpaceCameraPos.xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _EdgeLength;
					    u_xlat2.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = sqrt(u_xlat13);
					    u_xlat13 = u_xlat13 * _ScreenParams.y;
					    u_xlat12 = u_xlat13 / u_xlat12;
					    gl_TessLevelOuter[0] = max(u_xlat12, 1.0);
					    u_xlat2.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[0].yyy;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[0].www + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _ScreenParams.y;
					    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * _EdgeLength;
					    u_xlat12 = u_xlat12 / u_xlat1.x;
					    gl_TessLevelOuter[1] = max(u_xlat12, 1.0);
					    u_xlat1.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _ScreenParams.y;
					    u_xlat4.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + (-_WorldSpaceCameraPos.xyz);
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * _EdgeLength;
					    u_xlat0.x = u_xlat0.x / u_xlat4.x;
					    gl_TessLevelOuter[2] = max(u_xlat0.x, 1.0);
					}
					void join_phase3(int phaseInstanceID)
					{
					    u_xlat0.x = gl_TessLevelOuter[2] + gl_TessLevelOuter[2];
					    u_xlat0.x = u_xlat0.x + gl_TessLevelOuter[2];
					    gl_TessLevelInner[0] = u_xlat0.x * 0.333333343;
					}
					void main()
					{
					    passthrough_ctrl_points();
					    barrier();
					    if (gl_InvocationID == 0)
					    {
					        fork_phase2(0);
					        join_phase3(0);
					    }
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "UNITY_SINGLE_PASS_STEREO" }
					"!!hs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(vertices=3) out;
					layout(binding = 0, std140) uniform HGlobals {
						vec4 unused_0_0[14];
						float _EdgeLength;
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(binding = 3, std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(binding = 4, std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(location = 0) in vec4 vs_INTERNALTESSPOS0[];
					layout(location = 0) out vec4 hs_INTERNALTESSPOS0[];
					layout(location = 1) in vec4 vs_TANGENT0[];
					layout(location = 1) out vec4 hs_TANGENT0[];
					layout(location = 2) in vec3 vs_NORMAL0[];
					layout(location = 2) out vec3 hs_NORMAL0[];
					layout(location = 3) in vec4 vs_TEXCOORD0[];
					layout(location = 3) out vec4 hs_TEXCOORD0[];
					layout(location = 4) in vec4 vs_TEXCOORD1[];
					layout(location = 4) out vec4 hs_TEXCOORD1[];
					layout(location = 5) in vec4 vs_TEXCOORD2[];
					layout(location = 5) out vec4 hs_TEXCOORD2[];
					layout(location = 6) in vec4 vs_TEXCOORD3[];
					layout(location = 6) out vec4 hs_TEXCOORD3[];
					layout(location = 7) in vec4 vs_COLOR0[];
					layout(location = 7) out vec4 hs_COLOR0[];
					void passthrough_ctrl_points()
					{
					    hs_INTERNALTESSPOS0[gl_InvocationID] = vs_INTERNALTESSPOS0[gl_InvocationID];
					    hs_TANGENT0[gl_InvocationID] = vs_TANGENT0[gl_InvocationID];
					    hs_NORMAL0[gl_InvocationID] = vs_NORMAL0[gl_InvocationID];
					    hs_TEXCOORD0[gl_InvocationID] = vs_TEXCOORD0[gl_InvocationID];
					    hs_TEXCOORD1[gl_InvocationID] = vs_TEXCOORD1[gl_InvocationID];
					    hs_TEXCOORD2[gl_InvocationID] = vs_TEXCOORD2[gl_InvocationID];
					    hs_TEXCOORD3[gl_InvocationID] = vs_TEXCOORD3[gl_InvocationID];
					    hs_COLOR0[gl_InvocationID] = vs_COLOR0[gl_InvocationID];
					}
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat12;
					int u_xlati13;
					void fork_phase2(int phaseInstanceID)
					{
					    u_xlat0.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[1].yyy;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[1].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[1].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[1].www + u_xlat0.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[2].yyy;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[2].www + u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _ScreenParams.y;
					    u_xlat2.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlati13 = unity_StereoEyeIndex;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + (-unity_StereoWorldSpaceCameraPos[u_xlati13].xyz);
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat2.x = sqrt(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * _EdgeLength;
					    u_xlat12 = u_xlat12 / u_xlat2.x;
					    gl_TessLevelOuter[0] = max(u_xlat12, 1.0);
					    u_xlat2.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[0].yyy;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[0].www + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _ScreenParams.y;
					    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + (-unity_StereoWorldSpaceCameraPos[u_xlati13].xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * _EdgeLength;
					    u_xlat12 = u_xlat12 / u_xlat1.x;
					    gl_TessLevelOuter[1] = max(u_xlat12, 1.0);
					    u_xlat1.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _ScreenParams.y;
					    u_xlat4.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + (-unity_StereoWorldSpaceCameraPos[u_xlati13].xyz);
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * _EdgeLength;
					    u_xlat0.x = u_xlat0.x / u_xlat4.x;
					    gl_TessLevelOuter[2] = max(u_xlat0.x, 1.0);
					}
					void join_phase3(int phaseInstanceID)
					{
					    u_xlat0.x = gl_TessLevelOuter[2] + gl_TessLevelOuter[2];
					    u_xlat0.x = u_xlat0.x + gl_TessLevelOuter[2];
					    gl_TessLevelInner[0] = u_xlat0.x * 0.333333343;
					}
					void main()
					{
					    passthrough_ctrl_points();
					    barrier();
					    if (gl_InvocationID == 0)
					    {
					        fork_phase2(0);
					        join_phase3(0);
					    }
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" }
					"!!hs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(vertices=3) out;
					layout(binding = 0, std140) uniform HGlobals {
						vec4 unused_0_0[10];
						float _EdgeLength;
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(location = 0) in vec4 vs_INTERNALTESSPOS0[];
					layout(location = 0) out vec4 hs_INTERNALTESSPOS0[];
					layout(location = 1) in vec4 vs_TANGENT0[];
					layout(location = 1) out vec4 hs_TANGENT0[];
					layout(location = 2) in vec3 vs_NORMAL0[];
					layout(location = 2) out vec3 hs_NORMAL0[];
					layout(location = 3) in vec4 vs_TEXCOORD0[];
					layout(location = 3) out vec4 hs_TEXCOORD0[];
					layout(location = 4) in vec4 vs_TEXCOORD1[];
					layout(location = 4) out vec4 hs_TEXCOORD1[];
					layout(location = 5) in vec4 vs_TEXCOORD2[];
					layout(location = 5) out vec4 hs_TEXCOORD2[];
					layout(location = 6) in vec4 vs_TEXCOORD3[];
					layout(location = 6) out vec4 hs_TEXCOORD3[];
					layout(location = 7) in vec4 vs_COLOR0[];
					layout(location = 7) out vec4 hs_COLOR0[];
					void passthrough_ctrl_points()
					{
					    hs_INTERNALTESSPOS0[gl_InvocationID] = vs_INTERNALTESSPOS0[gl_InvocationID];
					    hs_TANGENT0[gl_InvocationID] = vs_TANGENT0[gl_InvocationID];
					    hs_NORMAL0[gl_InvocationID] = vs_NORMAL0[gl_InvocationID];
					    hs_TEXCOORD0[gl_InvocationID] = vs_TEXCOORD0[gl_InvocationID];
					    hs_TEXCOORD1[gl_InvocationID] = vs_TEXCOORD1[gl_InvocationID];
					    hs_TEXCOORD2[gl_InvocationID] = vs_TEXCOORD2[gl_InvocationID];
					    hs_TEXCOORD3[gl_InvocationID] = vs_TEXCOORD3[gl_InvocationID];
					    hs_COLOR0[gl_InvocationID] = vs_COLOR0[gl_InvocationID];
					}
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat12;
					float u_xlat13;
					void fork_phase2(int phaseInstanceID)
					{
					    u_xlat0.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[1].yyy;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[1].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[1].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[1].www + u_xlat0.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[2].yyy;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[2].www + u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + (-_WorldSpaceCameraPos.xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _EdgeLength;
					    u_xlat2.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = sqrt(u_xlat13);
					    u_xlat13 = u_xlat13 * _ScreenParams.y;
					    u_xlat12 = u_xlat13 / u_xlat12;
					    gl_TessLevelOuter[0] = max(u_xlat12, 1.0);
					    u_xlat2.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[0].yyy;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[0].www + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _ScreenParams.y;
					    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * _EdgeLength;
					    u_xlat12 = u_xlat12 / u_xlat1.x;
					    gl_TessLevelOuter[1] = max(u_xlat12, 1.0);
					    u_xlat1.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _ScreenParams.y;
					    u_xlat4.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + (-_WorldSpaceCameraPos.xyz);
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * _EdgeLength;
					    u_xlat0.x = u_xlat0.x / u_xlat4.x;
					    gl_TessLevelOuter[2] = max(u_xlat0.x, 1.0);
					}
					void join_phase3(int phaseInstanceID)
					{
					    u_xlat0.x = gl_TessLevelOuter[2] + gl_TessLevelOuter[2];
					    u_xlat0.x = u_xlat0.x + gl_TessLevelOuter[2];
					    gl_TessLevelInner[0] = u_xlat0.x * 0.333333343;
					}
					void main()
					{
					    passthrough_ctrl_points();
					    barrier();
					    if (gl_InvocationID == 0)
					    {
					        fork_phase2(0);
					        join_phase3(0);
					    }
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "UNITY_SINGLE_PASS_STEREO" }
					"!!hs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(vertices=3) out;
					layout(binding = 0, std140) uniform HGlobals {
						vec4 unused_0_0[10];
						float _EdgeLength;
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(binding = 3, std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(binding = 4, std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(location = 0) in vec4 vs_INTERNALTESSPOS0[];
					layout(location = 0) out vec4 hs_INTERNALTESSPOS0[];
					layout(location = 1) in vec4 vs_TANGENT0[];
					layout(location = 1) out vec4 hs_TANGENT0[];
					layout(location = 2) in vec3 vs_NORMAL0[];
					layout(location = 2) out vec3 hs_NORMAL0[];
					layout(location = 3) in vec4 vs_TEXCOORD0[];
					layout(location = 3) out vec4 hs_TEXCOORD0[];
					layout(location = 4) in vec4 vs_TEXCOORD1[];
					layout(location = 4) out vec4 hs_TEXCOORD1[];
					layout(location = 5) in vec4 vs_TEXCOORD2[];
					layout(location = 5) out vec4 hs_TEXCOORD2[];
					layout(location = 6) in vec4 vs_TEXCOORD3[];
					layout(location = 6) out vec4 hs_TEXCOORD3[];
					layout(location = 7) in vec4 vs_COLOR0[];
					layout(location = 7) out vec4 hs_COLOR0[];
					void passthrough_ctrl_points()
					{
					    hs_INTERNALTESSPOS0[gl_InvocationID] = vs_INTERNALTESSPOS0[gl_InvocationID];
					    hs_TANGENT0[gl_InvocationID] = vs_TANGENT0[gl_InvocationID];
					    hs_NORMAL0[gl_InvocationID] = vs_NORMAL0[gl_InvocationID];
					    hs_TEXCOORD0[gl_InvocationID] = vs_TEXCOORD0[gl_InvocationID];
					    hs_TEXCOORD1[gl_InvocationID] = vs_TEXCOORD1[gl_InvocationID];
					    hs_TEXCOORD2[gl_InvocationID] = vs_TEXCOORD2[gl_InvocationID];
					    hs_TEXCOORD3[gl_InvocationID] = vs_TEXCOORD3[gl_InvocationID];
					    hs_COLOR0[gl_InvocationID] = vs_COLOR0[gl_InvocationID];
					}
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat12;
					int u_xlati13;
					void fork_phase2(int phaseInstanceID)
					{
					    u_xlat0.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[1].yyy;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[1].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[1].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[1].www + u_xlat0.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[2].yyy;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[2].www + u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _ScreenParams.y;
					    u_xlat2.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlati13 = unity_StereoEyeIndex;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + (-unity_StereoWorldSpaceCameraPos[u_xlati13].xyz);
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat2.x = sqrt(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * _EdgeLength;
					    u_xlat12 = u_xlat12 / u_xlat2.x;
					    gl_TessLevelOuter[0] = max(u_xlat12, 1.0);
					    u_xlat2.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[0].yyy;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[0].www + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _ScreenParams.y;
					    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + (-unity_StereoWorldSpaceCameraPos[u_xlati13].xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * _EdgeLength;
					    u_xlat12 = u_xlat12 / u_xlat1.x;
					    gl_TessLevelOuter[1] = max(u_xlat12, 1.0);
					    u_xlat1.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _ScreenParams.y;
					    u_xlat4.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + (-unity_StereoWorldSpaceCameraPos[u_xlati13].xyz);
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * _EdgeLength;
					    u_xlat0.x = u_xlat0.x / u_xlat4.x;
					    gl_TessLevelOuter[2] = max(u_xlat0.x, 1.0);
					}
					void join_phase3(int phaseInstanceID)
					{
					    u_xlat0.x = gl_TessLevelOuter[2] + gl_TessLevelOuter[2];
					    u_xlat0.x = u_xlat0.x + gl_TessLevelOuter[2];
					    gl_TessLevelInner[0] = u_xlat0.x * 0.333333343;
					}
					void main()
					{
					    passthrough_ctrl_points();
					    barrier();
					    if (gl_InvocationID == 0)
					    {
					        fork_phase2(0);
					        join_phase3(0);
					    }
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" }
					"!!hs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(vertices=3) out;
					layout(binding = 0, std140) uniform HGlobals {
						vec4 unused_0_0[14];
						float _EdgeLength;
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(location = 0) in vec4 vs_INTERNALTESSPOS0[];
					layout(location = 0) out vec4 hs_INTERNALTESSPOS0[];
					layout(location = 1) in vec4 vs_TANGENT0[];
					layout(location = 1) out vec4 hs_TANGENT0[];
					layout(location = 2) in vec3 vs_NORMAL0[];
					layout(location = 2) out vec3 hs_NORMAL0[];
					layout(location = 3) in vec4 vs_TEXCOORD0[];
					layout(location = 3) out vec4 hs_TEXCOORD0[];
					layout(location = 4) in vec4 vs_TEXCOORD1[];
					layout(location = 4) out vec4 hs_TEXCOORD1[];
					layout(location = 5) in vec4 vs_TEXCOORD2[];
					layout(location = 5) out vec4 hs_TEXCOORD2[];
					layout(location = 6) in vec4 vs_TEXCOORD3[];
					layout(location = 6) out vec4 hs_TEXCOORD3[];
					layout(location = 7) in vec4 vs_COLOR0[];
					layout(location = 7) out vec4 hs_COLOR0[];
					void passthrough_ctrl_points()
					{
					    hs_INTERNALTESSPOS0[gl_InvocationID] = vs_INTERNALTESSPOS0[gl_InvocationID];
					    hs_TANGENT0[gl_InvocationID] = vs_TANGENT0[gl_InvocationID];
					    hs_NORMAL0[gl_InvocationID] = vs_NORMAL0[gl_InvocationID];
					    hs_TEXCOORD0[gl_InvocationID] = vs_TEXCOORD0[gl_InvocationID];
					    hs_TEXCOORD1[gl_InvocationID] = vs_TEXCOORD1[gl_InvocationID];
					    hs_TEXCOORD2[gl_InvocationID] = vs_TEXCOORD2[gl_InvocationID];
					    hs_TEXCOORD3[gl_InvocationID] = vs_TEXCOORD3[gl_InvocationID];
					    hs_COLOR0[gl_InvocationID] = vs_COLOR0[gl_InvocationID];
					}
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat12;
					float u_xlat13;
					void fork_phase2(int phaseInstanceID)
					{
					    u_xlat0.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[1].yyy;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[1].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[1].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[1].www + u_xlat0.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[2].yyy;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[2].www + u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + (-_WorldSpaceCameraPos.xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _EdgeLength;
					    u_xlat2.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = sqrt(u_xlat13);
					    u_xlat13 = u_xlat13 * _ScreenParams.y;
					    u_xlat12 = u_xlat13 / u_xlat12;
					    gl_TessLevelOuter[0] = max(u_xlat12, 1.0);
					    u_xlat2.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[0].yyy;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[0].www + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _ScreenParams.y;
					    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * _EdgeLength;
					    u_xlat12 = u_xlat12 / u_xlat1.x;
					    gl_TessLevelOuter[1] = max(u_xlat12, 1.0);
					    u_xlat1.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _ScreenParams.y;
					    u_xlat4.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + (-_WorldSpaceCameraPos.xyz);
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * _EdgeLength;
					    u_xlat0.x = u_xlat0.x / u_xlat4.x;
					    gl_TessLevelOuter[2] = max(u_xlat0.x, 1.0);
					}
					void join_phase3(int phaseInstanceID)
					{
					    u_xlat0.x = gl_TessLevelOuter[2] + gl_TessLevelOuter[2];
					    u_xlat0.x = u_xlat0.x + gl_TessLevelOuter[2];
					    gl_TessLevelInner[0] = u_xlat0.x * 0.333333343;
					}
					void main()
					{
					    passthrough_ctrl_points();
					    barrier();
					    if (gl_InvocationID == 0)
					    {
					        fork_phase2(0);
					        join_phase3(0);
					    }
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "UNITY_SINGLE_PASS_STEREO" }
					"!!hs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(vertices=3) out;
					layout(binding = 0, std140) uniform HGlobals {
						vec4 unused_0_0[14];
						float _EdgeLength;
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(binding = 3, std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(binding = 4, std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(location = 0) in vec4 vs_INTERNALTESSPOS0[];
					layout(location = 0) out vec4 hs_INTERNALTESSPOS0[];
					layout(location = 1) in vec4 vs_TANGENT0[];
					layout(location = 1) out vec4 hs_TANGENT0[];
					layout(location = 2) in vec3 vs_NORMAL0[];
					layout(location = 2) out vec3 hs_NORMAL0[];
					layout(location = 3) in vec4 vs_TEXCOORD0[];
					layout(location = 3) out vec4 hs_TEXCOORD0[];
					layout(location = 4) in vec4 vs_TEXCOORD1[];
					layout(location = 4) out vec4 hs_TEXCOORD1[];
					layout(location = 5) in vec4 vs_TEXCOORD2[];
					layout(location = 5) out vec4 hs_TEXCOORD2[];
					layout(location = 6) in vec4 vs_TEXCOORD3[];
					layout(location = 6) out vec4 hs_TEXCOORD3[];
					layout(location = 7) in vec4 vs_COLOR0[];
					layout(location = 7) out vec4 hs_COLOR0[];
					void passthrough_ctrl_points()
					{
					    hs_INTERNALTESSPOS0[gl_InvocationID] = vs_INTERNALTESSPOS0[gl_InvocationID];
					    hs_TANGENT0[gl_InvocationID] = vs_TANGENT0[gl_InvocationID];
					    hs_NORMAL0[gl_InvocationID] = vs_NORMAL0[gl_InvocationID];
					    hs_TEXCOORD0[gl_InvocationID] = vs_TEXCOORD0[gl_InvocationID];
					    hs_TEXCOORD1[gl_InvocationID] = vs_TEXCOORD1[gl_InvocationID];
					    hs_TEXCOORD2[gl_InvocationID] = vs_TEXCOORD2[gl_InvocationID];
					    hs_TEXCOORD3[gl_InvocationID] = vs_TEXCOORD3[gl_InvocationID];
					    hs_COLOR0[gl_InvocationID] = vs_COLOR0[gl_InvocationID];
					}
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat12;
					int u_xlati13;
					void fork_phase2(int phaseInstanceID)
					{
					    u_xlat0.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[1].yyy;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[1].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[1].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[1].www + u_xlat0.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[2].yyy;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[2].www + u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _ScreenParams.y;
					    u_xlat2.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlati13 = unity_StereoEyeIndex;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + (-unity_StereoWorldSpaceCameraPos[u_xlati13].xyz);
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat2.x = sqrt(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * _EdgeLength;
					    u_xlat12 = u_xlat12 / u_xlat2.x;
					    gl_TessLevelOuter[0] = max(u_xlat12, 1.0);
					    u_xlat2.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[0].yyy;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[0].www + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _ScreenParams.y;
					    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + (-unity_StereoWorldSpaceCameraPos[u_xlati13].xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * _EdgeLength;
					    u_xlat12 = u_xlat12 / u_xlat1.x;
					    gl_TessLevelOuter[1] = max(u_xlat12, 1.0);
					    u_xlat1.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _ScreenParams.y;
					    u_xlat4.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + (-unity_StereoWorldSpaceCameraPos[u_xlati13].xyz);
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * _EdgeLength;
					    u_xlat0.x = u_xlat0.x / u_xlat4.x;
					    gl_TessLevelOuter[2] = max(u_xlat0.x, 1.0);
					}
					void join_phase3(int phaseInstanceID)
					{
					    u_xlat0.x = gl_TessLevelOuter[2] + gl_TessLevelOuter[2];
					    u_xlat0.x = u_xlat0.x + gl_TessLevelOuter[2];
					    gl_TessLevelInner[0] = u_xlat0.x * 0.333333343;
					}
					void main()
					{
					    passthrough_ctrl_points();
					    barrier();
					    if (gl_InvocationID == 0)
					    {
					        fork_phase2(0);
					        join_phase3(0);
					    }
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" }
					"!!hs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(vertices=3) out;
					layout(binding = 0, std140) uniform HGlobals {
						vec4 unused_0_0[14];
						float _EdgeLength;
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(location = 0) in vec4 vs_INTERNALTESSPOS0[];
					layout(location = 0) out vec4 hs_INTERNALTESSPOS0[];
					layout(location = 1) in vec4 vs_TANGENT0[];
					layout(location = 1) out vec4 hs_TANGENT0[];
					layout(location = 2) in vec3 vs_NORMAL0[];
					layout(location = 2) out vec3 hs_NORMAL0[];
					layout(location = 3) in vec4 vs_TEXCOORD0[];
					layout(location = 3) out vec4 hs_TEXCOORD0[];
					layout(location = 4) in vec4 vs_TEXCOORD1[];
					layout(location = 4) out vec4 hs_TEXCOORD1[];
					layout(location = 5) in vec4 vs_TEXCOORD2[];
					layout(location = 5) out vec4 hs_TEXCOORD2[];
					layout(location = 6) in vec4 vs_TEXCOORD3[];
					layout(location = 6) out vec4 hs_TEXCOORD3[];
					layout(location = 7) in vec4 vs_COLOR0[];
					layout(location = 7) out vec4 hs_COLOR0[];
					void passthrough_ctrl_points()
					{
					    hs_INTERNALTESSPOS0[gl_InvocationID] = vs_INTERNALTESSPOS0[gl_InvocationID];
					    hs_TANGENT0[gl_InvocationID] = vs_TANGENT0[gl_InvocationID];
					    hs_NORMAL0[gl_InvocationID] = vs_NORMAL0[gl_InvocationID];
					    hs_TEXCOORD0[gl_InvocationID] = vs_TEXCOORD0[gl_InvocationID];
					    hs_TEXCOORD1[gl_InvocationID] = vs_TEXCOORD1[gl_InvocationID];
					    hs_TEXCOORD2[gl_InvocationID] = vs_TEXCOORD2[gl_InvocationID];
					    hs_TEXCOORD3[gl_InvocationID] = vs_TEXCOORD3[gl_InvocationID];
					    hs_COLOR0[gl_InvocationID] = vs_COLOR0[gl_InvocationID];
					}
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat12;
					float u_xlat13;
					void fork_phase2(int phaseInstanceID)
					{
					    u_xlat0.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[1].yyy;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[1].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[1].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[1].www + u_xlat0.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[2].yyy;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[2].www + u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + (-_WorldSpaceCameraPos.xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _EdgeLength;
					    u_xlat2.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = sqrt(u_xlat13);
					    u_xlat13 = u_xlat13 * _ScreenParams.y;
					    u_xlat12 = u_xlat13 / u_xlat12;
					    gl_TessLevelOuter[0] = max(u_xlat12, 1.0);
					    u_xlat2.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[0].yyy;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[0].www + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _ScreenParams.y;
					    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * _EdgeLength;
					    u_xlat12 = u_xlat12 / u_xlat1.x;
					    gl_TessLevelOuter[1] = max(u_xlat12, 1.0);
					    u_xlat1.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _ScreenParams.y;
					    u_xlat4.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + (-_WorldSpaceCameraPos.xyz);
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * _EdgeLength;
					    u_xlat0.x = u_xlat0.x / u_xlat4.x;
					    gl_TessLevelOuter[2] = max(u_xlat0.x, 1.0);
					}
					void join_phase3(int phaseInstanceID)
					{
					    u_xlat0.x = gl_TessLevelOuter[2] + gl_TessLevelOuter[2];
					    u_xlat0.x = u_xlat0.x + gl_TessLevelOuter[2];
					    gl_TessLevelInner[0] = u_xlat0.x * 0.333333343;
					}
					void main()
					{
					    passthrough_ctrl_points();
					    barrier();
					    if (gl_InvocationID == 0)
					    {
					        fork_phase2(0);
					        join_phase3(0);
					    }
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "UNITY_SINGLE_PASS_STEREO" }
					"!!hs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(vertices=3) out;
					layout(binding = 0, std140) uniform HGlobals {
						vec4 unused_0_0[14];
						float _EdgeLength;
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(binding = 3, std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(binding = 4, std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(location = 0) in vec4 vs_INTERNALTESSPOS0[];
					layout(location = 0) out vec4 hs_INTERNALTESSPOS0[];
					layout(location = 1) in vec4 vs_TANGENT0[];
					layout(location = 1) out vec4 hs_TANGENT0[];
					layout(location = 2) in vec3 vs_NORMAL0[];
					layout(location = 2) out vec3 hs_NORMAL0[];
					layout(location = 3) in vec4 vs_TEXCOORD0[];
					layout(location = 3) out vec4 hs_TEXCOORD0[];
					layout(location = 4) in vec4 vs_TEXCOORD1[];
					layout(location = 4) out vec4 hs_TEXCOORD1[];
					layout(location = 5) in vec4 vs_TEXCOORD2[];
					layout(location = 5) out vec4 hs_TEXCOORD2[];
					layout(location = 6) in vec4 vs_TEXCOORD3[];
					layout(location = 6) out vec4 hs_TEXCOORD3[];
					layout(location = 7) in vec4 vs_COLOR0[];
					layout(location = 7) out vec4 hs_COLOR0[];
					void passthrough_ctrl_points()
					{
					    hs_INTERNALTESSPOS0[gl_InvocationID] = vs_INTERNALTESSPOS0[gl_InvocationID];
					    hs_TANGENT0[gl_InvocationID] = vs_TANGENT0[gl_InvocationID];
					    hs_NORMAL0[gl_InvocationID] = vs_NORMAL0[gl_InvocationID];
					    hs_TEXCOORD0[gl_InvocationID] = vs_TEXCOORD0[gl_InvocationID];
					    hs_TEXCOORD1[gl_InvocationID] = vs_TEXCOORD1[gl_InvocationID];
					    hs_TEXCOORD2[gl_InvocationID] = vs_TEXCOORD2[gl_InvocationID];
					    hs_TEXCOORD3[gl_InvocationID] = vs_TEXCOORD3[gl_InvocationID];
					    hs_COLOR0[gl_InvocationID] = vs_COLOR0[gl_InvocationID];
					}
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat12;
					int u_xlati13;
					void fork_phase2(int phaseInstanceID)
					{
					    u_xlat0.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[1].yyy;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[1].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[1].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[1].www + u_xlat0.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[2].yyy;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[2].www + u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _ScreenParams.y;
					    u_xlat2.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlati13 = unity_StereoEyeIndex;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + (-unity_StereoWorldSpaceCameraPos[u_xlati13].xyz);
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat2.x = sqrt(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * _EdgeLength;
					    u_xlat12 = u_xlat12 / u_xlat2.x;
					    gl_TessLevelOuter[0] = max(u_xlat12, 1.0);
					    u_xlat2.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[0].yyy;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[0].www + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _ScreenParams.y;
					    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + (-unity_StereoWorldSpaceCameraPos[u_xlati13].xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * _EdgeLength;
					    u_xlat12 = u_xlat12 / u_xlat1.x;
					    gl_TessLevelOuter[1] = max(u_xlat12, 1.0);
					    u_xlat1.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _ScreenParams.y;
					    u_xlat4.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + (-unity_StereoWorldSpaceCameraPos[u_xlati13].xyz);
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * _EdgeLength;
					    u_xlat0.x = u_xlat0.x / u_xlat4.x;
					    gl_TessLevelOuter[2] = max(u_xlat0.x, 1.0);
					}
					void join_phase3(int phaseInstanceID)
					{
					    u_xlat0.x = gl_TessLevelOuter[2] + gl_TessLevelOuter[2];
					    u_xlat0.x = u_xlat0.x + gl_TessLevelOuter[2];
					    gl_TessLevelInner[0] = u_xlat0.x * 0.333333343;
					}
					void main()
					{
					    passthrough_ctrl_points();
					    barrier();
					    if (gl_InvocationID == 0)
					    {
					        fork_phase2(0);
					        join_phase3(0);
					    }
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!hs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(vertices=3) out;
					layout(binding = 0, std140) uniform HGlobals {
						vec4 unused_0_0[14];
						float _EdgeLength;
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(location = 0) in vec4 vs_INTERNALTESSPOS0[];
					layout(location = 0) out vec4 hs_INTERNALTESSPOS0[];
					layout(location = 1) in vec4 vs_TANGENT0[];
					layout(location = 1) out vec4 hs_TANGENT0[];
					layout(location = 2) in vec3 vs_NORMAL0[];
					layout(location = 2) out vec3 hs_NORMAL0[];
					layout(location = 3) in vec4 vs_TEXCOORD0[];
					layout(location = 3) out vec4 hs_TEXCOORD0[];
					layout(location = 4) in vec4 vs_TEXCOORD1[];
					layout(location = 4) out vec4 hs_TEXCOORD1[];
					layout(location = 5) in vec4 vs_TEXCOORD2[];
					layout(location = 5) out vec4 hs_TEXCOORD2[];
					layout(location = 6) in vec4 vs_TEXCOORD3[];
					layout(location = 6) out vec4 hs_TEXCOORD3[];
					layout(location = 7) in vec4 vs_COLOR0[];
					layout(location = 7) out vec4 hs_COLOR0[];
					void passthrough_ctrl_points()
					{
					    hs_INTERNALTESSPOS0[gl_InvocationID] = vs_INTERNALTESSPOS0[gl_InvocationID];
					    hs_TANGENT0[gl_InvocationID] = vs_TANGENT0[gl_InvocationID];
					    hs_NORMAL0[gl_InvocationID] = vs_NORMAL0[gl_InvocationID];
					    hs_TEXCOORD0[gl_InvocationID] = vs_TEXCOORD0[gl_InvocationID];
					    hs_TEXCOORD1[gl_InvocationID] = vs_TEXCOORD1[gl_InvocationID];
					    hs_TEXCOORD2[gl_InvocationID] = vs_TEXCOORD2[gl_InvocationID];
					    hs_TEXCOORD3[gl_InvocationID] = vs_TEXCOORD3[gl_InvocationID];
					    hs_COLOR0[gl_InvocationID] = vs_COLOR0[gl_InvocationID];
					}
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat12;
					float u_xlat13;
					void fork_phase2(int phaseInstanceID)
					{
					    u_xlat0.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[1].yyy;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[1].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[1].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[1].www + u_xlat0.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[2].yyy;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[2].www + u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + (-_WorldSpaceCameraPos.xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _EdgeLength;
					    u_xlat2.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = sqrt(u_xlat13);
					    u_xlat13 = u_xlat13 * _ScreenParams.y;
					    u_xlat12 = u_xlat13 / u_xlat12;
					    gl_TessLevelOuter[0] = max(u_xlat12, 1.0);
					    u_xlat2.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[0].yyy;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[0].www + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _ScreenParams.y;
					    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * _EdgeLength;
					    u_xlat12 = u_xlat12 / u_xlat1.x;
					    gl_TessLevelOuter[1] = max(u_xlat12, 1.0);
					    u_xlat1.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _ScreenParams.y;
					    u_xlat4.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + (-_WorldSpaceCameraPos.xyz);
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * _EdgeLength;
					    u_xlat0.x = u_xlat0.x / u_xlat4.x;
					    gl_TessLevelOuter[2] = max(u_xlat0.x, 1.0);
					}
					void join_phase3(int phaseInstanceID)
					{
					    u_xlat0.x = gl_TessLevelOuter[2] + gl_TessLevelOuter[2];
					    u_xlat0.x = u_xlat0.x + gl_TessLevelOuter[2];
					    gl_TessLevelInner[0] = u_xlat0.x * 0.333333343;
					}
					void main()
					{
					    passthrough_ctrl_points();
					    barrier();
					    if (gl_InvocationID == 0)
					    {
					        fork_phase2(0);
					        join_phase3(0);
					    }
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "UNITY_SINGLE_PASS_STEREO" }
					"!!hs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(vertices=3) out;
					layout(binding = 0, std140) uniform HGlobals {
						vec4 unused_0_0[14];
						float _EdgeLength;
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(binding = 3, std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(binding = 4, std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(location = 0) in vec4 vs_INTERNALTESSPOS0[];
					layout(location = 0) out vec4 hs_INTERNALTESSPOS0[];
					layout(location = 1) in vec4 vs_TANGENT0[];
					layout(location = 1) out vec4 hs_TANGENT0[];
					layout(location = 2) in vec3 vs_NORMAL0[];
					layout(location = 2) out vec3 hs_NORMAL0[];
					layout(location = 3) in vec4 vs_TEXCOORD0[];
					layout(location = 3) out vec4 hs_TEXCOORD0[];
					layout(location = 4) in vec4 vs_TEXCOORD1[];
					layout(location = 4) out vec4 hs_TEXCOORD1[];
					layout(location = 5) in vec4 vs_TEXCOORD2[];
					layout(location = 5) out vec4 hs_TEXCOORD2[];
					layout(location = 6) in vec4 vs_TEXCOORD3[];
					layout(location = 6) out vec4 hs_TEXCOORD3[];
					layout(location = 7) in vec4 vs_COLOR0[];
					layout(location = 7) out vec4 hs_COLOR0[];
					void passthrough_ctrl_points()
					{
					    hs_INTERNALTESSPOS0[gl_InvocationID] = vs_INTERNALTESSPOS0[gl_InvocationID];
					    hs_TANGENT0[gl_InvocationID] = vs_TANGENT0[gl_InvocationID];
					    hs_NORMAL0[gl_InvocationID] = vs_NORMAL0[gl_InvocationID];
					    hs_TEXCOORD0[gl_InvocationID] = vs_TEXCOORD0[gl_InvocationID];
					    hs_TEXCOORD1[gl_InvocationID] = vs_TEXCOORD1[gl_InvocationID];
					    hs_TEXCOORD2[gl_InvocationID] = vs_TEXCOORD2[gl_InvocationID];
					    hs_TEXCOORD3[gl_InvocationID] = vs_TEXCOORD3[gl_InvocationID];
					    hs_COLOR0[gl_InvocationID] = vs_COLOR0[gl_InvocationID];
					}
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat12;
					int u_xlati13;
					void fork_phase2(int phaseInstanceID)
					{
					    u_xlat0.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[1].yyy;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[1].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[1].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[1].www + u_xlat0.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[2].yyy;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[2].www + u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _ScreenParams.y;
					    u_xlat2.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlati13 = unity_StereoEyeIndex;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + (-unity_StereoWorldSpaceCameraPos[u_xlati13].xyz);
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat2.x = sqrt(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * _EdgeLength;
					    u_xlat12 = u_xlat12 / u_xlat2.x;
					    gl_TessLevelOuter[0] = max(u_xlat12, 1.0);
					    u_xlat2.xyz = unity_ObjectToWorld[1].xyz * vs_INTERNALTESSPOS0[0].yyy;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * vs_INTERNALTESSPOS0[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * vs_INTERNALTESSPOS0[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[3].xyz * vs_INTERNALTESSPOS0[0].www + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 * _ScreenParams.y;
					    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + (-unity_StereoWorldSpaceCameraPos[u_xlati13].xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * _EdgeLength;
					    u_xlat12 = u_xlat12 / u_xlat1.x;
					    gl_TessLevelOuter[1] = max(u_xlat12, 1.0);
					    u_xlat1.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _ScreenParams.y;
					    u_xlat4.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + (-unity_StereoWorldSpaceCameraPos[u_xlati13].xyz);
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * _EdgeLength;
					    u_xlat0.x = u_xlat0.x / u_xlat4.x;
					    gl_TessLevelOuter[2] = max(u_xlat0.x, 1.0);
					}
					void join_phase3(int phaseInstanceID)
					{
					    u_xlat0.x = gl_TessLevelOuter[2] + gl_TessLevelOuter[2];
					    u_xlat0.x = u_xlat0.x + gl_TessLevelOuter[2];
					    gl_TessLevelInner[0] = u_xlat0.x * 0.333333343;
					}
					void main()
					{
					    passthrough_ctrl_points();
					    barrier();
					    if (gl_InvocationID == 0)
					    {
					        fork_phase2(0);
					        join_phase3(0);
					    }
					}"
				}
			}
			Program "dp" {
				SubProgram "d3d11 " {
					Keywords { "POINT" }
					"!!ds_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(triangles) in;
					layout(binding = 0, std140) uniform DGlobals {
						vec4 unused_0_0[8];
						float _u;
						float _v;
						vec4 _Flamenoise_ST;
						float _Y_Mask;
						float _FlameHeight;
						vec4 unused_0_6[4];
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
					};
					layout(binding = 3, std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					layout(location = 4) uniform  sampler2D _FlameWave;
					layout(location = 5) uniform  sampler2D _Flamenoise;
					layout(location = 0) in  vec4 hs_INTERNALTESSPOS0 [];
					layout(location = 1) in  vec3 hs_NORMAL0 [];
					layout(location = 2) in  vec4 hs_TEXCOORD0 [];
					layout(location = 0) out vec3 ds_TEXCOORD0;
					layout(location = 1) out vec3 ds_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = gl_TessCoord.yy * hs_TEXCOORD0[1].xy;
					    u_xlat0.xy = hs_TEXCOORD0[0].xy * gl_TessCoord.xx + u_xlat0.xy;
					    u_xlat0.xy = hs_TEXCOORD0[2].xy * gl_TessCoord.zz + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy * _Flamenoise_ST.xy + _Flamenoise_ST.zw;
					    u_xlat0.xy = _Time.yy * vec2(_u, _v) + u_xlat0.xy;
					    u_xlat6 = textureLod(_FlameWave, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = textureLod(_Flamenoise, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.xyz = u_xlat0.xxx * unity_WorldToObject[1].xyz;
					    u_xlat1.xyz = gl_TessCoord.yyy * hs_NORMAL0[1].xyz;
					    u_xlat1.xyz = hs_NORMAL0[0].xyz * gl_TessCoord.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hs_NORMAL0[2].xyz * gl_TessCoord.zzz + u_xlat1.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.z = dot(u_xlat1.xyz, unity_WorldToObject[2].xyz);
					    u_xlat2.y = dot(u_xlat1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.x = (-u_xlat2.y) * u_xlat9 + _Y_Mask;
					    ds_TEXCOORD0.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    u_xlat9 = abs(u_xlat1.x) + (-_Y_Mask);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    u_xlat1 = gl_TessCoord.yyyy * hs_INTERNALTESSPOS0[1];
					    u_xlat1 = hs_INTERNALTESSPOS0[0] * gl_TessCoord.xxxx + u_xlat1;
					    u_xlat1 = hs_INTERNALTESSPOS0[2] * gl_TessCoord.zzzz + u_xlat1;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_FlameHeight, _FlameHeight, _FlameHeight)) + u_xlat1.xyz;
					    u_xlat2 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat0 + unity_ObjectToWorld[3];
					    ds_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "UNITY_SINGLE_PASS_STEREO" }
					"!!ds_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(triangles) in;
					layout(binding = 0, std140) uniform DGlobals {
						vec4 unused_0_0[8];
						float _u;
						float _v;
						vec4 _Flamenoise_ST;
						float _Y_Mask;
						float _FlameHeight;
						vec4 unused_0_6[4];
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
					};
					layout(binding = 3, std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_2[40];
					};
					layout(binding = 4, std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(location = 5) uniform  sampler2D _FlameWave;
					layout(location = 6) uniform  sampler2D _Flamenoise;
					layout(location = 0) in  vec4 hs_INTERNALTESSPOS0 [];
					layout(location = 1) in  vec3 hs_NORMAL0 [];
					layout(location = 2) in  vec4 hs_TEXCOORD0 [];
					layout(location = 0) out vec3 ds_TEXCOORD0;
					layout(location = 1) out vec3 ds_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = gl_TessCoord.yy * hs_TEXCOORD0[1].xy;
					    u_xlat0.xy = hs_TEXCOORD0[0].xy * gl_TessCoord.xx + u_xlat0.xy;
					    u_xlat0.xy = hs_TEXCOORD0[2].xy * gl_TessCoord.zz + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy * _Flamenoise_ST.xy + _Flamenoise_ST.zw;
					    u_xlat0.xy = _Time.yy * vec2(_u, _v) + u_xlat0.xy;
					    u_xlat6 = textureLod(_FlameWave, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = textureLod(_Flamenoise, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.xyz = u_xlat0.xxx * unity_WorldToObject[1].xyz;
					    u_xlat1.xyz = gl_TessCoord.yyy * hs_NORMAL0[1].xyz;
					    u_xlat1.xyz = hs_NORMAL0[0].xyz * gl_TessCoord.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hs_NORMAL0[2].xyz * gl_TessCoord.zzz + u_xlat1.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.z = dot(u_xlat1.xyz, unity_WorldToObject[2].xyz);
					    u_xlat2.y = dot(u_xlat1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.x = (-u_xlat2.y) * u_xlat9 + _Y_Mask;
					    ds_TEXCOORD0.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    u_xlat9 = abs(u_xlat1.x) + (-_Y_Mask);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    u_xlat1 = gl_TessCoord.yyyy * hs_INTERNALTESSPOS0[1];
					    u_xlat1 = hs_INTERNALTESSPOS0[0] * gl_TessCoord.xxxx + u_xlat1;
					    u_xlat1 = hs_INTERNALTESSPOS0[2] * gl_TessCoord.zzzz + u_xlat1;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_FlameHeight, _FlameHeight, _FlameHeight)) + u_xlat1.xyz;
					    u_xlat2 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat0 + unity_ObjectToWorld[3];
					    ds_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat0.xyz;
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat1 = u_xlat2.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat1 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat2.wwww + u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" }
					"!!ds_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(triangles) in;
					layout(binding = 0, std140) uniform DGlobals {
						vec4 unused_0_0[4];
						float _u;
						float _v;
						vec4 _Flamenoise_ST;
						float _Y_Mask;
						float _FlameHeight;
						vec4 unused_0_6[4];
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
					};
					layout(binding = 3, std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					layout(location = 4) uniform  sampler2D _FlameWave;
					layout(location = 5) uniform  sampler2D _Flamenoise;
					layout(location = 0) in  vec4 hs_INTERNALTESSPOS0 [];
					layout(location = 1) in  vec3 hs_NORMAL0 [];
					layout(location = 2) in  vec4 hs_TEXCOORD0 [];
					layout(location = 0) out vec3 ds_TEXCOORD0;
					layout(location = 1) out vec3 ds_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = gl_TessCoord.yy * hs_TEXCOORD0[1].xy;
					    u_xlat0.xy = hs_TEXCOORD0[0].xy * gl_TessCoord.xx + u_xlat0.xy;
					    u_xlat0.xy = hs_TEXCOORD0[2].xy * gl_TessCoord.zz + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy * _Flamenoise_ST.xy + _Flamenoise_ST.zw;
					    u_xlat0.xy = _Time.yy * vec2(_u, _v) + u_xlat0.xy;
					    u_xlat6 = textureLod(_FlameWave, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = textureLod(_Flamenoise, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.xyz = u_xlat0.xxx * unity_WorldToObject[1].xyz;
					    u_xlat1.xyz = gl_TessCoord.yyy * hs_NORMAL0[1].xyz;
					    u_xlat1.xyz = hs_NORMAL0[0].xyz * gl_TessCoord.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hs_NORMAL0[2].xyz * gl_TessCoord.zzz + u_xlat1.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.z = dot(u_xlat1.xyz, unity_WorldToObject[2].xyz);
					    u_xlat2.y = dot(u_xlat1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.x = (-u_xlat2.y) * u_xlat9 + _Y_Mask;
					    ds_TEXCOORD0.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    u_xlat9 = abs(u_xlat1.x) + (-_Y_Mask);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    u_xlat1 = gl_TessCoord.yyyy * hs_INTERNALTESSPOS0[1];
					    u_xlat1 = hs_INTERNALTESSPOS0[0] * gl_TessCoord.xxxx + u_xlat1;
					    u_xlat1 = hs_INTERNALTESSPOS0[2] * gl_TessCoord.zzzz + u_xlat1;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_FlameHeight, _FlameHeight, _FlameHeight)) + u_xlat1.xyz;
					    u_xlat2 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat0 + unity_ObjectToWorld[3];
					    ds_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "UNITY_SINGLE_PASS_STEREO" }
					"!!ds_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(triangles) in;
					layout(binding = 0, std140) uniform DGlobals {
						vec4 unused_0_0[4];
						float _u;
						float _v;
						vec4 _Flamenoise_ST;
						float _Y_Mask;
						float _FlameHeight;
						vec4 unused_0_6[4];
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
					};
					layout(binding = 3, std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_2[40];
					};
					layout(binding = 4, std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(location = 5) uniform  sampler2D _FlameWave;
					layout(location = 6) uniform  sampler2D _Flamenoise;
					layout(location = 0) in  vec4 hs_INTERNALTESSPOS0 [];
					layout(location = 1) in  vec3 hs_NORMAL0 [];
					layout(location = 2) in  vec4 hs_TEXCOORD0 [];
					layout(location = 0) out vec3 ds_TEXCOORD0;
					layout(location = 1) out vec3 ds_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = gl_TessCoord.yy * hs_TEXCOORD0[1].xy;
					    u_xlat0.xy = hs_TEXCOORD0[0].xy * gl_TessCoord.xx + u_xlat0.xy;
					    u_xlat0.xy = hs_TEXCOORD0[2].xy * gl_TessCoord.zz + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy * _Flamenoise_ST.xy + _Flamenoise_ST.zw;
					    u_xlat0.xy = _Time.yy * vec2(_u, _v) + u_xlat0.xy;
					    u_xlat6 = textureLod(_FlameWave, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = textureLod(_Flamenoise, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.xyz = u_xlat0.xxx * unity_WorldToObject[1].xyz;
					    u_xlat1.xyz = gl_TessCoord.yyy * hs_NORMAL0[1].xyz;
					    u_xlat1.xyz = hs_NORMAL0[0].xyz * gl_TessCoord.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hs_NORMAL0[2].xyz * gl_TessCoord.zzz + u_xlat1.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.z = dot(u_xlat1.xyz, unity_WorldToObject[2].xyz);
					    u_xlat2.y = dot(u_xlat1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.x = (-u_xlat2.y) * u_xlat9 + _Y_Mask;
					    ds_TEXCOORD0.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    u_xlat9 = abs(u_xlat1.x) + (-_Y_Mask);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    u_xlat1 = gl_TessCoord.yyyy * hs_INTERNALTESSPOS0[1];
					    u_xlat1 = hs_INTERNALTESSPOS0[0] * gl_TessCoord.xxxx + u_xlat1;
					    u_xlat1 = hs_INTERNALTESSPOS0[2] * gl_TessCoord.zzzz + u_xlat1;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_FlameHeight, _FlameHeight, _FlameHeight)) + u_xlat1.xyz;
					    u_xlat2 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat0 + unity_ObjectToWorld[3];
					    ds_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat0.xyz;
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat1 = u_xlat2.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat1 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat2.wwww + u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" }
					"!!ds_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(triangles) in;
					layout(binding = 0, std140) uniform DGlobals {
						vec4 unused_0_0[8];
						float _u;
						float _v;
						vec4 _Flamenoise_ST;
						float _Y_Mask;
						float _FlameHeight;
						vec4 unused_0_6[4];
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
					};
					layout(binding = 3, std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					layout(location = 4) uniform  sampler2D _FlameWave;
					layout(location = 5) uniform  sampler2D _Flamenoise;
					layout(location = 0) in  vec4 hs_INTERNALTESSPOS0 [];
					layout(location = 1) in  vec3 hs_NORMAL0 [];
					layout(location = 2) in  vec4 hs_TEXCOORD0 [];
					layout(location = 0) out vec3 ds_TEXCOORD0;
					layout(location = 1) out vec3 ds_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = gl_TessCoord.yy * hs_TEXCOORD0[1].xy;
					    u_xlat0.xy = hs_TEXCOORD0[0].xy * gl_TessCoord.xx + u_xlat0.xy;
					    u_xlat0.xy = hs_TEXCOORD0[2].xy * gl_TessCoord.zz + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy * _Flamenoise_ST.xy + _Flamenoise_ST.zw;
					    u_xlat0.xy = _Time.yy * vec2(_u, _v) + u_xlat0.xy;
					    u_xlat6 = textureLod(_FlameWave, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = textureLod(_Flamenoise, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.xyz = u_xlat0.xxx * unity_WorldToObject[1].xyz;
					    u_xlat1.xyz = gl_TessCoord.yyy * hs_NORMAL0[1].xyz;
					    u_xlat1.xyz = hs_NORMAL0[0].xyz * gl_TessCoord.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hs_NORMAL0[2].xyz * gl_TessCoord.zzz + u_xlat1.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.z = dot(u_xlat1.xyz, unity_WorldToObject[2].xyz);
					    u_xlat2.y = dot(u_xlat1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.x = (-u_xlat2.y) * u_xlat9 + _Y_Mask;
					    ds_TEXCOORD0.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    u_xlat9 = abs(u_xlat1.x) + (-_Y_Mask);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    u_xlat1 = gl_TessCoord.yyyy * hs_INTERNALTESSPOS0[1];
					    u_xlat1 = hs_INTERNALTESSPOS0[0] * gl_TessCoord.xxxx + u_xlat1;
					    u_xlat1 = hs_INTERNALTESSPOS0[2] * gl_TessCoord.zzzz + u_xlat1;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_FlameHeight, _FlameHeight, _FlameHeight)) + u_xlat1.xyz;
					    u_xlat2 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat0 + unity_ObjectToWorld[3];
					    ds_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "UNITY_SINGLE_PASS_STEREO" }
					"!!ds_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(triangles) in;
					layout(binding = 0, std140) uniform DGlobals {
						vec4 unused_0_0[8];
						float _u;
						float _v;
						vec4 _Flamenoise_ST;
						float _Y_Mask;
						float _FlameHeight;
						vec4 unused_0_6[4];
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
					};
					layout(binding = 3, std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_2[40];
					};
					layout(binding = 4, std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(location = 5) uniform  sampler2D _FlameWave;
					layout(location = 6) uniform  sampler2D _Flamenoise;
					layout(location = 0) in  vec4 hs_INTERNALTESSPOS0 [];
					layout(location = 1) in  vec3 hs_NORMAL0 [];
					layout(location = 2) in  vec4 hs_TEXCOORD0 [];
					layout(location = 0) out vec3 ds_TEXCOORD0;
					layout(location = 1) out vec3 ds_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = gl_TessCoord.yy * hs_TEXCOORD0[1].xy;
					    u_xlat0.xy = hs_TEXCOORD0[0].xy * gl_TessCoord.xx + u_xlat0.xy;
					    u_xlat0.xy = hs_TEXCOORD0[2].xy * gl_TessCoord.zz + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy * _Flamenoise_ST.xy + _Flamenoise_ST.zw;
					    u_xlat0.xy = _Time.yy * vec2(_u, _v) + u_xlat0.xy;
					    u_xlat6 = textureLod(_FlameWave, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = textureLod(_Flamenoise, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.xyz = u_xlat0.xxx * unity_WorldToObject[1].xyz;
					    u_xlat1.xyz = gl_TessCoord.yyy * hs_NORMAL0[1].xyz;
					    u_xlat1.xyz = hs_NORMAL0[0].xyz * gl_TessCoord.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hs_NORMAL0[2].xyz * gl_TessCoord.zzz + u_xlat1.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.z = dot(u_xlat1.xyz, unity_WorldToObject[2].xyz);
					    u_xlat2.y = dot(u_xlat1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.x = (-u_xlat2.y) * u_xlat9 + _Y_Mask;
					    ds_TEXCOORD0.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    u_xlat9 = abs(u_xlat1.x) + (-_Y_Mask);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    u_xlat1 = gl_TessCoord.yyyy * hs_INTERNALTESSPOS0[1];
					    u_xlat1 = hs_INTERNALTESSPOS0[0] * gl_TessCoord.xxxx + u_xlat1;
					    u_xlat1 = hs_INTERNALTESSPOS0[2] * gl_TessCoord.zzzz + u_xlat1;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_FlameHeight, _FlameHeight, _FlameHeight)) + u_xlat1.xyz;
					    u_xlat2 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat0 + unity_ObjectToWorld[3];
					    ds_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat0.xyz;
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat1 = u_xlat2.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat1 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat2.wwww + u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" }
					"!!ds_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(triangles) in;
					layout(binding = 0, std140) uniform DGlobals {
						vec4 unused_0_0[8];
						float _u;
						float _v;
						vec4 _Flamenoise_ST;
						float _Y_Mask;
						float _FlameHeight;
						vec4 unused_0_6[4];
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
					};
					layout(binding = 3, std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					layout(location = 4) uniform  sampler2D _FlameWave;
					layout(location = 5) uniform  sampler2D _Flamenoise;
					layout(location = 0) in  vec4 hs_INTERNALTESSPOS0 [];
					layout(location = 1) in  vec3 hs_NORMAL0 [];
					layout(location = 2) in  vec4 hs_TEXCOORD0 [];
					layout(location = 0) out vec3 ds_TEXCOORD0;
					layout(location = 1) out vec3 ds_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = gl_TessCoord.yy * hs_TEXCOORD0[1].xy;
					    u_xlat0.xy = hs_TEXCOORD0[0].xy * gl_TessCoord.xx + u_xlat0.xy;
					    u_xlat0.xy = hs_TEXCOORD0[2].xy * gl_TessCoord.zz + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy * _Flamenoise_ST.xy + _Flamenoise_ST.zw;
					    u_xlat0.xy = _Time.yy * vec2(_u, _v) + u_xlat0.xy;
					    u_xlat6 = textureLod(_FlameWave, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = textureLod(_Flamenoise, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.xyz = u_xlat0.xxx * unity_WorldToObject[1].xyz;
					    u_xlat1.xyz = gl_TessCoord.yyy * hs_NORMAL0[1].xyz;
					    u_xlat1.xyz = hs_NORMAL0[0].xyz * gl_TessCoord.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hs_NORMAL0[2].xyz * gl_TessCoord.zzz + u_xlat1.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.z = dot(u_xlat1.xyz, unity_WorldToObject[2].xyz);
					    u_xlat2.y = dot(u_xlat1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.x = (-u_xlat2.y) * u_xlat9 + _Y_Mask;
					    ds_TEXCOORD0.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    u_xlat9 = abs(u_xlat1.x) + (-_Y_Mask);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    u_xlat1 = gl_TessCoord.yyyy * hs_INTERNALTESSPOS0[1];
					    u_xlat1 = hs_INTERNALTESSPOS0[0] * gl_TessCoord.xxxx + u_xlat1;
					    u_xlat1 = hs_INTERNALTESSPOS0[2] * gl_TessCoord.zzzz + u_xlat1;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_FlameHeight, _FlameHeight, _FlameHeight)) + u_xlat1.xyz;
					    u_xlat2 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat0 + unity_ObjectToWorld[3];
					    ds_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "UNITY_SINGLE_PASS_STEREO" }
					"!!ds_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(triangles) in;
					layout(binding = 0, std140) uniform DGlobals {
						vec4 unused_0_0[8];
						float _u;
						float _v;
						vec4 _Flamenoise_ST;
						float _Y_Mask;
						float _FlameHeight;
						vec4 unused_0_6[4];
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
					};
					layout(binding = 3, std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_2[40];
					};
					layout(binding = 4, std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(location = 5) uniform  sampler2D _FlameWave;
					layout(location = 6) uniform  sampler2D _Flamenoise;
					layout(location = 0) in  vec4 hs_INTERNALTESSPOS0 [];
					layout(location = 1) in  vec3 hs_NORMAL0 [];
					layout(location = 2) in  vec4 hs_TEXCOORD0 [];
					layout(location = 0) out vec3 ds_TEXCOORD0;
					layout(location = 1) out vec3 ds_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = gl_TessCoord.yy * hs_TEXCOORD0[1].xy;
					    u_xlat0.xy = hs_TEXCOORD0[0].xy * gl_TessCoord.xx + u_xlat0.xy;
					    u_xlat0.xy = hs_TEXCOORD0[2].xy * gl_TessCoord.zz + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy * _Flamenoise_ST.xy + _Flamenoise_ST.zw;
					    u_xlat0.xy = _Time.yy * vec2(_u, _v) + u_xlat0.xy;
					    u_xlat6 = textureLod(_FlameWave, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = textureLod(_Flamenoise, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.xyz = u_xlat0.xxx * unity_WorldToObject[1].xyz;
					    u_xlat1.xyz = gl_TessCoord.yyy * hs_NORMAL0[1].xyz;
					    u_xlat1.xyz = hs_NORMAL0[0].xyz * gl_TessCoord.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hs_NORMAL0[2].xyz * gl_TessCoord.zzz + u_xlat1.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.z = dot(u_xlat1.xyz, unity_WorldToObject[2].xyz);
					    u_xlat2.y = dot(u_xlat1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.x = (-u_xlat2.y) * u_xlat9 + _Y_Mask;
					    ds_TEXCOORD0.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    u_xlat9 = abs(u_xlat1.x) + (-_Y_Mask);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    u_xlat1 = gl_TessCoord.yyyy * hs_INTERNALTESSPOS0[1];
					    u_xlat1 = hs_INTERNALTESSPOS0[0] * gl_TessCoord.xxxx + u_xlat1;
					    u_xlat1 = hs_INTERNALTESSPOS0[2] * gl_TessCoord.zzzz + u_xlat1;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_FlameHeight, _FlameHeight, _FlameHeight)) + u_xlat1.xyz;
					    u_xlat2 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat0 + unity_ObjectToWorld[3];
					    ds_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat0.xyz;
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat1 = u_xlat2.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat1 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat2.wwww + u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!ds_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(triangles) in;
					layout(binding = 0, std140) uniform DGlobals {
						vec4 unused_0_0[8];
						float _u;
						float _v;
						vec4 _Flamenoise_ST;
						float _Y_Mask;
						float _FlameHeight;
						vec4 unused_0_6[4];
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
					};
					layout(binding = 3, std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					layout(location = 4) uniform  sampler2D _FlameWave;
					layout(location = 5) uniform  sampler2D _Flamenoise;
					layout(location = 0) in  vec4 hs_INTERNALTESSPOS0 [];
					layout(location = 1) in  vec3 hs_NORMAL0 [];
					layout(location = 2) in  vec4 hs_TEXCOORD0 [];
					layout(location = 0) out vec3 ds_TEXCOORD0;
					layout(location = 1) out vec3 ds_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = gl_TessCoord.yy * hs_TEXCOORD0[1].xy;
					    u_xlat0.xy = hs_TEXCOORD0[0].xy * gl_TessCoord.xx + u_xlat0.xy;
					    u_xlat0.xy = hs_TEXCOORD0[2].xy * gl_TessCoord.zz + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy * _Flamenoise_ST.xy + _Flamenoise_ST.zw;
					    u_xlat0.xy = _Time.yy * vec2(_u, _v) + u_xlat0.xy;
					    u_xlat6 = textureLod(_FlameWave, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = textureLod(_Flamenoise, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.xyz = u_xlat0.xxx * unity_WorldToObject[1].xyz;
					    u_xlat1.xyz = gl_TessCoord.yyy * hs_NORMAL0[1].xyz;
					    u_xlat1.xyz = hs_NORMAL0[0].xyz * gl_TessCoord.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hs_NORMAL0[2].xyz * gl_TessCoord.zzz + u_xlat1.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.z = dot(u_xlat1.xyz, unity_WorldToObject[2].xyz);
					    u_xlat2.y = dot(u_xlat1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.x = (-u_xlat2.y) * u_xlat9 + _Y_Mask;
					    ds_TEXCOORD0.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    u_xlat9 = abs(u_xlat1.x) + (-_Y_Mask);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    u_xlat1 = gl_TessCoord.yyyy * hs_INTERNALTESSPOS0[1];
					    u_xlat1 = hs_INTERNALTESSPOS0[0] * gl_TessCoord.xxxx + u_xlat1;
					    u_xlat1 = hs_INTERNALTESSPOS0[2] * gl_TessCoord.zzzz + u_xlat1;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_FlameHeight, _FlameHeight, _FlameHeight)) + u_xlat1.xyz;
					    u_xlat2 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat0 + unity_ObjectToWorld[3];
					    ds_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "UNITY_SINGLE_PASS_STEREO" }
					"!!ds_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(triangles) in;
					layout(binding = 0, std140) uniform DGlobals {
						vec4 unused_0_0[8];
						float _u;
						float _v;
						vec4 _Flamenoise_ST;
						float _Y_Mask;
						float _FlameHeight;
						vec4 unused_0_6[4];
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(binding = 2, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
					};
					layout(binding = 3, std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_2[40];
					};
					layout(binding = 4, std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					layout(location = 5) uniform  sampler2D _FlameWave;
					layout(location = 6) uniform  sampler2D _Flamenoise;
					layout(location = 0) in  vec4 hs_INTERNALTESSPOS0 [];
					layout(location = 1) in  vec3 hs_NORMAL0 [];
					layout(location = 2) in  vec4 hs_TEXCOORD0 [];
					layout(location = 0) out vec3 ds_TEXCOORD0;
					layout(location = 1) out vec3 ds_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = gl_TessCoord.yy * hs_TEXCOORD0[1].xy;
					    u_xlat0.xy = hs_TEXCOORD0[0].xy * gl_TessCoord.xx + u_xlat0.xy;
					    u_xlat0.xy = hs_TEXCOORD0[2].xy * gl_TessCoord.zz + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy * _Flamenoise_ST.xy + _Flamenoise_ST.zw;
					    u_xlat0.xy = _Time.yy * vec2(_u, _v) + u_xlat0.xy;
					    u_xlat6 = textureLod(_FlameWave, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = textureLod(_Flamenoise, u_xlat0.xy, 0.0).x;
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.xyz = u_xlat0.xxx * unity_WorldToObject[1].xyz;
					    u_xlat1.xyz = gl_TessCoord.yyy * hs_NORMAL0[1].xyz;
					    u_xlat1.xyz = hs_NORMAL0[0].xyz * gl_TessCoord.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hs_NORMAL0[2].xyz * gl_TessCoord.zzz + u_xlat1.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.z = dot(u_xlat1.xyz, unity_WorldToObject[2].xyz);
					    u_xlat2.y = dot(u_xlat1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.x = (-u_xlat2.y) * u_xlat9 + _Y_Mask;
					    ds_TEXCOORD0.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    u_xlat9 = abs(u_xlat1.x) + (-_Y_Mask);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    u_xlat1 = gl_TessCoord.yyyy * hs_INTERNALTESSPOS0[1];
					    u_xlat1 = hs_INTERNALTESSPOS0[0] * gl_TessCoord.xxxx + u_xlat1;
					    u_xlat1 = hs_INTERNALTESSPOS0[2] * gl_TessCoord.zzzz + u_xlat1;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_FlameHeight, _FlameHeight, _FlameHeight)) + u_xlat1.xyz;
					    u_xlat2 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat0 = unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat0 + unity_ObjectToWorld[3];
					    ds_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat0.xyz;
					    u_xlati0 = unity_StereoEyeIndex << 2;
					    u_xlat1 = u_xlat2.yyyy * unity_StereoMatrixVP[(u_xlati0 + 1) / 4][(u_xlati0 + 1) % 4];
					    u_xlat1 = unity_StereoMatrixVP[u_xlati0 / 4][u_xlati0 % 4] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = unity_StereoMatrixVP[(u_xlati0 + 2) / 4][(u_xlati0 + 2) % 4] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = unity_StereoMatrixVP[(u_xlati0 + 3) / 4][(u_xlati0 + 3) % 4] * u_xlat2.wwww + u_xlat1;
					    return;
					}"
				}
			}
		}
	}
	CustomEditor "ASEMaterialInspector"
}