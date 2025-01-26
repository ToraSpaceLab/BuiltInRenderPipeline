using System;
using UnityEngine;

public class SelfRotate : MonoBehaviour
{
	[SerializeField] float rotateSpeed = 50f;

	private void Update()
	{
		transform.Rotate(0f, rotateSpeed * Time.deltaTime, 0f, Space.Self);
	}
}
