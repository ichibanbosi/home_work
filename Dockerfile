FROM ubuntu:22.04
RUN apt-get update && \
apt-get install -y maven default-jdk git tomcat9
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && cd boxfuse-sample-java-war-hello
WORKDIR /boxfuse-sample-java-war-hello
RUN mvn package
RUN cp /boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/
RUN export CATALINA_HOME=/usr/share/tomcat9 && \
export CATALINA_BASE=/var/lib/tomcat9 && \
export CATALINA_TMPDIR=/tmp && \
export JAVA_OPTS=-Djava.awt.headless=true
RUN echo $CATALINA_BASE
WORKDIR /usr/libexec/tomcat9/
CMD ./tomcat-start.sh
