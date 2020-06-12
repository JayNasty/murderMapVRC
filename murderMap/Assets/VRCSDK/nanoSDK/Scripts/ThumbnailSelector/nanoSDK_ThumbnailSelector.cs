using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace nanoSDK.ThumbnailSelector
{
    public class nanoSDK_ThumbnailSelector : MonoBehaviour {
        private bool bAddScript = false;
        public Texture2D texture;
	
	    void Update () {
            if (false == bAddScript) {
                GameObject obj = GameObject.Find("VRCCam");
                if (null != obj)
                {
                    bAddScript = true;
                    obj.AddComponent<nanoSDK_ThumbnailOverlay>();
                    nanoSDK_ThumbnailOverlay script = obj.GetComponent<nanoSDK_ThumbnailOverlay>();
                    if (null == script) {
                        Debug.Log("nanoSDK_ThumbnailOverlay Script not Found");
                        return;
                    }
                    script.enabled = false;
                    script.SetTextuer(texture);
                }
            }
        }
    }
}
