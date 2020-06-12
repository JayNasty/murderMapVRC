using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine.SceneManagement;

namespace nanoSDK
{
    [InitializeOnLoadAttribute]
    public static class nanoSDK_DiscordRpcRuntimeHelper
    {
        // register an event handler when the class is initialized
        static nanoSDK_DiscordRpcRuntimeHelper()
        {
            EditorApplication.playModeStateChanged += LogPlayModeState;
            EditorSceneManager.activeSceneChanged += sceneChanged;
        }

        private static void sceneChanged(Scene old, Scene next)
        {
            nanoSDK_DiscordRPC.sceneChanged(next);
        }

        private static void LogPlayModeState(PlayModeStateChange state)
        {
            if(state == PlayModeStateChange.EnteredEditMode)
            {
                nanoSDK_DiscordRPC.updateState(RpcState.EDITMODE);
                nanoSDK_DiscordRPC.ResetTime();
            } else if(state == PlayModeStateChange.EnteredPlayMode)
            {
                nanoSDK_DiscordRPC.updateState(RpcState.PLAYMODE);
                nanoSDK_DiscordRPC.ResetTime();
            }
        }
    }
}