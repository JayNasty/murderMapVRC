#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_instancing
#include "UnityCG.cginc"
#include "Lighting.cginc"

struct appdata
{
    float4 vertex: POSITION;
    float4 color: COLOR;
    float2 texcoord: TEXCOORD0;
    uint id: SV_VertexID;
    UNITY_VERTEX_INPUT_INSTANCE_ID
};

struct v2g
{
    float4 pos: SV_POSITION;
    float2 uv: TEXCOORD0;
    float4 worldPos: TEXCOORD1;
    uint vid: TEXCOORD2;
    UNITY_VERTEX_INPUT_INSTANCE_ID
    UNITY_VERTEX_OUTPUT_STEREO
}; 

struct g2f
{
    float4 pos: SV_POSITION;
    float2 uv: TEXCOORD0;
    uint TimeOffset: TEXCOORD2;
    float4 DebugData: TEXCOORD3;
    float Alpha: TEXCOORD4;
    float4 screenUV: TEXCOORD5;
    UNITY_VERTEX_INPUT_INSTANCE_ID
    UNITY_VERTEX_OUTPUT_STEREO
};

float random(float2 vids)
{
    return frac(sin(dot(vids, float2(12.9898, 78.2383))) * 43758.5453123);
}

sampler2D _CameraDepthTexture;
sampler2D _ParticleMask;
float4 _ParticleColor;
uint _ParticleMovementMode;
float _ParticleScaleMin, _ParticleScaleMax;
float _ParticleSphericalMinSpeed, _ParticleSphericalMaxSpeed;
float _ParticleSphericalMinRadius, _ParticleSphericalMaxRadius;
float _ParticleRandomTimeOffset;
float _ParticlePerCMSquared;
float _ParticleMinRenderDistance;
float _ParticleRandomRotation;
float _ParticleRotation;
// Linear Movement
float3 _ParticleLinearEndOffsetMin;
float3 _ParticleLinearEndOffsetMax;
float _ParticleLinearSpeedMin;
float _ParticleLinearSpeedMax;
float _ParticleLinearStartAlpha ;
float _ParticleLinearEndAlpha;
float _ParticleLinearStartSizeMin;
float _ParticleLinearStartSizeMax;
float _ParticleLinearEndSizeMin;
float _ParticleLinearEndsizeMax;
float _ParticleLinearNormalRange;
float _ParticleFlipParticlesGoingInward;
v2g particleVert(appdata v)
{
    v2g o;
    UNITY_SETUP_INSTANCE_ID(v);
    UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
    UNITY_TRANSFER_INSTANCE_ID(v, o);
    o.pos = UnityObjectToClipPos(v.vertex);
    o.worldPos = mul(unity_ObjectToWorld, v.vertex);
    o.uv = v.texcoord.xy;
    o.vid = v.id;
    return o;
}

void calculateParticleData(float4 startPos, float3 vid, float randomA, float randomB, float randomC, float randomD,
inout float4 offset, inout float scale, inout float opacity, inout float randomRotation, inout float loopAlpha)
{
    UNITY_BRANCH
    if (_ParticleMovementMode == 0) //spherical
    {
        float3 vroom = float3(lerp(_ParticleSphericalMinSpeed, _ParticleSphericalMaxSpeed, randomA), lerp(_ParticleSphericalMinSpeed, _ParticleSphericalMaxSpeed, randomB), lerp(_ParticleSphericalMinSpeed, _ParticleSphericalMaxSpeed, randomC));
        scale = lerp(_ParticleScaleMin, _ParticleScaleMax, randomC);
        offset.x = sin(_Time.x * vroom.x) * lerp(_ParticleSphericalMinRadius, _ParticleSphericalMaxRadius, randomA);
        offset.y = sin(_Time.x * vroom.y) * lerp(_ParticleSphericalMinRadius, _ParticleSphericalMaxRadius, randomB);
        offset.z = sin(_Time.x * vroom.z) * lerp(_ParticleSphericalMinRadius, _ParticleSphericalMaxRadius, randomC);
        offset.w = 0;
    }
    else
    {
        float speed = lerp(_ParticleLinearSpeedMin, _ParticleLinearSpeedMax, randomD);
        float alpha = (_Time.x + randomD) * speed;
        float randomPerLoop = random(float2(ceil(alpha), ceil(alpha)));
        randomRotation = (randomPerLoop) * 6.28318530718;
        alpha = frac(alpha);
        loopAlpha = alpha;
        offset = float4(lerp(0, float3(
            lerp(_ParticleLinearEndOffsetMin.x, _ParticleLinearEndOffsetMax.x, randomA),
            lerp(_ParticleLinearEndOffsetMin.y, _ParticleLinearEndOffsetMax.y, randomB),
            lerp(_ParticleLinearEndOffsetMin.z, _ParticleLinearEndOffsetMax.z, randomC)
        ), alpha), 0);
        float scaleStart = lerp(_ParticleLinearStartSizeMin, _ParticleLinearStartSizeMax, randomC);
        float scaleEnd = lerp(_ParticleLinearEndSizeMin, _ParticleLinearEndsizeMax, randomD);
        scale = lerp(scaleStart, scaleEnd, alpha);
        opacity = saturate(lerp(_ParticleLinearStartAlpha, _ParticleLinearEndAlpha, alpha));
    }
}

