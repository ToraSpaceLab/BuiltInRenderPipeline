Shader "Holistic/Rim1"
{
    Properties
    {
        _RimColor ("Rim Color", Color) = (0, 0.5, 0.5, 0.0)
    }
    
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert
        struct Input
        {
            float3 viewDir;
        };

        float4 _RimColor;

        void surf (Input IN, inout SurfaceOutput o)
        {
            // half rim = 1 - dot(normalize(IN.viewDir), o.Normal);
            half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
            o.Emission = _RimColor.rgb * rim;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
