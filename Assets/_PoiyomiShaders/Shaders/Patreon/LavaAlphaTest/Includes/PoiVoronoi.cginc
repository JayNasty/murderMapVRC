#ifndef VORONOI
    #define VORONOI
    
    float _VoronoiCells;
    float _VoronoiSpeed;
    UNITY_DECLARE_TEX2D_NOSAMPLER(_VoronoiNoise); float4 _VoronoiNoise_ST;
    
    float3 finalVoronoi;
    
    
    float2 random2(float2 p)
    {
        return frac(sin(float2(dot(p, float2(127.1, 311.7)), dot(p, float2(269.5, 183.3)))) * 43758.5453);
    }
    
    void calculateVoronoi(v2f i)
    {
        float2 st = i.uv;
        
        // Scale
        st *= _VoronoiCells;
        
        // Tile the space
        float2 i_st = floor(st);
        float2 f_st = frac(st);
        
        float m_dist = 1.;  // minimun distance
        
        for (int y = -1; y <= 1; y ++)
        {
            for (int x = -1; x <= 1; x ++)
            {
                // Neighbor place in the grid
                float2 neighbor = float2(float(x), float(y));
                
                // Random position from current + neighbor place in the grid
                float2 position = random2(i_st + neighbor);
                
                // Animate the position
                position = 0.5 + 0.5 * sin(_Time.y * _VoronoiSpeed + 6.2831 * position);
                
                // Vector between the pixel and the position
                float2 diff = neighbor + position - f_st;
                
                // Distance to the position
                float dist = length(diff);
                
                // Keep the closer distance
                m_dist = min(m_dist, dist);
            }
        }
        
        float noise = UNITY_SAMPLE_TEX2D_SAMPLER(_VoronoiNoise, _MainTex, TRANSFORM_TEX(i.uv, _VoronoiNoise));
        finalVoronoi = 0;
        finalVoronoi += m_dist;
    }
    
    void applyVoronoi(inout float4 finalColor)
    {
        finalColor.rgb = pow(finalVoronoi,6) * float3(1,0,0) * 3;
    }
    
#endif