using System;
using UnityEngine;

[ExecuteInEditMode]
public class DecalOnOff : MonoBehaviour
{
	private Material mat;
	bool showDecal = false;

	private void OnMouseDown()
	{
		showDecal = !showDecal;
		if (showDecal)
		{
			mat.SetFloat("_ShowDecal", 1);
		}
		else
		{
			mat.SetFloat("_ShowDecal", 0);
		}
	}

	private void Start()
	{
		mat = GetComponent<Renderer>().sharedMaterial;
	}
}
