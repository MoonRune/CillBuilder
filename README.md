

ICBU Sourcing SDK组介绍
--------------
* [Android端开发环境的搭建与工程类型](http://gitlab.alibaba-inc.com/SourcingAndroidSDK/env_build/wikis/main_project_setup_development_env)
* [工程依赖方式](http://gitlab.alibaba-inc.com/SourcingAndroidSDK/env_build/wikis/main_project_setup_development_dependency)
* [SDK的打包与版本的发布](http://gitlab.alibaba-inc.com/SourcingAndroidSDK/env_build/wikis/main_project_setup_development_sdkpub)
* [主工程的打包](http://gitlab.alibaba-inc.com/SourcingAndroidSDK/env_build/wikis/main_project_mtl_publish)   


## 更多说明请查看Wiki
* [Wiki链接](http://gitlab.alibaba-inc.com/SourcingAndroidSDK/env_build/wikis/home)

### 代码规范，分支管理，版本管理
* [无线研发流程规范](http://docs.alibaba-inc.com:8090/pages/viewpage.action?pageId=199690040)请参考已有的流程规范    
* [分支管理](http://gitlab.alibaba-inc.com/SourcingAndroidSDK/env_build/wikis/specification/spec_branch_manager_v1)
* [版本管理](http://gitlab.alibaba-inc.com/SourcingAndroidSDK/env_build/wikis/specification/spec_version_manager_v1)
* [代码规范](http://gitlab.alibaba-inc.com/SourcingAndroidSDK/env_build/wikis/specification/spec_coding_spec_v1)


### 创建一个空工程   
下载当前目录中的buildEmptyProject脚本，按照脚本的说明进行创建  

### envsetup工具集使用

1. 下载`envsetup.sh`到本地代码的根目录;
2. 执行`source envsetup.sh`即可使用里面自带的工具集.
3. 使用`hmm`可以参看一些常用命令:

```
$ hmm
// 主要命令
- cgrep:     Greps on all local C/C++ files.
- ggrep:     Greps on all local Gradle files.
- jgrep:     Greps on all local Java files.
- resgrep:   Greps on all local res/*.xml files.
- mangrep:   Greps on all local AndroidManifest.xml files.
- mgrep:     Greps on all local Makefiles files.
- sepgrep:   Greps on all local sepolicy files.
- sgrep:     Greps on all local source files.
```

> 里面还有一些adb shell的命令, 大家自行发掘吧.

### 利用git hooks做代码格式检测

[使用`pre-commit` hook来做代码格式检测](http://gitlab.alibaba-inc.com/bianyue.lmj/git-templates)


