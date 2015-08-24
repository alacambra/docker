FROM centos:6
MAINTAINER Albert Lacambra
RUN yum update -y
RUN yum clean all
RUN yum install wget -y
RUN yum install unzip -y
RUN yum install tar -y
RUN yum install gettext -y
RUN yum install openssh-server -y
RUN mkdir /var/run/sshd
#RUN /usr/bin/ssh-keygen -A
RUN echo 'root:secret’ | chpasswd
ADD ping.war ./ping.war
ADD jstadt.all.policy ./jstadt.all.policy
ADD jdk-8u60-linux-x64.tar.gz .
ENV JAVA_HOME /jdk1.8.0_60/
ENV PATH "$PATH":/${JAVA_HOME}/bin:.:
RUN ln -s /${JAVA_HOME}/bin/jjs /usr/bin/jjs