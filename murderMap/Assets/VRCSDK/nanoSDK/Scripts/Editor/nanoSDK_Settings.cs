using UnityEngine;
using UnityEditor;
using System.IO;
using System;

namespace nanoSDK
{
    [InitializeOnLoad]
    public class nanoSDK_Settings: EditorWindow
    {
        private string localConfigVideo = "Assets/VRCSDK/nanoSDK/Configs/BackgroundVideo.txt";

        [MenuItem("nanoSDK/nanoSDK Settings", false, 501)]
        public static void OpenSplashScreen()
        {
            GetWindow<nanoSDK_Settings>(true);
        }

        public void OnEnable()
        {
            titleContent = new GUIContent("nanoSDK Settings");

            maxSize = new Vector2(400, 475);
            minSize = maxSize;

            if(!EditorPrefs.HasKey("nanoSDK_discordRPC"))
            {
                EditorPrefs.SetBool("nanoSDK_discordRPC", true);
            }

            if(!File.Exists(localConfigVideo))
            {
                File.WriteAllText(localConfigVideo, "false");
            }
        }

        public void OnGUI()
        {
            GUI.backgroundColor = Color.gray;
            GUILayout.BeginHorizontal();
            if (GUILayout.Button("SDK made by lyze and zLucPlayZ"))
            {
                Application.OpenURL("https://www.youtube.com/watch?v=eU-B-ZZv4Ao");
            }
            GUILayout.EndHorizontal();
            GUILayout.BeginHorizontal();
            if (GUILayout.Button("nanoSDK Discord"))
            {
                Application.OpenURL("https://nanosdk.net/discord");
            }
            if (GUILayout.Button("nanoSDK Website"))
            {
                Application.OpenURL("https://nanoSDK.net/");
            }
            GUILayout.EndHorizontal();

            GUILayout.Space(4);
            GUILayout.Label("Overall:");
            GUILayout.BeginHorizontal();
            EditorPrefs.SetBool("nanoSDK_discordRPC", GUILayout.Toggle(EditorPrefs.GetBool("nanoSDK_discordRPC"), " Discord RPC"));
            GUILayout.EndHorizontal();

            GUILayout.Space(4);
            GUILayout.Label("Upload panel:");
            GUILayout.BeginHorizontal();
            bool re = GUILayout.Toggle(CustomBackground(), " Custom background");
            File.WriteAllText(localConfigVideo, re.ToString());
            GUILayout.EndHorizontal();
        }
        private bool CustomBackground()
        {
            if (File.ReadAllText(localConfigVideo).Equals("true", StringComparison.InvariantCultureIgnoreCase))
                return true;
            else
                return false;
        }
    }
}