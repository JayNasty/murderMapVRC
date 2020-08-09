
float _FurLength;
float _FurGravityStrength;

[maxvertexcount(63)]
void geom(triangle v2f IN[3], inout TriangleStream < v2f > tristream)
{
    float4 worldPos[3];
    v2f o[3];
    float3 offset = (float3(0,-1,0) * (_FurLength*.9) *_FurGravityStrength);

    for (int i = 0; i < 3; i ++)
    {
        tristream.Append(IN[i]);
        o[i] = IN[i];
        worldPos[i] = float4(IN[i].worldPos + IN[i].normal * _FurLength,1);
    }
    tristream.RestartStrip();
    _FurLayers = clamp(floor(_FurLayers * (1-smoothstep(_FurMinDistance,_FurMaxDistance, distance(IN[0].worldPos, getCameraPosition())))),min(1,_FurLayers),_FurLayers);

    for (int layer = 0; layer < _FurLayers; layer++) {
        for (int i = 0; i < 3; i++) {
            o[i].furAlpha = float(layer)/_FurLayers;
            o[i].worldPos = lerp(IN[i].worldPos, worldPos[i] + offset * o[i].furAlpha, o[i].furAlpha);
            o[i].pos = UnityWorldToClipPos(o[i].worldPos);
            o[i].furAlpha+=.01;
            tristream.Append(o[i]);
        }
        tristream.RestartStrip();
    }
}