float ComputePolygonArea(float3 p1, float3 p2, float3 p3)
{
    return length(cross(p2 - p1, p3 - p1)) / 2;
}

bool IsInMirror()
{
    return unity_CameraProjection[2][0] != 0.f || unity_CameraProjection[2][1] != 0.f;
}

float4x4 poiAngleAxisRotationMatrix(float angle, float3 axis)
{
    axis = normalize(axis);
    float s = sin(angle);
    float c = cos(angle);
    float oc = 1.0 - c;
    
    return float4x4(oc * axis.x * axis.x + c, oc * axis.x * axis.y - axis.z * s, oc * axis.z * axis.x + axis.y * s, 0.0,
    oc * axis.x * axis.y + axis.z * s, oc * axis.y * axis.y + c, oc * axis.y * axis.z - axis.x * s, 0.0,
    oc * axis.z * axis.x - axis.y * s, oc * axis.y * axis.z + axis.x * s, oc * axis.z * axis.z + c, 0.0,
    0.0, 0.0, 0.0, 1.0);
}

[maxvertexcount(60)]
void particleGeom(triangle v2g IN[3], inout TriangleStream < g2f > tristream)
{
    float3 polySideA = IN[1].worldPos.xyz - IN[0].worldPos.xyz;
    float3 polySideB = IN[2].worldPos.xyz - IN[0].worldPos.xyz;
    float3 c = cross(polySideA, polySideB);
    float3 outDir = normalize(c);
    float4 center = (IN[0].worldPos + IN[1].worldPos + IN[2].worldPos) / 3;
    
    if (_ParticleMovementMode == 1)
    {
        float3 direction = normalize((center.xyz + lerp(_ParticleLinearEndOffsetMin, _ParticleLinearEndOffsetMax, .5).rgb) - center.xyz);
        if(dot(outDir, direction) <= _ParticleLinearNormalRange)
        {
            return;
        }
    }
    
    g2f milk[4];
    
    if(IsInMirror())
    {
        milk[0].uv = float2(0, 1);
        milk[1].uv = float2(0, 0);
        milk[2].uv = float2(1, 0);
        milk[3].uv = float2(1, 1);
    }
    else
    {
        milk[0].uv = float2(0, 0);
        milk[1].uv = float2(0, 1);
        milk[2].uv = float2(1, 1);
        milk[3].uv = float2(1, 0);
    }
    
    float areaOfPolygonCM = ComputePolygonArea(IN[0].worldPos, IN[1].worldPos, IN[2].worldPos) * 10000; // 100000 square cm in 1 square m
    float randomlySpawnedParticle = 0;
    if (areaOfPolygonCM < 1 / _ParticlePerCMSquared)
    {
        randomlySpawnedParticle = random(float2(IN[0].vid, IN[1].vid)) < areaOfPolygonCM / (1 / _ParticlePerCMSquared);
    }
    
    float numberOfParticles = clamp(floor(areaOfPolygonCM * _ParticlePerCMSquared + .05) + randomlySpawnedParticle, 0, 10);
    
    numberOfParticles *= tex2Dlod(_ParticleMask, float4((IN[0].uv + IN[1].uv + IN[2].uv) / 3, 0, 0)).r;
    
    for (int index = 0; index < 4; index ++)
    {
        milk[index].DebugData = 0;
        milk[index].DebugData.x = randomlySpawnedParticle;
        milk[index].DebugData.y = randomlySpawnedParticle;
        milk[index].DebugData.z = random(float2(IN[0].vid, IN[1].vid));
        milk[index].DebugData.w = randomlySpawnedParticle;
        
        milk[index].Alpha = 1;
    }
    
    
    for (int index = 0; index < numberOfParticles; index ++)
    {
        float randomValueA = random(float2(IN[0].vid + index * IN[2].vid, IN[2].vid + index * IN[0].vid));
        float randomValueB = random(float2(IN[1].vid + index * IN[2].vid, IN[1].vid + index * IN[0].vid));
        float randomValueC = random(float2(IN[2].vid + index * IN[2].vid, IN[0].vid + index * IN[0].vid));
        float randomValueD = random(float2(IN[1].vid + index * IN[2].vid, IN[0].vid + index * (IN[1].vid + IN[2].vid)));
        float randomRotation = randomValueD * 6.28318530718;
        float scale = 1;
        float4 offset = 0;
        float opacity = 1;
        float loopAlpha = 0;
        
        calculateParticleData(center, float3(IN[0].vid, IN[1].vid, IN[2].vid),
        randomValueA, randomValueB, randomValueC, randomValueD, offset, scale, opacity, randomRotation, loopAlpha);
        
        
        milk[0].DebugData = float4(loopAlpha, randomValueB, randomValueC, randomValueD);
        milk[1].DebugData = float4(loopAlpha, randomValueB, randomValueC, randomValueD);
        milk[2].DebugData = float4(loopAlpha, randomValueB, randomValueC, randomValueD);
        milk[3].DebugData = float4(loopAlpha, randomValueB, randomValueC, randomValueD);
        
        UNITY_BRANCH
        if(_ParticleFlipParticlesGoingInward && _ParticleMovementMode == 1)
        {
            float3 offsetdirection = (center + offset).xyz - center.xyz;
            if(dot(offsetdirection, outDir) <= 0)
            {
                offset *= -1;
            }
        }
        
        float4 forwardVector = float4(normalize((center + offset) - _WorldSpaceCameraPos), 0);
        float4 rightVector = float4(-UNITY_MATRIX_V[0].xyz, 0);
        rightVector.xyz = mul(poiAngleAxisRotationMatrix(_ParticleRandomRotation ? randomRotation: radians(_ParticleRotation), forwardVector), rightVector);
        float4 upVector = float4(cross(forwardVector, rightVector), 0);
        
        milk[0].Alpha = opacity;
        milk[1].Alpha = opacity;
        milk[2].Alpha = opacity;
        milk[3].Alpha = opacity;
        
        float timeOffset = _ParticleRandomTimeOffset ? lerp(0, 1000, randomValueA): 0;
        
        milk[0].TimeOffset = timeOffset;
        milk[1].TimeOffset = timeOffset;
        milk[2].TimeOffset = timeOffset;
        milk[3].TimeOffset = timeOffset;
        
        if(randomValueA + randomValueB >= 1)
        {
            randomValueA = 1 - randomValueA;
            randomValueB = 1 - randomValueB;
        }
        
        float4 positionInPolygon = float4(IN[0].worldPos.xyz + (polySideA * randomValueA) + (polySideB * randomValueB), 1) + offset;
        
        milk[0].pos = UnityObjectToClipPos(mul(unity_WorldToObject, positionInPolygon + (rightVector + upVector) * scale));
        milk[1].pos = UnityObjectToClipPos(mul(unity_WorldToObject, positionInPolygon + (rightVector + - upVector) * scale));
        milk[2].pos = UnityObjectToClipPos(mul(unity_WorldToObject, positionInPolygon + (-rightVector + - upVector) * scale));
        milk[3].pos = UnityObjectToClipPos(mul(unity_WorldToObject, positionInPolygon + (-rightVector + upVector) * scale));
        
        milk[0].screenUV = ComputeScreenPos(milk[0].pos);
        milk[1].screenUV = ComputeScreenPos(milk[1].pos);
        milk[2].screenUV = ComputeScreenPos(milk[2].pos);
        milk[3].screenUV = ComputeScreenPos(milk[3].pos);
        
        if(distance(positionInPolygon, _WorldSpaceCameraPos) >= _ParticleMinRenderDistance)
        {
            tristream.Append(milk[0]);
            tristream.Append(milk[1]);
            tristream.Append(milk[2]);
            tristream.RestartStrip();
            
            tristream.Append(milk[2]);
            tristream.Append(milk[3]);
            tristream.Append(milk[0]);
            tristream.RestartStrip();
        }
    }
}

