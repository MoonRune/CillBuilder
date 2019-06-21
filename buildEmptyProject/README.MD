### 工程创建说明   
1. 当前工程脚本用于创建打包成aar的脚本内容   
2. 脚本运行方式  sh build.sh -args（参数的具体的含义与可选性如下表所示） (-h 工程要创建到本地的哪个路径，参数可选默认创建至当前脚本的运行的路径)  

| 参数 | 是否可选参数 | 参数含义 |
|------|-------|--------|
| -p|必选参数 | 目标工程的名称  | 
| -a|必选参数 | 目标工程中manifest文件中的package的名称 | 
| -h | 可选参数 | 目标工程的创建的本地路径，路径必须存在且有效 | 
| -t | 可选参数 | 参数值为 jar或者是aar，输入其他值默认为 aar，也就是创建aar工程 |

示例：
sh build.sh -p AliSXXX -a com.alibaba.android.intl.xxx.xxx -h ~/temp/workspace   
sh build.sh -t jar -p AliJar -a com.alibaba.android.intl.xxx.xxx -h ~/temp/workspace 