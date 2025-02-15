Shader "Holistic/BlendTest1"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "black" {}
	}
	SubShader
	{
		Tags
		{
			"Queue" = "Transparent"
		}
		
		Blend SrcAlpha OneMinusSrcAlpha
		
		Pass
		{
			SetTexture[_MainTex]{combine texture}
		}
	}
	FallBack "Diffuse"
}