Shader "Holistic/BumpDiffuseChallenge"
{
	Properties
	{
		_myDiffuseTex ("Deffuse Texture", 2D) = "white" {}
		_myBumpTex ("Bump Texture", 2D) = "bump" {}
		_myBumpAmount ("Bump Amount", Range(0,10)) = 1
		_myTextureBumpScale ("Texture Bump Scale", Range(0.5,2)) = 1
	}
	SubShader
	{
		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D _myDiffuseTex;
		sampler2D _myBumpTex;
		half _myBumpAmount;
		half _myTextureBumpScale;

		struct Input
		{
			float2 uv_myDiffuseTex;
			float2 uv_myBumpTex;
		};

		void surf (Input IN, inout SurfaceOutput o)
		{
			o.Albedo = tex2D(_myDiffuseTex, IN.uv_myDiffuseTex * _myTextureBumpScale).rgb;
			o.Normal = UnpackNormal(tex2D(_myBumpTex, IN.uv_myBumpTex * _myTextureBumpScale));
			o.Normal *= float3(_myBumpAmount, _myBumpAmount, 1);
		}
		ENDCG
	}
	FallBack "Diffuse"
}
