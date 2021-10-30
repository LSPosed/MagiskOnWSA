# Magisk on WSA

## Features
- Integrate Magisk and OpenGApps in a few clicks within minutes
- No Linux environment required for integration
- Keep each build up to date
- Support both ARM64 and x64
- Support all OpenGApps variants
- Fix external storage access of DocumentUI

## Usage

1. Star (if you like) and fork this repo
1. Go to the **Action** tab in your forked repo
    ![Action Tab](https://docs.github.com/assets/images/help/repository/actions-tab.png)
1. In the left sidebar, click the **Magisk** workflow.
    ![Workflow](https://docs.github.com/assets/images/actions-select-workflow.png)
1. Above the list of workflow runs, select **Run workflow**
    ![Run Workflow](https://docs.github.com/assets/images/actions-workflow-dispatch.png)
1. Input the download link of Magisk and select the [OpenGApps variant](https://github.com/opengapps/opengapps/wiki#variants) (none is no OpenGApps) you like and click **Run workflow**
    ![Run Workflow](https://docs.github.com/assets/images/actions-manually-run-workflow.png)
1. Wait the action complete and download the artifact
    ![Download](https://docs.github.com/assets/images/help/repository/artifact-drop-down-updated.png)
1. Unzip the artifact and uninstall WSA if you have an official installation or replace the pevious unzipped artifact if you have a manual installation
1. Enable developer mode on Windows
1. Follow the video [https://www.youtube.com/watch?v=EFV-fM81Tzs](https://www.youtube.com/watch?v=EFV-fM81Tzs) or the next instructions :
1. (If you have already install WSA, uninstall with `Remove-AppxPackage MicrosoftCorporationII.WindowsSubsystemForAndroid_1.7.32815.0_x64__8wekyb3d8bbwe -AllUsers` in powershell with admin privileges)
1. In powershell, run `Add-AppxPackage -Register .\AppxManifest.xml` under the unzipped artifact directory (`import-module appx -usewindowspowershell` if Add-AppxPackage doesn't work)
1. Launch WSA and enable developer mode, launch the file manager, and wait until the file manager popup
1. Run `adb connect @IP` to connect to WSA and install Magisk app `adb install magisk.apk` (the one you use to build) and launch it
1. Fix the environment as Magisk app will prompt and reboot (sometimes it keeps prompting even after environment fix, just ignore it)
1. Enjoy by installing Riru and LSPosed

## Prebuilt Magisk

There's still a bug from Magisk that prevents it from running on WSA. So please don't use the official build yet. The download link of the prebuilt Magisk is: [https://raw.githubusercontent.com/LSPosed/MagiskOnWSA/main/magisk.apk](https://raw.githubusercontent.com/LSPosed/MagiskOnWSA/main/magisk.apk) and its source codes are on the magisk branch.

## Credits
- [Magisk](https://github.com/topjohnwu/Magisk): The most famous root solution on Android
- [The Open GApps Project](https://opengapps.org): One of the most famous Google Apps packages solution
- [WSA-Kernel-SU](https://github.com/LSPosed/WSA-Kernel-SU) and [kernel-assisted-superuser](https://git.zx2c4.com/kernel-assisted-superuser/): The kernel `su` for debugging Magisk Integration
- [WSAGAScript](https://github.com/ADeltaX/WSAGAScript): The first GApps integration script for WSA
