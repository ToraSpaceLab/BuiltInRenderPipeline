Shader "Holistic/DotProduct2"
{
    SubShader
    {
        CGPROGRAM
            #pragma surface surf Lambert

            struct Input
            {
                float3 viewDir;
            };

            void surf (Input IN, inout SurfaceOutput o)
            {
                half dotp = dot(IN.viewDir, o.Normal);
                o.Albedo.r = 1 - dotp;
            }
        ENDCG
    }
    Fallback "Diffuse"
}
