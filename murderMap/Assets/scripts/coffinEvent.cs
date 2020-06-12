using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class coffinEvent : MonoBehaviour {

	public AudioClip coffinAudio;
	public AudioSource audioS;

	void start(){
	}

	void Update(){
	}
		
	void musicPlayOnEvent(){
		audioS.PlayOneShot(coffinAudio);

	}
		
}
