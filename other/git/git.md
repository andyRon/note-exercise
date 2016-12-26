[git简易教程](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)

http://marklodato.github.io/visual-git-guide/index-zh-cn.html

http://learngitbranching.js.org/


## [git简易教程](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)
### 简介
- 诞生
    + 在2002年以前，世界各地的志愿者把源代码文件通过diff的方式发给Linus，然后由Linus本人通过手工方式合并代码！
    + Linus坚定地反对CVS和SVN
    + 2002年，BitMover公司授权Linux社区免费使用商业的版本控制系统BitKeeper
    + 2005年，开发Samba的Andrew试图破解BitKeeper的协议（这么干的其实也不只他一个），被BitMover公司发现了
    + Linus花了两周时间自己用C写了一个分布式版本控制系统，这就是Git！一个月之内，Linux系统的源码已经由Git管理了！
    + Github
- 集中式vs分布式

### 安装Git
    + 安装配置
    ```
    git config --global user.name "Your Name"
    git config --global user.email "email@example.com"
    ```

### 创建版本库
- 版本库（repository）：一个目录里面的所有文件都可以被Git管理起来，每个文件的修改、删除，Git都能跟踪，以便任何时刻都可以追踪历史，或者在将来某个时刻可以“还原”。
- 基本操作
```
mkdir learngit
cd learngit
git init
git add readme.txt
git commit -m "wrote a readme file"
```

### 时光机穿梭
- 版本回退
    + `git status` 仓库当前的状态
    + `git diff readme.txt ` 
    + `git commit`就像文件修改到一定程度的时候保存的一个快照，一旦你把文件改乱了，或者误删了文件，还可以从最近的一个commit恢复
    + `git log`  显示从最近到最远的提交日志, `git log --pretty=oneline`查看简洁版。 前一段长字符是**commit id**（版本号，SHA1）
    + 回到上一个版本。Git中，**HEAD**表示当前版本，**HEAD^**是上一个版本，**HEAD^^**是上上一个版本，**HEAD~100**是往上一个版本。  
    `git reset --hard HEAD^`
    + `git reset --hard 38bb72e5a6d0`  回到某个特定版本（不管是未来的还是过去）， 版本号不一定完整的
    + `git reflog` 记录每一次命令，可用来查看版本号
- 工作区和暂存区
    + 工作区（Working Directory）：除了隐藏目录.git
    + 版本库（Repository）：隐藏目录.git
        * 暂存区：stage（或者叫index），`git add`添加的暂存区
        * 分支：第一次自动创建一个`mater`分支，以及指向master的一个指针叫HEAD。`git commit`就提交到分支
        ![](http://www.liaoxuefeng.com/files/attachments/001384907702917346729e9afbf4127b6dfbae9207af016000/0)
- 管理修改
    + Git优秀之处：Git跟踪并管理的是修改，而非文件。
    + 什么是修改？比如你新增了一行，这就是一个修改，删除了一行，也是一个修改，更改了某些字符，也是一个修改，删了一些又加了一些，也是一个修改，甚至创建一个新文件，也算一个修改。
    + `git diff HEAD -- readme.txt` 查看工作区和版本库里面最新版本的区别
    + 每次修改，如果不add到暂存区，那就不会加入到commit中。
- 撤销修改
    + `git checkout -- readme.txt`，把readme.txt文件在工作区的修改全部撤销（让这个文件回到最近一次git commit或git add时的状态），根据readme.txt的是否提交到暂存区分两种情况：
        * 一种是readme.txt自修改后还没有被放到暂存区，现在，撤销修改就回到和版本库一模一样的状态；
        * 一种是readme.txt已经添加到暂存区后，又作了修改，现在，撤销修改就回到添加到暂存区后的状态。
    + `git reset HEAD file` 可以把暂存区的修改撤销掉（unstage），重新放回工作区
        * `git reset`命令既可以回退版本，也可以把暂存区的修改回退到工作区。
- 删除文件
    + `git rm file`   有点类似把文件添加到暂存区，然后 `git commit` 
    + `git checkout -- test.txt` : 没有commit之前用checkout撤销删除
    + `git checkout`其实是用版本库里的版本替换工作区的版本，无论工作区是修改还是删除，都可以“一键还原”。

### 远程库



