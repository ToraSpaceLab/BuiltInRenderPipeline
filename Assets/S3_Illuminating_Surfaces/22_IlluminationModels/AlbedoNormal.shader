Shader "Custom/AlbedoNormal"
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
		};

		void surf (Input IN, inout SurfaceOutput o)
		{
			o.Albedo = o.Normal;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
