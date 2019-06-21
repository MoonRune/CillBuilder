##查看版本号
echo "查看工程gradle的版本号信息"
./gradlew -v

#查看机器上本地的版本
echo "查看运行机器上的gradle的版本号信息"
gradle -v

##打包编译并且文件进行上传
echo "准备进行编译与版本的发布"
./gradlew clean projectReport build uploadArchives
