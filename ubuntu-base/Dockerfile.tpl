FROM ubuntu
MAINTAINER Albert Lacambra
RUN apt-get update -y
RUN apt-get clean all
RUN apt-get install wget -y
RUN apt-get install unzip -y
RUN apt-get install tar -y
RUN apt-get install gettext -y
RUN apt-get install openssh-server -y

RUN mkdir /var/run/sshd
RUN /usr/bin/ssh-keygen -A

RUN useradd -ms /bin/bash alacambra

RUN echo 'root:${ROOT_PSW}' | chpasswd
RUN echo 'alacambra:${ALACAMBRA_PSW}' | chpasswd
# RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

ADD ping.war ./ping.war
ADD jstadt.all.policy ./jstadt.all.policy
ADD jdk-8u60-linux-x64.tar.gz .
ENV JAVA_HOME /jdk1.8.0_60/
ENV PATH $PATH:${JAVA_HOME}bin:.:
RUN ln -s /${JAVA_HOME}/bin/jjs /usr/bin/jjs
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
