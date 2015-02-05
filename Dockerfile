# Based on official centos 6
FROM centos:centos6
MAINTAINER Arthur
# Install some common utilities
RUN yum install -y yum-utils
RUN yum install -y wget
RUN yum install -y epel-release
RUN yum install -y python-argparse
ENV TERM xterm

# Basic tomcat installation
RUN yum install -y tomcat
EXPOSE 8080
# Modified start script that stays in foreground
ADD tomcat-fg /usr/sbin/
ENV JAVA_OPTS="-d64 -Xmn512m -Xms1024m -Xmx5120m -XX:PermSize=128m -XX:MaxPermSize=512m"