sampler2D _ParticleTexture; float4 _ParticleTexture_ST;
sampler2D _ParticleStartColorGradient; float4 _ParticleStartColorGradient_ST;
UNITY_DECLARE_TEX2DARRAY(_ParticleFlipbookTexArray); float4 _ParticleFlipbookTexArray_ST;
float4 _ParticleFlipbookColor;
float _ParticleFlipbookFPS;
uint _ParticleFlipbookTotalFrames;
float _ParticleFlipbookTiled;
int _ParticleFlipbookCurrentFrame;
float _ParticleFlipbookEmissionStrength;
float _ParticleFlipbookRotation;
float _EnableParticleFlipbook;
float _ParticleAlphaCutoff;
float _ParticleIntersectionFadeDistance;
float _ParticleLit;
float _ColorOverLifetime;
float _ColorOverLifeSpeed;
// anim
uint _ParticleFlipbookMovementType;
float4 _ParticleFlipbookStartEndOffset;
float _ParticleFlipbookMovementSpeed;

void getFlipbookColor(inout float4 finalColor, float2 uv, float timeOffset)
{
    UNITY_BRANCH
    if (_EnableParticleFlipbook)
    {
        uint currentFrame = floor(_ParticleFlipbookCurrentFrame) % _ParticleFlipbookTotalFrames;
        if(_ParticleFlipbookCurrentFrame < 0)
        {
            if(_ParticleFlipbookFPS < 1)
            {
                currentFrame = timeOffset % _ParticleFlipbookTotalFrames;
            }
            else
            {
                currentFrame = ((_Time.y + timeOffset) / (1 / max(_ParticleFlipbookFPS, 1))) % _ParticleFlipbookTotalFrames;
            }
        }
        finalColor = UNITY_SAMPLE_TEX2DARRAY(_ParticleFlipbookTexArray, float3(TRANSFORM_TEX(uv, _ParticleFlipbookTexArray), currentFrame));
    }
}

