本文与[P.M.D.E.](https://github.com/GBLodb/GBLodb/blob/main/personalModpackDevExperience.md)不同, 讲解了本人的MultiMC+GitHub联动方案及部署教程. 不见得是最好的方案, 但依然是本人自己最得心应手的方案.

----

1. 首先按照常规方法, 在MultiMC中新建一个普通实例, 其名字尽量不要包含空格和符号.
2. 在GitHub创建同名仓库. 关于仓库创建, 详见P.M.D.E. ***(注: 此处的创建仓库仅指在GitHub网站页面创建远程仓库)***
3. **将创建的实例中的所有文件移动到其他位置, 保持此实例文件夹为空**, 将仓库Clone到此文件夹.
4. 将文件移动回来.
5. 将manifest.json和modlist.html复制到实例文件夹中.
6. 在实例文件夹中, 新建".gitignore"文件, 内容复制[https://github.com/ProjectHDS/Herodotus/blob/master/.gitignore](https://github.com/ProjectHDS/Herodotus/blob/master/.gitignore), 并按实际情况增减.
7. 在实例文件夹中, 新建"artifacts"文件夹, 并在其中新建一个随意名称的空文件.
8. 将所有文件commit并push.
9. 在实例文件夹中, 新建"build.sh"文件, 内容复制[https://github.com/ProjectHDS/Herodotus/blob/master/build.sh](https://github.com/ProjectHDS/Herodotus/blob/master/build.sh), 并按照实际情况更改关键字. 保存并push.
10. 进入GitHub仓库页面, 新建一个Simple workflow, 其配置文件内容复制[https://github.com/ProjectHDS/Herodotus/blob/master/.github/workflows/dev.yml](https://github.com/ProjectHDS/Herodotus/blob/master/.github/workflows/dev.yml), 并按照实际情况更改.

至此, GitHub Action打包功能已经理论上可以工作了, 日后每次push都会自动打包, 只需在workflow中下载最新的Artifact File即可.

至于MMC联动, 已经在移动文件和Clone仓库的时候完成了, 日后正常开发, 并随时commit即可.

~~并不~~值得一提的是, 本方案中GitHub Action打包的原理仅是压缩文件等, 只负责打包, 并不会检查任何脚本语法错误等问题.

----

***本文中所有直接引用使用MPL v2.0协议的Herodotus仓库中文件的链接, 会在近日更改到使用WTFPL协议的本文所在的仓库.***