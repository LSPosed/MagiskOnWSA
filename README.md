# 适用于 Windows 安卓子系统的 Magisk（带有谷歌软件）
## 功能

- 点击几下即可集成 Magisk 和 OpenGApps
- 无需 Linux 环境即可集成
- 使每个版本保持最新
- 支持64位和ARM64
- 支持除Aroma之外的所有OpenGApps变体（aroma不支持x86_64，请使用super代替）
- 修复VPN对话框不显示 (使用我们的[VpnDialogs app](https://github.com/LSPosed/VpnDialogs))
- 无人值守安装
- 在 Windows 11 中自动激活开发者模式
- 通过一键脚本更新到新版本，同时可以保留数据
- 包含所有语言
- 支持管理开始菜单图标 (需要手动安装 [WSAHelper](https://github.com/LSPosed/WSAHelper/releases/latest) 以使用此功能)

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

- 删除 Workflow runs 失败

    检查 Workblow 权限，应设置为“读写权限”

     ![permissions](https://user-images.githubusercontent.com/40033067/168649322-dadaafc9-dd31-4922-afe1-8aa933b7b036.png)

     阅读[Github文档](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository#configuring-the-default-github_token-permissions)以了解如何更改此设置

- 为什么要删除旧的Workflow runs

    保留旧的Workflow runs会占用大量的存储空间且可能被怀疑滥用，这可能导致封禁
- 我可以删除解压后的文件夹吗？

    不可以。
- 为什么Zip的大小与显示的不匹配？

   你下载的Zip已经过压缩，但Github显示的是未经压缩的大小
- 如何更新WSA？

    重新运行Github的Action，下载新Artifact，替换之前安装的内容并重新运行“Install.ps1”。不用担心，你的数据将被保留。
- How can I get the logcat from WSA?

    `%LOCALAPPDATA%\Packages\MicrosoftCorporationII.WindowsSubsystemForAndroid_8wekyb3d8bbwe\LocalState\diagnostics\logcat`
- 如何更新Magisk？

    执行与更新WSA相同的操作
- 如何破解safetynet？

    像所有其它模拟器一样，没办法。
- 没有启用虚拟化？

    如果未启用，“Install.ps1”会启用它。重启后，运行“Install.ps1”以安装WSA。如果仍然无法正常工作，则需要在BIOS中开启虚拟化，请百度寻找解决方法。
- 如何挂载系统分区为读写？

    在WSA中没办法，因为它是由Hyper-V以只读方式安装的。你也可以直接修改system.img。百度寻找解决方法。
- 我不能“adb connect localhost:58526”

    确保已启用开发者模式。如果问题仍然存在，请在WSA设置中查看IP地址再尝试“adb connnect ip:5555”
- Magisk在线模块列表为空？

    Magisk会删除在线模块存储库。你可以在本地安装模块，或通过“adb push module.zip /data/local/tmp”和“adb shell su -c magisk --install-module /data/local/tmp/module.zip”安装模块。
- 我可以使用Magisk 23.0或更低版本吗？

    不可以，Magisk有无法在WSA上运行的BUG。而Magisk 24+已修复这些BUG。所以你必须使用Magisk 24或更高版本。
- 我可以不使用Magisk吗？

    在ROOT解决方案中选择“none”。
- 如何更新Github Action脚本？

    1. 在你fork的存储库中，点击“fetch upstream”
        ![fetch](https://docs.github.com/assets/cb-33284/images/help/repository/fetch-upstream-drop-down.png)
    1. 然后点击“fetch and merge”
        ![merge](https://docs.github.com/assets/cb-128489/images/help/repository/fetch-and-merge-button.png)

## 贡献

- [Magisk](https://github.com/topjohnwu/Magisk): Android上最著名的ROOT解决方案
- [The Open GApps Project](https://opengapps.org): 最著名的谷歌软件解决方案之一
- [WSA-Kernel-SU](https://github.com/LSPosed/WSA-Kernel-SU) 和 [kernel-assisted-superuser](https://git.zx2c4.com/kernel-assisted-superuser/): 用于调试Magisk Integration 的内核“su”
- [WSAGAScript](https://github.com/ADeltaX/WSAGAScript): WSA的第一个GApps集成脚本
