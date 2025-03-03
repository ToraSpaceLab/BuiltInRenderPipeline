Shader "Holistic/UVScrollWaterWithWaves"
{
    Properties
    {
        _MainTex ("Texture 1", 2D) = "white" {}
        _SubTex ("Texture 2", 2D) = "white" {}
        _ScrollX ("Scroll X", Range(-5,5)) = 1
        _ScrollY ("Scroll Y", Range(-5,5)) = 1
        _Tint ("Color Tint", Color) = (1,1,1,1)
        _Freq ("Frequency", Range(0,5)) = 3
        _Speed ("Speed", Range(0,100)) = 10
        _Amp ("Amplitude", Range(0,1)) = 0.5
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert vertex:vert

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_SubTex;
            float3 vertColor;
        };

        float4 _Tint;
        float _Freq;
        float _Speed;
        float _Amp;

        struct appdata
        {
            float4 vertex: POSITION;
            float3 normal: NORMAL;
            float4 texcoord: TEXCOORD0;
            float4 texcoord1: TEXCOORD1;
            float4 texcoord2: TEXCOORD2;
        };

        void vert (inout appdata v, out Input o)
        {
            UNITY_INITIALIZE_OUTPUT(Input, o);
            float t = _Time * _Speed;
            
            float waveHeight = sin(t + v.vertex.x * _Freq) * _Amp;// + sin(t*2 + v.vertex.x * _Freq*2) * _Amp;
            float waveHeightZ = sin(t + v.vertex.z * _Freq) * _Amp;// + sin(t*2 + v.vertex.z * _Freq*2) * _Amp;
            v.vertex.y = v.vertex.y + waveHeight + waveHeightZ;

            v.normal = normalize(float3(v.normal.x + waveHeight, v.normal.y, v.normal.z));
            o.vertColor = waveHeight + 2;
        }

        sampler2D _MainTex;
        sampler2D _SubTex;
        float _ScrollX;
        float _ScrollY;
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            _ScrollX *= _Time;
            _ScrollY *= _Time;
            float4 c1 = tex2D(_MainTex, IN.uv_MainTex + float2(_ScrollX, _ScrollY)) / 2.0;
            float4 c2 = tex2D(_SubTex, IN.uv_SubTex + float2(_ScrollX/2.0, _ScrollY/2.0)) / 4.0;
            o.Albedo = (c1 + c2) * IN.vertColor.rgb * _Tint;
        }
        
        ENDCG
    }
}
