using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.UI;

namespace VRCSDK2
{
    [InitializeOnLoad]
    public class VRC_SdkSplashScreen : EditorWindow
    {

        static VRC_SdkSplashScreen()
        {
            EditorApplication.update -= DoSplashScreen;
            EditorApplication.update += DoSplashScreen;
        }

        private static void DoSplashScreen()
        {
            EditorApplication.update -= DoSplashScreen;
            if (!EditorPrefs.HasKey("nanoSDK_ShowInfoPanel"))
            {
                EditorPrefs.SetBool("nanoSDK_ShowInfoPanel", true);
            }
            if (EditorPrefs.GetBool("nanoSDK_ShowInfoPanel"))
                OpenSplashScreen();
        }

        private static Vector2 changeLogScroll;
        private static GUIStyle vrcSdkHeader;
        [MenuItem("nanoSDK/Info", false, 500)]
        public static void OpenSplashScreen()
        {
            GetWindow<VRC_SdkSplashScreen>(true);
        }
        
        public static void Open()
        {
            OpenSplashScreen();
        }

        public void OnEnable()
        {
            titleContent = new GUIContent("nanoSDK Info");

            maxSize = new Vector2(400, 550);
            minSize = maxSize;

            vrcSdkHeader = new GUIStyle
            {
                normal =
                    {
                       background = Resources.Load("nanoSdkHeader") as Texture2D,
                       textColor = Color.white
                    },
                fixedHeight = 200
            };
        }

        public void OnGUI()
        {
            GUILayout.Box("", vrcSdkHeader);
            GUILayout.Space(4);
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
            GUILayout.Label("nanoSDK Version 0.9");
            GUILayout.Space(2);
            GUILayout.Label("Please check out the nanoSDK Settings menu :3");
            GUILayout.Space(20);
            GUILayout.Label("Instructions for build in features");
            changeLogScroll = GUILayout.BeginScrollView(changeLogScroll, GUILayout.Width(390));

            GUILayout.Label(
@"Visemes auto assign:
- To use it, select 'Viseme Blend Shape' and assign the
Skinned Mesh Renderer in the VRC_AvatarDescriptor as you
used to. To auto assign the the blendshapes right-click
the VRC_AvatarDescriptor and select 'Auto assign visemes'.

Import panel:
To import an asset, just click a button to import it.
Larger assets need to be downloaded first, thats why it
says 'Download' and not 'Import' on some buttons. After
you clicked the 'Download' button the button text should
change and you should be able to import your asset like
the other. Make sure you wait for the asset to download
completely, you can check this by opening the console and
look for the message that says
'Download of file [AssetName] completed!'
");
            GUILayout.EndScrollView();

            GUILayout.BeginHorizontal();
            EditorPrefs.SetBool("nanoSDK_ShowInfoPanel", GUILayout.Toggle(EditorPrefs.GetBool("nanoSDK_ShowInfoPanel"), "Show at startup"));
            GUILayout.EndHorizontal();
        }

    }
}