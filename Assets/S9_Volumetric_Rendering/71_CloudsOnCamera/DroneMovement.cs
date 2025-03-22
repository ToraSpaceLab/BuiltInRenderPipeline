using UnityEngine;
using UnityEngine.UIElements;
using Cursor = UnityEngine.Cursor;

public class DroneMovement : MonoBehaviour
{
	[SerializeField] private Transform cameraTransform;
	public float speed = 10.0f;
	public float rotationSpeed = 500.0f;

	void Start()
	{
		Cursor.visible = false;

		if (cameraTransform == null)
		{
			if (Camera.main != null) cameraTransform = Camera.main.transform;
		}

		if (cameraTransform != null && cameraTransform.TryGetComponent<Drive>(out var drive))
		{
			drive.enabled = false;
		}
	}

	void Update()
	{
		var v = Input.GetAxis("Vertical") * speed;
		var h = Input.GetAxis("Horizontal") * speed;
		var y = Input.GetAxis("Mouse X") * rotationSpeed;
		var x = Input.GetAxis("Mouse Y") * rotationSpeed;

		// Make it move 10 meters per second instead of 10 meters per frame...
		h *= Time.deltaTime;
		v *= Time.deltaTime;
		x *= Time.deltaTime;
		y *= Time.deltaTime;

		if (Input.GetKey(KeyCode.E))
		{
			transform.Translate(0, Time.deltaTime * speed, 0, Space.World);
		}

		if (Input.GetKey(KeyCode.Q))
		{
			transform.Translate(0, -Time.deltaTime * speed, 0, Space.World);
		}

		var cameraRotation = new Vector3(x, -y, 0);
		cameraTransform.eulerAngles -= cameraRotation;

		transform.localEulerAngles = new Vector3(0, cameraTransform.localEulerAngles.y, 0);
		transform.Translate(h, 0, v);
		cameraTransform.position = transform.position;
	}
}