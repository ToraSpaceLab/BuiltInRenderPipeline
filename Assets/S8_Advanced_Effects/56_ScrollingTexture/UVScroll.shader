Shader "Holistic/UVScroll"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _SubTex ("Sub Texture", 2D) = "white" {}
        _ScrollX ("Scroll X", Range(-5,5)) = 1
        _ScrollY ("Scroll Y", Range(-5,5)) = 1
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert
        
        sampler2D _MainTex;
        sampler2D _SubTex;
        float _ScrollX;
        float _ScrollY;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_SubTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            _ScrollX *= _Time * 2;
            _ScrollY *= _Time * 2;
            float3 main = tex2D(_MainTex, IN.uv_MainTex + float2(_ScrollX,_ScrollY)).rgb/1.2;
            float3 sub = tex2D(_SubTex, IN.uv_SubTex + float2(_ScrollX/2.0,_ScrollY/2.0)).rgb/2.4;
            o.Albedo = main + sub;
        }
        ENDCG
    }
    Fallback "Diffuse"
}