fixed4 particleFrag(g2f i): SV_Target
{
    UNITY_SETUP_INSTANCE_ID(i);
    fixed4 finalColor;
    float2 colorUV = i.DebugData.w;
    
    if(_ColorOverLifetime && _ParticleMovementMode == 0)
    {
        colorUV = frac(i.DebugData.w + _Time.x * _ColorOverLifeSpeed);
    }
    else if(_ColorOverLifetime && _ParticleMovementMode == 1)
    {
        colorUV = i.DebugData.x;
    }
    
    float2 randomStartColor = i.DebugData.w + i.DebugData.x;
    float3 randomColor = tex2D(_ParticleStartColorGradient, TRANSFORM_TEX(colorUV, _ParticleStartColorGradient));
    finalColor = tex2D(_ParticleTexture, TRANSFORM_TEX(i.uv, _ParticleTexture));
    getFlipbookColor(finalColor, i.uv, i.TimeOffset);
    clip(finalColor.a - _ParticleAlphaCutoff);
    finalColor.rgb *= _ParticleColor.rgb * randomColor.rgb;
    finalColor.rgb *= _ParticleLit ? saturate(ShadeSH9(float4(0.0, 0.0, 0.0, 1.0))) + _LightColor0.rgb: 1;
    finalColor.a *= i.Alpha * _ParticleColor.a;
    return finalColor;
}

