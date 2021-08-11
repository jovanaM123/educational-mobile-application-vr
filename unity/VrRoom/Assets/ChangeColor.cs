using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangeColor : MonoBehaviour
{
  public void Red()
    {
        GetComponent<Renderer>().material.color = Color.red;
    }

    public void Blue()
    {
        GetComponent<Renderer>().material.color = Color.blue;

    }

    public void Black()
    {
        GetComponent<Renderer>().material.color = Color.black;

    }

    public void Grey()
    {
        GetComponent<Renderer>().material.color = Color.grey;

    }
    public void Green()
    {
        GetComponent<Renderer>().material.color = Color.green;

    }

    public void White()
    {
        GetComponent<Renderer>().material.color = Color.white;

    }

    public void Cyan()
    {
        GetComponent<Renderer>().material.color = Color.cyan;

    }

    public void Yellow()
    {
        GetComponent<Renderer>().material.color = Color.yellow;

    }
}
