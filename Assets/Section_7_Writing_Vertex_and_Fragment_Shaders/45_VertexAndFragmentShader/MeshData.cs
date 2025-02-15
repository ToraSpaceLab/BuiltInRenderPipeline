using UnityEngine;

public class MeshData : MonoBehaviour
{
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        Mesh mesh = GetComponent<MeshFilter>().mesh;
        Vector3[] vertices = mesh.vertices;
        foreach (Vector3 v in vertices)
        {
            Debug.Log(v);
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
