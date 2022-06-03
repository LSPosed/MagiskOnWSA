# 适用于 Windows 安卓子系统的 Magisk（带有谷歌软件）
## 功能

- 点击几下即可集成 Magisk 和 OpenGApps
- 无需 Linux 环境即可集成
- 使每个版本保持最新
- 支持64位和ARM64
- 支持除Aroma之外的所有OpenGApps变体（aroma不支持x86_64，请使用super代替）
- 修复 DocumentUI 的外部存储访问
- 修复VPN对话框不显示 (使用我们的[VpnDialogs app](https://github.com/LSPosed/VpnDialogs))
- 无人值守安装
- 在 Windows 11 中自动激活开发者模式
- 通过一键脚本更新到新版本，同时可以保留数据
- 包含所有语言
- 支持管理开始菜单图标 (需要手动安装 [WSAHelper](https://github.com/LSPosed/WSAHelper/releases/latest) to use this feature)

## 视频教程

https://user-images.githubusercontent.com/5022927/145696886-e13ebfc1-ff25-4410-893e-d3e517af70ea.mp4

## 文字教程

1. 加星（如果你喜欢）并 fork 这个 repo (需要保持公开, 不支持私人 repo)
1. 在你已经fork的repo中点击 **Action** 选项卡
    ![Action Tab](https://docs.github.com/assets/images/help/repository/actions-tab.png)
1. 点击左边的 **Build WSA** 工作流
    ![Workflow](https://docs.github.com/assets/images/actions-select-workflow.png)
1. 在工作流运行列表上方点击 **Run workflow**
    ![Run Workflow](https://docs.github.com/assets/images/actions-workflow-dispatch.png)
1. 选择你喜欢的 Magisk 的版本和[ OpenGApps 变体](https://github.com/opengapps/opengapps/wiki#variants) (none 就是没有 OpenGApps) , 然后选择 root 方式（none 就是没有 root），最后选择 WSA 版本和体系结构（一般是64位），并点击 **Run workflow**
    ![Run Workflow](https://docs.github.com/assets/images/actions-manually-run-workflow.png)
1. 等待 Action 完成并下载 Artifact，**不要使用 IDM 或 ARM 等多线程下载器下载**
    ![Download](https://docs.github.com/assets/images/help/repository/artifact-drop-down-updated.png)
1. 解压 Artifact
    - 网页中显示的是未压缩的大小，你下载的 Zip 将被压缩。所以你下载的 Zip 大小会比网页中显示的小很多.
1. 右键“Install.ps1”并点击“使用 PowerShell 运行
    - 如果你之前安装过 MagiskOnWSA，它会自动卸载以前的版本同时 **保留所有用户数据** 并安装新版本，所以无需担心你的数据
    - 如果你已经安装了应用商店里的 WSA 子系统，则应先将其卸载（如果你想保留数据，可以在安装前备份 “%LOCALAPPDATA%\Packages\MicrosoftCorporationII.WindowsSubsystemForAndroid_8wekyb3d8bbwe\LocalCache\userdata.vhdx”并在安装后恢复备份）（如果要恢复图标到开始菜单，请安装[WSAHelper](https://github.com/LSPosed/WSAHelper/releases/latest).）
    - 如果弹出的窗口消失且 **没有请求管理员许可**，WSA也没有安装成功，你应该以管理员身份手动运行“Install.ps1”
        1. 按“Win+X”并点击“Windows 终端（管理员）”
        2. 输入“cd "{X:\path\to\your\extracted\folder}"”并按回车键，记得更换“{X:\path\to\your\extracted\folder}”，包括“{}”，例如“cd "D:\WSA"”
        3. 输入“PowerShell.exe -ExecutionPolicy Bypass -File .\Install.ps1”并按回车
        4. 脚本将运行并安装 WSA
        5. 如果此解决方法不起作用，则你的电脑可能不支持 WSA
1. Magisk/Play商店将启动。通过安装 LSPosed-zygisk 并启用 zygisk 或 Riru 和 LSPosed-riru 来享受 WSA

## 常见问题

- Actions workflow task `Delete workflow runs` run Failed

    Check workflow permissions, should be `Read and write permissions`

     ![permissions](https://user-images.githubusercontent.com/40033067/168649322-dadaafc9-dd31-4922-afe1-8aa933b7b036.png)

     Read the [Github Docs](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository#configuring-the-default-github_token-permissions) to find out how to change this setting

- Why should delete old workflow runs

    Keeping old workflow runs can take up a lot of storage resources and is suspected to be abusive, which can lead to banning
- Can I delete the unzipped folder?

    No.
- Why the size of the zip does not match the one shown?

   The zip you downloaded is compressed and Github is showing the uncompressed size.
- How can I update WSA to new version?

    Rerun the Github action, download the new artifact, replace the content of your previous installation and rerun `Install.ps1`. Don't worry, your data will be preserved.
- How can I get the logcat from WSA?

    `%LOCALAPPDATA%\Packages\MicrosoftCorporationII.WindowsSubsystemForAndroid_8wekyb3d8bbwe\LocalState\diagnostics\logcat`
- How can I update Magisk to new version?

    Do the same as updating WSA
- How to pass safetynet?

    Like all the other emulators, no way.
- Virtualization is not enabled?

    `Install.ps1` helps you enable it if not enabled. After rebooting, rerun `Install.ps1` to install WSA. If it's still not working, you have to enable virtualization in BIOS. That's a long story so ask Google for help.
- How to remount system as read-write?

    No way in WSA since it's mounted as read-only by Hyper-V. You can modify system by making a Magisk module. Or directly modify system.img. Ask Google for help.
- I cannot `adb connect localhost:58526`

    Make sure developer mode is enabled. If the issue persists, check the IP address of WSA in the setting page and try `adb connect ip:5555`.
- Magisk online module list is empty?

    Magisk actively remove online module repository. You can install module locally or by `adb push module.zip /data/local/tmp` and `adb shell su -c magisk --install-module /data/local/tmp/module.zip`.
- Can I use Magisk 23.0 stable or lower version?

    No. Magisk has bugs preventing itself running on WSA. Magisk 24+ has fixed them. So you must use Magisk 24 or higher version.
- How can I get rid of Magisk?

    Choose `none` as root solution.
- Github Action script is updated, how can I synchronize it?

    1. In your fork repository, click `fetch upstream`
        ![fetch](https://docs.github.com/assets/cb-33284/images/help/repository/fetch-upstream-drop-down.png)
    1. Then and click `fetch and merge`
        ![merge](https://docs.github.com/assets/cb-128489/images/help/repository/fetch-and-merge-button.png)

## Credits

- [Magisk](https://github.com/topjohnwu/Magisk): The most famous root solution on Android
- [The Open GApps Project](https://opengapps.org): One of the most famous Google Apps packages solution
- [WSA-Kernel-SU](https://github.com/LSPosed/WSA-Kernel-SU) and [kernel-assisted-superuser](https://git.zx2c4.com/kernel-assisted-superuser/): The kernel `su` for debugging Magisk Integration
- [WSAGAScript](https://github.com/ADeltaX/WSAGAScript): The first GApps integration script for WSA
