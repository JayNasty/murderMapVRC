#ifndef POI_LIGHTING_DATA
    #define POI_LIGHTING_DATA
    
    struct PoiLight
    {
        float3 direction;
        float3 position;
        float3 color;
        float attenuation;
        float3 directLighting;
        float3 indirectLighting;
        float lightMap;
        float3 rampedLightMap;
        float3 finalLighting;
        float nDotL;
    };

#endif