Shader "Holistic/ColorVF"
{
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float4 color : COLOR;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                // o.color = fixed4((v.vertex.x + 10)/20,(v.vertex.z + 10)/20,1,1);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col;
                // fixed4 col = i.color;
                col.r = i.vertex.x/1000;
                col.g = i.vertex.y/1000;
                return col;
            }
            ENDCG
        }
    }
}
