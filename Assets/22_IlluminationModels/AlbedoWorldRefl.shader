Shader "Custom/AlbedoWorldRefl"
{
	Properties
	{
	}
	
	SubShader
	{
		CGPROGRAM
		#pragma surface surf Lambert
		
		sampler2D _myDiffuseTex;
		
		struct Input
		{
			float2 uv_myDiffuseTex;
			float3 worldRefl;
		};

		void surf (Input IN, inout SurfaceOutput o)
		{
			o.Albedo = IN.worldRefl;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
