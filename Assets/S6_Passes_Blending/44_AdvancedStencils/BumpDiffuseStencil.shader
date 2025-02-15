Shader "Holistic/BumpDiffuseStencil"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Diffuse Texture", 2D) = "white" {}
        _BumpTex ("Bump Texture", 2D) = "bump" {}
        _BumpSlider ("BumpAmount", Range(0,10)) = 1
        
        _SRef ("Stencil Ref", Float) = 1
        [Enum(UnityEngine.Rendering.CompareFunction)] _SComp("Stencil Comp", Float) = 3
        [Enum(UnityEngine.Rendering.StencilOp)] _SOp("Stencil Op", Float) = 0
    }
    SubShader
    {
        Stencil
        {
            Ref[_SRef]
            Comp[_SComp]
            Pass[_SOp]
        }
        
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _MainTex;
        sampler2D _BumpTex;
        half _BumpSlider;
        float4 _Color;
        
        struct Input
        {
            float2 uv_MainTex;
            float2 uv_BumpTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb * _Color.rgb;
            o.Normal = UnpackNormal(tex2D(_BumpTex, IN.uv_BumpTex));
            o.Normal *= float3(_BumpSlider, _BumpSlider, 1);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
