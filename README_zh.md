# Magisk(Windows11 安装子系统专版)

## 特性
- 只需按几下分分钟将Magisk 和 OpenGApps 整合
- 整合工作不需要Linux环境
- 保持每一次的build最新
- ARM64 和 x64都支持
- 所有OpenGApps变体(版本)
- 修复外部存储的DocumentUI

## 用法

1. Star (你愿意的话) 并 fork 这个 repo
1. 到你fork的repo的 **Action** 页面 
    ![Action Tab](https://docs.github.com/assets/images/help/repository/actions-tab.png)
1. 在左侧栏点击 **Magisk** workflow
    ![Workflow](https://docs.github.com/assets/images/actions-select-workflow.png)
1. 在workflow上方, 选择 **Run workflow**
    ![Run Workflow](https://docs.github.com/assets/images/actions-workflow-dispatch.png)
1. 输入Magisk的下载链接 然后选择你喜欢的[OpenGApps 变体](https://github.com/opengapps/opengapps/wiki#variants) (none 是指不安装 OpenGApps) 然后点击 **Run workflow**
    ![Run Workflow](https://docs.github.com/assets/images/actions-manually-run-workflow.png)
1. 等待action完成 然后下载 artifact
    ![Download](https://docs.github.com/assets/images/help/repository/artifact-drop-down-updated.png)
1. 解压artifact 然后卸载 WSA 如果你有一个官方版本, 或者替换现有的已解压的artifact如果你有手动安装的WSA
1. 在Windows开启开发者模式
1. 右键点击 `Install.ps1` 然后选择`Run with PowerShell`
1. 启动WSA然后启用开发者模式, 启动文件管理器, 然后等到文件管理器启动
1. 确认你有[Platform tools](https://developer.android.com/studio/releases/platform-tools), 运行 `adb connect localhost:58526` 以连接WSA,用 `adb install magisk.apk` 来安装Magisk App (你用于build的那个) 然后启动它
1. 当Magisk app提示时修复环境并重启 (有时Magisk一直提示修复环境即使已经修复过了, 忽略它就行了)
1. 安装Riru和LSPosed并享受吧

## 演示视频

[demo](https://user-images.githubusercontent.com/5022927/139580565-35971031-7258-40bf-93e2-49a0750156f3.mp4)


## 自编译的Magisk

这里仍然有一个来自Magisk的bug阻止Magisk在WSA运行. 所以请先不要使用官方build的版本. 自编译版本的Magisk的下载链接是: [https://raw.githubusercontent.com/LSPosed/MagiskOnWSA/main/magisk.apk](https://raw.githubusercontent.com/LSPosed/MagiskOnWSA/main/magisk.apk) and its source codes are on the magisk branch.

## Credits
- [Magisk](https://github.com/topjohnwu/Magisk): 最有名的Android root方案
- [The Open GApps Project](https://opengapps.org): 最出名的Google Apps 安装包解决方案
- [WSA-Kernel-SU](https://github.com/LSPosed/WSA-Kernel-SU) 和 [kernel-assisted-superuser](https://git.zx2c4.com/kernel-assisted-superuser/):  用于调试Magisk整合的`su` 内核 
- [WSAGAScript](https://github.com/ADeltaX/WSAGAScript): 第一个将GApps整合入WSA的脚本

