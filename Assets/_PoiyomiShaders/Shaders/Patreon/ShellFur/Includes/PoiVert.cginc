#ifndef POIVERT
    #define POIVERT
    v2f vert(appdata v)
    {
        v2f o;
        UNITY_SETUP_INSTANCE_ID(v);
        UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
        UNITY_TRANSFER_INSTANCE_ID(v, o);
        
        #ifdef FUN
            applyFun(v.vertex);
        #endif
        
        TANGENT_SPACE_ROTATION;
        o.localPos = v.vertex;
        o.pos = UnityObjectToClipPos(o.localPos);
        o.worldPos = mul(unity_ObjectToWorld, float4(o.localPos,1));
        o.uv = v.texcoord.xy + _GlobalPanSpeed.xy * _Time.y;
        o.normal = UnityObjectToWorldNormal(v.normal);
        //o.tangent = float4(UnityObjectToWorldDir(v.tangent.xyz), v.tangent.w);
        o.furAlpha = 0;
        UNITY_TRANSFER_FOG(o, o.pos);
        return o;
    }
#endif