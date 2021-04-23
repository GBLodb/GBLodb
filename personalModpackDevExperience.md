~~好吧，写这东西是因为实在无聊了~~

---

本文旨在分享一点本人在整合包开发方面的经验，大部分内容均为本人个人推荐.

面向无整合包开发经验，不知从何开始的初学者.

指南部分欢迎批评指正，感想部分不接受任何反驳.

本文同时包含简易创建并运用整合包GitHuib仓库的指南，也是本人强烈推荐进行的步骤。如果实在不方便访问GitHub，或就是对在GitHub开源耿耿于怀，可以跳过相关部分.

**阅读本文，代表您已经具有基本的科学上网能力，或能忍受经常通过大量的hCaptcha验证并有等待大量境外网站加载的耐心，亦或者你家网就是没啥问题，GitHub/CurseForge无压力.**

---

先讲点基础知识, 各种乱七八糟的.

魔改整合包聚集的版本大多是1.12.2和1.7.10. Mojang在这两个版本和下一个版本之间拖了很久, 此期间就产生了大量模组和此版本玩家. 于是，这两个版本的模组较多, 玩家也多, 且是两大魔改基础模组[CraftTweaker](https://www.curseforge.com/minecraft/mc-mods/crafttweaker)(下文简称CrT)和[MineTweaker3](https://www.curseforge.com/minecraft/mc-mods/minetweaker3)(下文简称MT)的老家,也理所应当的成为了魔改整合包聚集最多的两个版本. 至于很多人仍然忠于1.7.10，每个人的理由都不同, 本人仍偶尔玩1.7.10的原因则是很多老牌模组(如Reika全家桶, GregTech5,6).

CrT和MT都使用一门封装语言ZenScript(下文简称ZS)作为底版, 你需要通过编写ZenScript代码, 使用各个模组提供的Method(方法)和你自己的脑子来实现你想要的功能.

1.12.2请使用CrT，1.7.10请使用MT. 不是说1.12.2没有MT，也不是说1.7.10没有CrT，是因为这两个模组在对应的版本发挥最好，在其它版本多少沾点瘸腿(CrT除外，其在更高版本上也是首选).

以及一些几乎必装的附属/推荐模组:

Crt：[ContentTweaker](https://www.curseforge.com/minecraft/mc-mods/contenttweaker)(下文简称CoT),允许你简单创建自定义物品，方块等游戏内容；[ModTweaker](https://www.curseforge.com/minecraft/mc-mods/modtweaker), 为CrT添加更多模组兼容.

MT：[CustomStuff3](https://www.curseforge.com/minecraft/mc-mods/custom-stuff-3)(下文简称CS3), 和CoT差不多, 但其在1.12.2的延续版CS4十分拉跨，不推荐使用；另外，1.7.10也有ModTweaker，功能相同.

ZenScript是一门封装语言, 本身并不是很难学习(其实也没太多好学的), 重要的是你如何灵活运用各种Method. 最终目的固然是实现你想要的功能, 但追求代码整洁高效也是很有意思的.

再谈谈Pastebin(Ubuntu Pastebin, paste.ee等), 其作用是快捷方便的分享代码/日志片段给他人, 便于求助等用途, 而免受接收多个无用文件之苦，请灵活运用Pastebin, 共同创建一个更加美好的世界.

不多累赘，下面正文.

---

**1. 挑选工具，搭建环境**

开发整合包最常用，也是本人在使用/强力推荐的文本编辑器，既是[Visual Studio Code (VSCode)](https://code.visualstudio.com/), 一款微软提供的, 基本写什么都很好用的免费文本编辑器, 只要安装某昨开发的ZenScript拓展, 即可获得代码高亮. 如果偏要问高亮是什么，大致就是你看别人写码时屏幕上花花绿绿的文本上色, 这些上色是有规律的, 可以协助你阅读和编写代码.

1. 安装方面不多赘述, 在VSCode官网下载并安装即可
2. 启动VSCode, 点击进入左方的拓展菜单

![](image/personalModpackDevExperience/1615008091699.png)

3. 依次搜索并安装ZenScript(yesterday17), Rainbow Brackets(2gua), Minecraft Lang Colorizer(zz5840)和mcmeta(xTeal). 如有需要可另外安装GitLens-Git supercharged(Eric Amodio)和Tabnine Autocomplete(TabNine)

![](image/personalModpackDevExperience/1615008160198.png)![](image/personalModpackDevExperience/1615008168282.png)

![](image/personalModpackDevExperience/1615008307329.png)![](image/personalModpackDevExperience/1615008325113.png)

![](image/personalModpackDevExperience/1615008341263.png)![](image/personalModpackDevExperience/tn.png)

4. 重启VSCode, 享受代码高亮

**不要使用Notepad++和Windows自带的记事本写代码，眼睛会瞎，向别人寻求帮助时也很难得到答复.**

接着是启动器(我也不知道我为什么没先写启动器), 选择启动器取决于你是否有稳定科学上网能力和是否拥有Java版正版账号，如果你同时拥有两者, 那么首选固然是[MultiMC](https://multimc.org/)，功能强大的启动器, 只不过只有登陆正版后才能启动游戏. 退而求其次，或者你就是喜欢/习惯，可以使用[HMCL](https://github.com/huanghongxun/HMCL/releases)，同样是不错的启动器，但本人更倾向于前者的实例管理系统。

然后是可选的GitHub仓库, 在你跳过前，容我介绍一下创建并运用GitHub仓库的好处：

1. Commit History系统可以帮助你查询，对比历史代码.
2. 便于团队协作开发.
3. 不必使用PasteBin, 可以直接使用仓库对应文件的链接分享代码(别把日志也搞上来)。

如果你对以上好处都不感兴趣也不在乎，那你可以跳过这一部分了.

*有关联动GitHub Action进行打包的新架构方案, 见[aboutMMCPlusGithub.md](https://github.com/GBLodb/GBLodb/blob/main/aboutMMCPlusGithub.md).*

首先安装一个Git图形端, 本人推荐[SourceTree](https://www.sourcetreeapp.com/), 但其实[GitHub Desktop](https://desktop.github.com/)也够用.

接下来，创建Github仓库，进入GitHub主页面，点击"New".

![](image/personalModpackDevExperience/1613826794846.png)

在Repository Name中输入你整合包的名称, 简介要不要写可选，选中Public.

![](image/personalModpackDevExperience/1613826902868.png)

勾选"Add a README file", "Choose a license", 此处选择GNU GPLv3. 当然你也可以选择其他协议，或取消勾选"Choose a license", 日后自行添加其他自定义协议文件. 点击Create repository, 创建仓库.

![](image/personalModpackDevExperience/1613827209488.png)

接下来，在MultiMC中创建同名实例.

![](image/personalModpackDevExperience/1613827802361.png)

接下来，进入SourceTree界面,点击Clone

![](image/personalModpackDevExperience/1613827497637.png)

输入你仓库的地址，将路径设置为MultiMC示例文件夹里的同名文件夹\\.minecraft，名称设置为你整合包的名称, 点击Clone.

![](image/personalModpackDevExperience/1613827889537.png)

接着在.minecraft目录下创建.gitignore文件.

![](image/personalModpackDevExperience/1613828002618.png)

输入以下内容，保存.

```
$ cat .gitignore
#Whitelist
/*

#Folders
!/config/
!/patchouli_books
!/resources
!/scripts
!/structures

#Files
!/.gitignore
!/README.md
````

打开SourceTree, 点击StageAll.

![](image/personalModpackDevExperience/1613828261385.png)

写明你对仓库所做的更改，点击Commit.

![](image/personalModpackDevExperience/1613828322441.png)

最后点击Push，你的更改就推送到仓库里了.

![](image/personalModpackDevExperience/1613828376987.png)

仓库部分至此完成，日后可以通过同样的操作进行commit并push.

团队协作时，如需要获取别人的改动，点击Pull即可.

![](image/personalModpackDevExperience/1613828537650.png)

日后开发中，使用VSCode打开.minecraft文件夹，再进行编辑即可.

---

*未完工，敬请期待*
