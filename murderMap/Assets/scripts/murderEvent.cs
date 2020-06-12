using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class murderEvent : MonoBehaviour {

	public AudioClip murderAudio;
	public AudioSource audioS;

	void start(){
	}

	void Update(){
	}
		
	void musicPlayOnEvent(){
		audioS.PlayOneShot(murderAudio);

	}
		
}
