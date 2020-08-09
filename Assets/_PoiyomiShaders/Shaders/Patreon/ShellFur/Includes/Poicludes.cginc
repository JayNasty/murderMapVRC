#ifndef POICLUDES
    #define POICLUDES
    
    #include "PoiData.cginc"
    #include "UnityCG.cginc"
    #include "Lighting.cginc"
    #include "UnityPBSLighting.cginc"
    #include "AutoLight.cginc"
    
    //Structs
    struct appdata
    {
        float4 vertex: POSITION;
        float3 normal: NORMAL;
        float4 tangent: TANGENT;
        float2 texcoord: TEXCOORD0;
        float2 texcoord1: TEXCOORD1;
        UNITY_VERTEX_INPUT_INSTANCE_ID
    };
    
    struct v2f
    {
        float2 uv: TEXCOORD0;
        float4 pos: SV_POSITION;
        float3 normal: TEXCOORD1;
        float3 worldPos: TEXCOORD2;
        float3 localPos: TEXCOORD3;
        float furAlpha: TEXCOORD4;
        UNITY_VERTEX_INPUT_INSTANCE_ID
        UNITY_VERTEX_OUTPUT_STEREO
        UNITY_FOG_COORDS(5)
    };
    
    static PoiLight poiLight;
    float3 baseNormal;
    #define pi float(3.14159265359)

#endif
