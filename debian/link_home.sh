#!/usr/bin/env bash

echo "由于根目录的存储空间有限，"
echo "脚本将您的home目录链接至外挂硬盘。"

if [ $# -eq 0 ]; then
  read -p "请输入您的公司邮箱前缀：" username
elif [ $# -eq 1 ]; then
  username=$1
else
  echo "脚本只接收一个参数：您的公司邮箱前缀"
  exit
fi

if [ -L "/home/${username}" ]; then
  echo "该用户的home目录已经以软链接的形式存在。"
  echo "如需重置，请手动删除该软链接后再执行本脚本。"
  exit
fi

#adduser ${username}
usermod -a -G ai_group ${username}

su - ${username} -c "exit"
mount_path="/mnt/storage01/home/"
ls -al /home/ | grep ${username}
ls -al ${mount_path} | grep ${username}

if [ ! -d "${mount_path}" ]; then
  mkdir "${mount_path}"
  chmod 755 "${mount_path}"
fi
if [ -d "${mount_path}${username}" ]; then
  echo "${mount_path}${username}目录已经存在。"
  echo "如需覆盖，请手动删除该目录后再执行本脚本。"
  exit
fi
mv /home/${username} ${mount_path}
ln -s ${mount_path}${username} /home/${username}
chown -h ${username}:ai_group /home/${username}

ls -al /home/ | grep ${username}
ls -al ${mount_path} | grep ${username}

su - ${username}
touch /home/${username}/.presto_history