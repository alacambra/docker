FROM alacambra/ubuntu-java
MAINTAINER Albert Lacambra
ENV WILDFLY_HOME ./wildfly-9.0.1.Final
ADD ${WILDFLY_HOME}.zip ./
RUN unzip ${WILDFLY_HOME}.zip
#RUN rm ${WILDFLY_HOME}/bin/standalone.conf
#ADD standalone.conf ${WILDFLY_HOME}/bin/
RUN chmod a+x ${WILDFLY_HOME}/bin/standalone.conf
ADD start.sh ./start.sh
RUN chmod a+x ./start.sh
RUN cp ./ping.war ${WILDFLY_HOME}/standalone/deployments/
EXPOSE 8080 9900 5701 1099 2099 22
ENTRYPOINT ./start.sh
