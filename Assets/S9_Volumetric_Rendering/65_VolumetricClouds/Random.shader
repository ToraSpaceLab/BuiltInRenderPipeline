Shader "Holistic/Random"
{
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            fixed4 rand1D(float x)
            {
                return frac(sin(x)*1.0);
            }

            fixed4 rand2D(float2 value)
            {
                return frac(sin(dot(value, float2(102.9898, 108.233))) * 49758.545323);
            }
            
            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // fixed4 col = rand1D(i.vertex.x);
                fixed4 col = rand2D(i.vertex.xy * 0.001);
                return col;
            }
            ENDCG
        }
    }
}
