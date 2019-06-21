#使用jdk8
# export JAVA_HOME=/usr/admin/jdk1.8.0_25
#使用jenkins
./gradlew clean build uploadArchives -DdeployVersion=${MUPP_VERSION_NAME}
