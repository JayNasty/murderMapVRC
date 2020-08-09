struct Cube
{
    float3 min;
    float3 max;
};

float random(in float3 st)
{
    return frac(cos(dot(st.xyz, float3(12.9898, 78.233, 123.691))) * 43758.5453123);
}

float _TriToCube;
float _SpawnAlpha;
float3 _LocalSpawnOffset;
float3 _WorldSpawnOffset;
float _Pieces;
int _AssemblyMode;
float3 _AssemblyBegin;
float3 _AssemblyEnd;
int _ExplodeMode;
float _ExplodeFadeDistance;

void assembleVert(float3 newPos, v2f i, float2 newUV, float alpha, inout v2f o)
{
    float3 worldPos = lerp(i.worldPos, newPos, alpha);
    o.uv = lerp(i.uv, newUV, _TriToCube);
    o.pos = UnityWorldToClipPos(float4(worldPos, 1));
    o.worldPos = float4(worldPos, 1);
}

[maxvertexcount(18)]
void geom(triangle v2f IN[3], inout TriangleStream < v2f > tristream)
{
    float3 edgeA = IN[1].localPos - IN[0].localPos;
    float3 edgeB = IN[2].localPos - IN[0].localPos;
    float3 c = cross(edgeA, edgeB);
    float3 outDir = normalize(c);
    
    float4 center = (IN[0].worldPos + IN[1].worldPos + IN[2].worldPos) / 3;
    float2 uv = (IN[0].uv + IN[1].uv + IN[2].uv) / 3;
    Cube cube;
    v2f o;
    
    float rando = random(float3(IN[0].vertexId, IN[1].vertexId, IN[2].vertexId));
    //center += rando/50;
    // Calculate Cube Bounds
    cube.min = IN[0].worldPos;
    cube.max = IN[0].worldPos;
    for (int i = 1; i < 3; i ++)
    {
        cube.min = float3(min(IN[i].worldPos.x, cube.min.x), min(IN[i].worldPos.y, cube.min.y), min(IN[i].worldPos.z, cube.min.z));
        cube.max = float3(max(IN[i].worldPos.x, cube.max.x), max(IN[i].worldPos.y, cube.max.y), max(IN[i].worldPos.z, cube.max.z));
    }
    cube.min = lerp(cube.min, center, rando / 20);
    cube.max = lerp(cube.max, center, rando / 20);
    float4 offset = 0;
    if (_ExplodeMode == 0)
    {
        offset = float4(_WorldSpawnOffset, 0) + mul(unity_ObjectToWorld, _LocalSpawnOffset);
    }
    else if(_ExplodeMode == 1)
    {
        offset = float4(outDir * _ExplodeFadeDistance, 0);
    }
    
    float4 cameraExplodeOffset = 0;
    
    float spawnAlpha = 0;
    
    if(_AssemblyMode == 0) // Random
    {
        spawnAlpha = saturate((-rando) * _Pieces + (_SpawnAlpha * (_Pieces + 1)));
    }
    else if (_AssemblyMode == 1) // Building Blocks
    {
        float lineMagnitude = distance(_AssemblyBegin, _AssemblyEnd);
        float3 constructionLine = (_AssemblyEnd - _AssemblyBegin);
        float3 objectLine = (mul(unity_WorldToObject, center) - _AssemblyBegin);
        float progress = -1 + saturate(dot(constructionLine, objectLine) / (lineMagnitude * lineMagnitude));
        
        IN[0].localPos.z = progress;
        IN[1].localPos.z = progress;
        IN[2].localPos.z = progress;
        
        spawnAlpha = saturate((progress) * _Pieces + (_SpawnAlpha * (_Pieces + 1)));
    }
    
    cube.min = lerp(cube.min, center + offset, spawnAlpha);
    cube.max = lerp(cube.max, center + offset, spawnAlpha);
    
    // Construct Cubes
    float3 normal = float3(0, 0, 1);
    o = IN[0];
    o.uv = lerp(o.uv, uv, _TriToCube);
    
    IN[0].worldPos = lerp(IN[0].worldPos, center + offset, spawnAlpha);
    IN[1].worldPos = lerp(IN[1].worldPos, center + offset, spawnAlpha);
    IN[2].worldPos = lerp(IN[2].worldPos, center + offset, spawnAlpha);
    
    
    if (_TriToCube == 0)
    {
        for (int i = 0; i < 3; i ++)
        {
            IN[i].pos = UnityWorldToClipPos(IN[i].worldPos);
            tristream.Append(IN[i]);
        }
        tristream.RestartStrip();
        return;
    }
    
    float3 viewDirection = normalize(center - getCameraPosition());
    
    //Front
    o.normal = float3(0, 0, 1);
    if (dot(viewDirection, o.normal) < 0)
    {
        assembleVert(float3(cube.min.x, cube.min.y, cube.max.z), IN[0], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.max.x, cube.min.y, cube.max.z), IN[1], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.min.x, cube.max.y, cube.max.z), IN[2], uv, _TriToCube, o);
        tristream.Append(o);
        tristream.RestartStrip();
        assembleVert(float3(cube.max.x, cube.max.y, cube.max.z), IN[0], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.min.x, cube.max.y, cube.max.z), IN[1], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.max.x, cube.min.y, cube.max.z), IN[2], uv, _TriToCube, o);
        tristream.Append(o);
        tristream.RestartStrip();
    }
    
    //Back
    o.normal = float3(0, 0, -1);
    if (dot(viewDirection, o.normal) < 0)
    {
        assembleVert(float3(cube.min.x, cube.max.y, cube.min.z), IN[0], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.max.x, cube.min.y, cube.min.z), IN[1], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.min.x, cube.min.y, cube.min.z), IN[2], uv, _TriToCube, o);
        tristream.Append(o);
        tristream.RestartStrip();
        assembleVert(float3(cube.max.x, cube.min.y, cube.min.z), IN[0], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.min.x, cube.max.y, cube.min.z), IN[1], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.max.x, cube.max.y, cube.min.z), IN[2], uv, _TriToCube, o);
        tristream.Append(o);
        tristream.RestartStrip();
    }
    
    //-x
    o.normal = float3(1, 0, 0);
    if (dot(viewDirection, o.normal) < 0)
    {
        assembleVert(float3(cube.max.x, cube.max.y, cube.min.z), IN[0], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.max.x, cube.min.y, cube.max.z), IN[1], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.max.x, cube.min.y, cube.min.z), IN[2], uv, _TriToCube, o);
        tristream.Append(o);
        tristream.RestartStrip();
        assembleVert(float3(cube.max.x, cube.min.y, cube.max.z), IN[0], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.max.x, cube.max.y, cube.min.z), IN[1], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.max.x, cube.max.y, cube.max.z), IN[2], uv, _TriToCube, o);
        tristream.Append(o);
        tristream.RestartStrip();
    }

    //+x
    o.normal = float3(-1, 0, 0);
    if (dot(viewDirection, o.normal) < 0)
    {
        assembleVert(float3(cube.min.x, cube.min.y, cube.min.z), IN[0], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.min.x, cube.min.y, cube.max.z), IN[1], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.min.x, cube.max.y, cube.min.z), IN[2], uv, _TriToCube, o);
        tristream.Append(o);
        tristream.RestartStrip();
        assembleVert(float3(cube.min.x, cube.max.y, cube.max.z), IN[0], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.min.x, cube.max.y, cube.min.z), IN[1], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.min.x, cube.min.y, cube.max.z), IN[2], uv, _TriToCube, o);
        tristream.Append(o);
        tristream.RestartStrip();
    }

    //up
    o.normal = float3(0, 1, 0);
    if (dot(viewDirection, o.normal) < 0)
    {
        assembleVert(float3(cube.min.x, cube.max.y, cube.max.z), IN[0], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.max.x, cube.max.y, cube.min.z), IN[1], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.min.x, cube.max.y, cube.min.z), IN[2], uv, _TriToCube, o);
        tristream.Append(o);
        tristream.RestartStrip();
        assembleVert(float3(cube.max.x, cube.max.y, cube.min.z), IN[0], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.min.x, cube.max.y, cube.max.z), IN[1], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.max.x, cube.max.y, cube.max.z), IN[2], uv, _TriToCube, o);
        tristream.Append(o);
        tristream.RestartStrip();
    }

    //down
    o.normal = float3(0, -1, 0);
    if (dot(viewDirection, o.normal) < 0)
    {
        assembleVert(float3(cube.min.x, cube.min.y, cube.min.z), IN[0], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.max.x, cube.min.y, cube.min.z), IN[1], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.min.x, cube.min.y, cube.max.z), IN[2], uv, _TriToCube, o);
        tristream.Append(o);
        tristream.RestartStrip();
        assembleVert(float3(cube.max.x, cube.min.y, cube.max.z), IN[0], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.min.x, cube.min.y, cube.max.z), IN[1], uv, _TriToCube, o);
        tristream.Append(o);
        assembleVert(float3(cube.max.x, cube.min.y, cube.min.z), IN[2], uv, _TriToCube, o);
        tristream.Append(o);
        tristream.RestartStrip();
    }
    /*
    for (int i = 0; i < 3; i ++)
    {
        IN[i].uv = uv;
        tristream.Append(IN[i]);
    }
    */
}