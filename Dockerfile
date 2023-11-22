FROM nginx as web

FROM centos:centos8.4.2105 as centos
RUN sed -i -e 's/^mirrorlist/#mirrorlist/g' -e 's/^#baseurl=http:\/\/mirror/baseurl=http:\/\/vault/g' /etc/yum.repos.d/CentOS-*repo
RUN yum update -y && yum install -y nginx

FROM ubuntu:22.04 as ubuntu
RUN apt update && apt upgrade -y && apt install -y nginx