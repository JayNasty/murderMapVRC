using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Video;

namespace nanoSDK
{
    public class nanoSDK_BackgorundVideo : MonoBehaviour
    {

        public RawImage rawimage;
        public VideoPlayer videoPlayer;
        private string localConfigPath = "Assets/VRCSDK/nanoSDK/Configs/BackgroundVideo.txt";
        private string localVideoPath = "Assets/VRCSDK/nanoSDK/Resources/Videos/";

        void Start()
        {
            if (!File.Exists(localConfigPath))
            {
                File.WriteAllText(localConfigPath, "true");
                StartCoroutine(PlayVideo());
            }
            else
            {
                if (CustomBackground())
                {
                    StartCoroutine(PlayVideo());
                }
            }
        }
        IEnumerator PlayVideo()
        {
            videoPlayer.clip = Resources.Load<VideoClip>("Videos/" + getRandomBackground());

            rawimage.color = Color.white;
            videoPlayer.Prepare();
            WaitForSeconds waitForSeconds = new WaitForSeconds(1);
            while (!videoPlayer.isPrepared)
            {
                yield return waitForSeconds;
            }

            rawimage.texture = videoPlayer.texture;
            videoPlayer.Play();
        }

        private bool CustomBackground()
        {
            if (File.ReadAllText(localConfigPath).Equals("true", StringComparison.InvariantCultureIgnoreCase))
                return true;
            else
                return false;
        }

        private string getRandomBackground()
        {
            List<string> videos = new List<string>();
            DirectoryInfo dir = new DirectoryInfo(localVideoPath);
            FileInfo[] info = dir.GetFiles("*.mp4");
            foreach(FileInfo f in info)
            {
                videos.Add(Path.GetFileNameWithoutExtension(localVideoPath + f.Name));
            }
            var random = new System.Random();
            int num = random.Next(videos.Count);
            return videos[num];
        }
    }
}