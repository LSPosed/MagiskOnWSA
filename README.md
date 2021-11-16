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
1. Input the download link of Magisk and select the [OpenGApps variant](https://github.com/opengapps/opengapps/wiki#variants) (none is no OpenGApps) you like, select the root solution (none means no root) and click **Run workflow**
    ![Run Workflow](https://docs.github.com/assets/images/actions-manually-run-workflow.png)
1. Wait for the action to complete and download the artifact
    ![Download](https://docs.github.com/assets/images/help/repository/artifact-drop-down-updated.png)
1. Unzip the artifact and uninstall WSA if you have an official installation or replace the previously unzipped artifact if you have a manual installation
1. Enable developer mode on Windows
1. Right-click `Install.ps1` and select `Run with PowerShell`
1. Launch WSA and enable developer mode, launch the file manager, and wait until the file manager popup
1. If you use Magisk as root solution, make sure you have [Platform tools](https://developer.android.com/studio/releases/platform-tools), run `adb connect localhost:58526` to connect to WSA, `adb install magisk.apk` to install Magisk App (the one you used to build, included in the zip artifacts as `Magisk.apk`), launch it and fix the environment as the Magisk app will prompt and reboot (sometimes it keeps prompting even after environment fix, just ignore it)
1. Enjoy by installing LSPosed-zygisk with zygisk enabled or Riru and LSPosed-riru

## Video Demo

[demo](https://user-images.githubusercontent.com/5022927/139580565-35971031-7258-40bf-93e2-49a0750156f3.mp4)

## Credits
- [Magisk](https://github.com/topjohnwu/Magisk): The most famous root solution on Android
- [The Open GApps Project](https://opengapps.org): One of the most famous Google Apps packages solution
- [WSA-Kernel-SU](https://github.com/LSPosed/WSA-Kernel-SU) and [kernel-assisted-superuser](https://git.zx2c4.com/kernel-assisted-superuser/): The kernel `su` for debugging Magisk Integration
- [WSAGAScript](https://github.com/ADeltaX/WSAGAScript): The first GApps integration script for WSA
