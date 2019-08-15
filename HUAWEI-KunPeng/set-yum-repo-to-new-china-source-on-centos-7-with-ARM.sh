# @author: http://www.github.com/muhualing
# @time: 2019-08-11T03:06:47.101Z
# Overview: This is a shell script to update yum default repo to the repo of alibaba in Centos 7.4 64bit with ARM arch.

# Backup your default yum repo
cp -a /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak

# Download new repo from china supporter
# 1. alibaba's repo
# wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-altarch-7.repo
# 2. huaweicloud's repo
wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.huaweicloud.com/repository/conf/CentOS-AltArch-7.repo
# Clean default yum cache
yum clean all
# refresh cache for new yum repo
yum makecache