# Magisk on WSA

## Features
- Integrate Magisk and OpenGApps in a few clicks within minutes
- No Linux environment required for integration
- Keep each build up to date
- Support both ARM64 and x64

## Usage

1. Fork this repo
1. Go to Action tab and select workflow `Magisk`, click the run button and enter the needed infomation (magisk apk download link)
1. Wait the action complete and download the artifact
1. Uninstall WSA
1. Unzip the artifact
1. Enable developer mode on Windows
1. Open powershell with admin privileges and run `Add-AppxPackage -Register .\AppxManifest.xml` under the unzipped artifact directory
1. Launch WSA and enable developer mode, launch the file manager, and wait until the file manager popup
1. Run `adb connect localhost:58526` to connect to WSA and install Magisk app (the one you use to build) and launch it
1. Fix the environment as Magisk app will prompt and reboot
1. Enjoy by installing Riru and LSPosed

## Prebuilt Magisk

There's still a bug from Magisk that prevents it from running on WSA. So please don't use the official build yet. The download link of the prebuilt Magisk is: [https://raw.githubusercontent.com/LSPosed/MagiskOnWSA/main/magisk.apk](https://raw.githubusercontent.com/LSPosed/MagiskOnWSA/main/magisk.apk) and its source codes are on the magisk branch.

## Credits
- [Magisk](https://github.com/topjohnwu/Magisk): The most famous root solution on Android
- [The Open GApps Project](https://opengapps.org): One of the most famous Google Apps packages solution
- [WSA-Kernel-SU](https://github.com/LSPosed/WSA-Kernel-SU) and [kernel-assisted-superuser](https://git.zx2c4.com/kernel-assisted-superuser/): The kernel `su` for debugging Magisk Integration
- [WSAGAScript](https://github.com/ADeltaX/WSAGAScript): The first GApps integration script for WSA
