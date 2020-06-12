using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using VRCSDK2;

namespace nanoSDK
{
    public class nanoSDK_VismesAutoAssign
    {
        [MenuItem("CONTEXT/VRC_AvatarDescriptor/Auto assign visemes")]
        public static void autoAssignVisemes(MenuCommand menuCommand)
        {
            VRC_AvatarDescriptor vrca = menuCommand.context as VRC_AvatarDescriptor;
            string[] visemes = new string[] { "sil", "pp", "ff", "th", "dd", "kk", "ch", "ss", "nn", "rr", "aa", "e", "ih", "oh", "ou" };
            for (int i = 0; i < visemes.Length; i++)
            {
                vrca.VisemeBlendShapes[i] = "vrc.v_" + visemes[i];
            }
        }
    }
}