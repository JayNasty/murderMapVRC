using UnityEngine;
using System.IO;
using System.Net;
using System;
using System.ComponentModel;
using UnityEditor;

namespace nanoSDK
{
    public class nanoSDK_ImportManager
    {
        private static string localPath = "Assets/VRCSDK/nanoSDK/Importables/";
        private static string localDownloadPath = "Assets/VRCSDK/nanoSDK/Importables/Download/";
        private static string urlStart = "http://cdn.nanoSDK.net/download/importables/";

        public static void downloadAndImportAssetFromServer(string assetName)
        {
            if (File.Exists(localDownloadPath + assetName))
            {
                nanoLog(assetName + " exists. Importing it..");
                importDownloadedAsset(assetName);
            }
            else
            {
                nanoLog(assetName + " does not exist. Starting download..");
                downloadFile(assetName);
            }
        }

        private static void downloadFile(string assetName)
        {
            WebClient w = new WebClient();
            w.Headers.Set(HttpRequestHeader.UserAgent, "Webkit Gecko wHTTPS (Keep Alive 55)");
            w.QueryString.Add("assetName", assetName);
            w.DownloadFileCompleted += fileDownloadCompleted;
            w.DownloadProgressChanged += fileDownloadProgress;
            string url = urlStart + assetName;
            w.DownloadFileAsync(new Uri(url), localDownloadPath + assetName);
        }

        private static void fileDownloadCompleted(object sender, AsyncCompletedEventArgs e)
        {
            string assetName = ((WebClient)(sender)).QueryString["assetName"];
            nanoLog("Download of file " + assetName + " completed!");
        }

        private static void fileDownloadProgress(object sender, DownloadProgressChangedEventArgs e)
        {
            nanoLog("Progress is at " + e.ProgressPercentage.ToString() + "%");
        }

        private static void nanoLog(string message)
        {
            Debug.Log("[nanoSDK] AssetDownloadManager: " + message);
        }

        public static void importAsset(string assetName)
        {
            AssetDatabase.ImportPackage(localPath + assetName, true);
        }

        public static void importDownloadedAsset(string assetName)
        {
            AssetDatabase.ImportPackage(localDownloadPath + assetName, true);
        }
    }
}