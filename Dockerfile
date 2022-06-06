FROM ubuntu:22.04
RUN apt-get update && \
apt-get install -y maven default-jdk git tomcat9
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && cd boxfuse-sample-java-war-hello
WORKDIR /boxfuse-sample-java-war-hello
RUN mvn package
RUN cp /boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/
RUN cp -R /boxfuse-sample-java-war-hello/target/hello-1.0 /var/lib/tomcat9/webapps/
RUN chown -R tomcat:tomcat /var/lib/tomcat9/webapps/hello-1.0
#CMD ["java", "-jar", "hello-1.0.war"]
CMD ["/usr/share/tomcat9/bin/catalina.sh", "run"]
