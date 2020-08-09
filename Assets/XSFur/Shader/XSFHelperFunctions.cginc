#include "UnityPBSLighting.cginc"
#include "AutoLight.cginc"
#include "UnityCG.cginc"

struct VertexInput {
    float4 vertex : POSITION;
    float3 normal : NORMAL;
    float2 uv : TEXCOORD0;
    float2 uv1 : TEXCOORD1;
    float4 color : COLOR;
};

struct VertexOutput {
    float4 vertex : SV_POSITION;
    float3 normal : NORMAL;
    float2 uv : TEXCOORD1;
    float2 uv1 : TEXCOORD2;
    float4 worldPos: TEXCOORD3;
    float4 color : TEXCOORD4;
};

struct g2f
{
    float4 pos : SV_POSITION;
    float3 normal : NORMAL; 
    float2 uv : TEXCOORD1;
    float2 uv1 : TEXCOORD2;
    float2 furUV : TEXCOORD3;
    float4 worldPos : TEXCOORD4;
    float4 multiOutput : TEXCOORD5;
    SHADOW_COORDS(6)
};

sampler2D _MainTex;
float4 _MainTex_ST;
sampler2D _CutoutMap;
float4 _CutoutMap_ST;
sampler2D _lengthMask;
float4 _lengthMask_ST;
sampler2D _furTex;
float4 _furTex_ST;
sampler2D _Emission;
float4 _Emission_ST;
sampler2D _Emission2;
float4 _Emission2_ST;
sampler2D _RampFur;
sampler2D _RampSkin;

float4 _Color;
float3 _Color2;
float3 _Color3;
float4 _EmissionColor;
float4 _EmissionColor2;
float4 _fakeLightDir;

int _fakeLight;
int _useRampColor;
int _UVSet;
int _UseLightmap;

float _offset;
float _layers;
float _Cutout;
float _offsetLayers;
float _density;
float _patternIntensity;
float _smoothness;
float _Reflectance;
float _x;
float _y;
float _gravity;
float _furOcclusionStrength;
float _LightmapStrength;

//Start Helper Functions
float3 getStereoCamPos()
{
    #if UNITY_SINGLE_PASS_STEREO
        float3 cameraPos = float3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5); 
    #else
        float3 cameraPos = _WorldSpaceCameraPos;
    #endif

    return cameraPos;
}