using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.UI;
using System.Net;
using nanoSDK;
using System.IO;

namespace nanoSDK
{
    [InitializeOnLoad]
    public class nanoSDK_ImportPanel : EditorWindow
    {
        private static GUIStyle nanoHeader;
        private static string localDownloadPath = "Assets/VRCSDK/nanoSDK/Importables/Download/";

        [MenuItem("nanoSDK/Import panel", false, 501)]
        public static void OpenImportPanel()
        {
            GetWindow<nanoSDK_ImportPanel>(true);
        }

        public void OnEnable()
        {
            titleContent = new GUIContent("nanoSDK Import panel");

            maxSize = new Vector2(400, 700);
            minSize = maxSize;

            nanoHeader = new GUIStyle
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
            GUILayout.Box("", nanoHeader);
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

            //Imports V!V


            //Editor tools
            GUILayout.Label("                                        Editor tools");

            //QHierarchy
            GUILayout.BeginHorizontal();
            if (GUILayout.Button("Import QHierarchy"))
            {
                nanoSDK_ImportManager.importAsset("QHierarchy.unitypackage");
            }
            GUILayout.EndHorizontal();

            //BitAnimator
            GUILayout.BeginHorizontal();
            if (GUILayout.Button("Import Bit Animator"))
            {
                nanoSDK_ImportManager.importAsset("BitAnimator.unitypackage");
            }
            GUILayout.EndHorizontal();

            //ReroEditorScripts
            GUILayout.BeginHorizontal();
            if (GUILayout.Button("Import Rero Editor Scripts"))
            {
                nanoSDK_ImportManager.importAsset("ReroEditorScripts.unitypackage");
            }
            GUILayout.EndHorizontal();

            //MuscleAnimator
            GUILayout.BeginHorizontal();
            if (GUILayout.Button("Import Muscle Animator v2.2"))
            {
                nanoSDK_ImportManager.importAsset("MuscleAnimator.unitypackage");
            }
            GUILayout.EndHorizontal();


            //Plugins
            GUILayout.Label("                                           Plugins");

            //Dynamic Bones
            GUILayout.BeginHorizontal();
            if (GUILayout.Button("Import Dynamic Bones"))
            {
                nanoSDK_ImportManager.importAsset("DynamicBones.unitypackage");
            }
            GUILayout.EndHorizontal();

            //Final IK
            GUILayout.BeginHorizontal();
            if (GUILayout.Button((File.Exists(localDownloadPath + "Final_IKv1.7.unitypackage") ? "Import" : "Download") + " Final IK 1.7"))
            {
                nanoSDK_ImportManager.downloadAndImportAssetFromServer("Final_IKv1.7.unitypackage");
            }
            GUILayout.EndHorizontal();


            //Prefabs
            GUILayout.Label("                                           Prefabs");

            //nanoSDK_WorldAudioPrefab
            GUILayout.BeginHorizontal();
            if (GUILayout.Button("Import nanoSDK World Audio"))
            {
                nanoSDK_ImportManager.importAsset("nanoSDK_WorldAudioPrefab.unitypackage");
            }
            GUILayout.EndHorizontal();

            //nanoSDK_ParticleShaderSpherePrefab
            GUILayout.BeginHorizontal();
            if (GUILayout.Button("Import nanoSDK Particle Shader Sphere (Menu overrender)"))
            {
                nanoSDK_ImportManager.importAsset("nanoSDK_ParticleShaderSpherePrefab.unitypackage");
            }
            GUILayout.EndHorizontal();

            //IK World Fixed Joint
            GUILayout.BeginHorizontal();
            if (GUILayout.Button("Import IK World Fixed Joint (FinalIK 1.7 required!)"))
            {
                nanoSDK_ImportManager.importAsset("WorldFixedIK.unitypackage");
            }
            GUILayout.EndHorizontal();


            //Shader
            GUILayout.Label("                                           Shader");

            //Poiyomi Toon
            GUILayout.BeginHorizontal();
            if (GUILayout.Button((File.Exists(localDownloadPath + "PoiyomiToonShader.unitypackage") ? "Import" : "Download") + " Poiyomi Toon Shader"))
            {
                nanoSDK_ImportManager.downloadAndImportAssetFromServer("PoiyomiToonShader.unitypackage");
            }
            GUILayout.EndHorizontal();
        }
    }   
}