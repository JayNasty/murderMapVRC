

float2 getMatcapUV(float3 viewDirection, float3 normalDirection)
{
    half3 worldViewUp = normalize(half3(0, 1, 0) - viewDirection * dot(viewDirection, half3(0, 1, 0)));
    half3 worldViewRight = normalize(cross(viewDirection, worldViewUp));
    half2 matcapUV = half2(dot(worldViewRight, normalDirection), dot(worldViewUp, normalDirection)) * 0.5 + 0.5;
    return matcapUV;
}

float3 CreateBinormal(float3 normal, float3 tangent, float binormalSign)
{
    return cross(normal, tangent.xyz) *
    (binormalSign * unity_WorldTransformParams.w);
}

float random(in float3 st)
{
    return frac(cos(dot(st.xyz, float3(12.9898, 78.233, 123.691))) * 43758.5453123);
}