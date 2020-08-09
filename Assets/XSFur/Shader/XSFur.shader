// Upgrade NOTE: replaced tex2D unity_Lightmap with UNITY_SAMPLE_TEX2D

Shader "Xiexe/XSFur" {
    Properties {
        [Header(Base Layer Settings)]
            _MainTex ("Main Texture", 2D) = "white" {}
            _Color ("Skin Tint", Color) = (1,1,1,1) 
            _RampSkin ("Skin Ramp", 2D) = "white" {}

        [Space(8)]
        [Header(Fur Settings)]
            [Enum(UV1, 0, UV2, 1)] _UVSet("UV Channel", Int) = 0
            _furTex ("Fur Texture", 2D) = "white" {}
            _Color2 ("Fur Tint", Color) = (1,1,1,1)
            _Color3 ("Undercoat Tint", Color) = (0,0,0,1)
            _RampFur ("Fur Ramp", 2D) = "white" {}
            [NoScaleOffset]_CutoutMap("Fur Pattern (Noise)", 2D) = "white" {}
            _lengthMask ("Length Mask", 2D) = "white" {}
            [IntRange]_layers ("Fur Layers", range(1,16)) = 10
            _offset ("Fur Length", range(0, 0.01)) = 0.0014
            _Cutout ("Fur Density", range(0.01,.5)) = 0.15
            _density ("Strand Amount", range(1, 200)) = 10
            _x("X Comb", range(-1, 1)) = 0
            _y("Y Comb", range(-1, 1)) = 0
            _Reflectance("Reflectance", range(0,1)) = 0
            _smoothness ("Smoothness", range(0,1)) = 0
            _gravity ("Gravity", range(0,1)) = 0

        [Space(8)]
        [Header(Emission)]
            _Emission ("Skin Emission Texture", 2D) = "white" {}
            [HDR]_EmissionColor ("Skin Emission Color", Color) = (0,0,0,0) 
            _Emission2 ("Fur Emission Texture", 2D) = "white" {}
            [HDR]_EmissionColor2 ("Fur Emission Color", Color) = (0,0,0,0) 

        [Space(8)]
        [Header(Light Settings)]
            _furOcclusionStrength("Occlusion Strength", range(0,1)) = 1
            [Toggle] _fakeLight ("Use Fake Light Only", Int) = 0
            _fakeLightDir ("Fake Light Direction", Vector) = (0,0,0,1)

    }
    SubShader 
    {        
        Pass
        {
            Tags{"LightMode" = "ForwardBase" "Queue"="AlphaTest"}
            Cull Off
            AlphaToMask On

            CGPROGRAM
            #pragma exclude_renderers d3d11 gles
            #pragma vertex vert
            #pragma fragment frag
            #pragma geometry geom

            #ifndef UNITY_PASS_FORWARDBASE
                #define UNITY_PASS_FORWARDBASE
            #endif
            
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d11 glcore gles
            #pragma target 5.0

            //properties/structs are in helper functions cginc
            #include "XSFHelperFunctions.cginc"
            #include "XSFGeometry.cginc"
            #include "XSFLighting.cginc"
            #include "XSFVertFrag.cginc"
            
            ENDCG
        }
        
        Pass
        { 
            Tags{"LightMode" = "ForwardAdd" "Queue"="AlphaTest"}
            Blend One One
            Cull Off
            AlphaToMask On
            ZWrite Off

            CGPROGRAM
            #pragma exclude_renderers d3d11 gles
            #pragma vertex vert
            #pragma fragment frag
            #pragma geometry geom

            #ifndef UNITY_PASS_FORWARDADD
                #define UNITY_PASS_FORWARDADD
            #endif

            #pragma multi_compile_fwdadd_fullshadows
            #pragma only_renderers d3d11 glcore gles
            #pragma target 5.0

            //properties/structs are in helper functions cginc
            #include "XSFHelperFunctions.cginc"
            #include "XSFGeometry.cginc"
            #include "XSFLighting.cginc"
            #include "XSFVertFrag.cginc"
            
            ENDCG
        }
    
        Pass
        { 
            Tags{"LightMode" = "ShadowCaster" "Queue"="AlphaTest"}

            CGPROGRAM
            #pragma exclude_renderers d3d11 gles
            #pragma vertex vert
            #pragma fragment frag
            #pragma geometry geom

            #ifndef UNITY_PASS_SHADOWCASTER
                #define UNITY_PASS_SHADOWCASTER
            #endif

            #pragma multi_compile_fwdadd_fullshadows
            #pragma only_renderers d3d11 glcore gles
            #pragma target 5.0

            //properties/structs are in helper functions cginc
            #include "XSFHelperFunctions.cginc"
            #include "XSFGeometry.cginc"
            #include "XSFLighting.cginc"
            #include "XSFVertFrag.cginc"
            
            ENDCG
        }
    }
}