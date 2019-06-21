

projectType="aar"
projectName=""
packageName=""
operationPath="./"
targetPath=""
SOURCEPATH="Main/src/main/java"

NEXUS_SNAPSHOT_URL='\"http:\/\/111\/nexus\/content\/repositories\/snapshots\"'
NEXUS_SNAPSHOT_USER_NAME='\"admin\"'
NEXUS_SNAPSHOT_USER_PASSWORD='\"admin\"'

NEXUS_RELEASE_URL='\"http:\/\/111\/nexus\/content\/repositories\/releases\"'
NEXUS_RELEASE_USER_NAME='\"admin\"'
NEXUS_RELEASE_USER_PASSWORD='\"admin\"'


#目录创建后，要删除的文件
delete_files=(.DS_Store
.gradle
.idea
gradle/.DS_Store
Main/.DS_Store
Main/Main.iml
source.iml
)


#要替换packageName的文件列表
PROJECTMANIFEST="app/src/main/AndroidManifest.xml"

while getopts ":p:a:t:h:" opt; do
  case $opt in
    p)
        projectName=$OPTARG
      ;;

    a)
        packageName=$OPTARG
       ;;
    t)
        projectType=$OPTARG
      ;;
    h)
        targetPath=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

echo "projectType="${projectType}

#判断工程类型 
if [ "$projectType" != "jar" ]; then
  projectType="aar"
  project_name_files=(build.gradle
  app/build.gradle 
)

#要替换projectName的文件名称
else 
  project_name_files=(build.gradle
  Main/build.gradle 
)
fi

#检查是否有输入项目名称
if [ "$projectName" != "" ]; then
    echo "projectName="${projectName}
else
    echo "You must input projectName by args -p" 
    exit 1
fi

# 检查输入的package的名称
if [ "$packageName" == "" ]; then
  echo "You must input packageName by args -a" ;
  exit 1
else
   echo "packageName="${packageName} 
fi

# 检查目标路径
if [ "$targetPath" != "" ]; then
    if [ ! -x "${targetPath}" ]; then
       echo "Target path {targetPath} is not exist. Project will create in current path !!!"  
       targetPath=$(pwd)    
    else 
        echo "targetPath: "${targetPath}   
    fi
else
   targetPath=$(pwd)    
fi


#打印当前目录
operationPath=$(pwd)
echo ${operationPath} 

# 开始创建空工程
echo "Start to create empty project ${projectName} with packageName ${packageName} in path: ${targetPath}"

# 切换到目标路径进行操作
cd ${targetPath}

if [ ! -x "${projectName}" ]; then
  mkdir ${projectName} 
else
   echo "Target project  ${projectName} is exist, you must remove it by yourself!!!"  
   exit 1
fi


#复制原始文件夹中的内容到目标文件夹
cp -R ${operationPath}/source/${projectType}/. ${projectName}/

#删除目标文件夹中不需要的文件
cd ${projectName}
for var in ${delete_files[*]};
do
echo ${var}
rm -rf ${var}
done

#替换指定文件中的project的名称
for var in ${project_name_files[*]};
do
sed  "" ${var}  >${var}.bak
  mv ${var}.bak ${var}
done

#替换nexus
# for var in ${project_name_files[*]};
# do
# sed  "s/_target_name_/${projectName}/g; s/_nexus_snapshots_url_/${NEXUS_SNAPSHOT_URL}/g; s/_nexus_snapshots_user_name_/${NEXUS_SNAPSHOT_USER_NAME}/g; s/_nexus_snapshots_user_password_/${NEXUS_SNAPSHOT_USER_PASSWORD}/g; s/_nexus_releases_url_/${NEXUS_RELEASE_URL}/g; s/_nexus_releases_user_name_/${NEXUS_RELEASE_USER_NAME}/g; s/_nexus_releases_user_password_/${NEXUS_RELEASE_USER_PASSWORD}/g" ${var}  >${var}.bak
#   mv ${var}.bak ${var}
# done

for var in ${project_name_files[*]};
do
sed  "s/_target_name_/${projectName}/g" ${var}  >${var}.bak
  mv ${var}.bak ${var}
done

for var in ${project_name_files[*]};
do
sed  "s/_package_name_/${_package_name_}/g" ${var}  >${var}.bak
  mv ${var}.bak ${var}
done

for var in ${project_name_files[*]};
do
sed  "s/_nexus_snapshots_url_/${NEXUS_SNAPSHOT_URL}/g" ${var}  >${var}.bak
  mv ${var}.bak ${var}
done

for var in ${project_name_files[*]};
do
sed  "s/_nexus_snapshots_user_name_/${NEXUS_SNAPSHOT_USER_NAME}/g" ${var}  >${var}.bak
  mv ${var}.bak ${var}
done

for var in ${project_name_files[*]};
do
sed  "s/_nexus_snapshots_user_password_/${NEXUS_SNAPSHOT_USER_PASSWORD}/g" ${var}  >${var}.bak
  mv ${var}.bak ${var}
done

for var in ${project_name_files[*]};
do
sed  "s/_nexus_releases_url_/${NEXUS_RELEASE_URL}/g" ${var}  >${var}.bak
  mv ${var}.bak ${var}
done

for var in ${project_name_files[*]};
do
sed  "s/_nexus_releases_user_name_/${NEXUS_RELEASE_USER_NAME}/g" ${var}  >${var}.bak
  mv ${var}.bak ${var}
done

for var in ${project_name_files[*]};
do
sed  "s/_nexus_releases_user_password_/${NEXUS_RELEASE_USER_PASSWORD}/g" ${var}  >${var}.bak
  mv ${var}.bak ${var}
done

#替换包名称
if [ "$projectType" != "jar" ]; then
  sed  "s/_package_name_/${packageName}/g" ${PROJECTMANIFEST}  >${PROJECTMANIFEST}.bak
  mv ${PROJECTMANIFEST}.bak ${PROJECTMANIFEST}
fi



#在src目录创建对应的包路径信息
# cd ${operationPath}
# cd ${targetPath}
# cd ${projectName}
# cd ${SOURCEPATH}

# array_str=${packageName}
# for var in ${array_str[*]};
# do
#   echo ${var}
# done

#切换目标文件夹
cd ${operationPath}
cd ${targetPath}

#打印最终的输出结果
echo "Project ${projectName} has been created in ${targetPath}/"

