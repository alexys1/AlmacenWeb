FROM tomcat:10.1-jdk17

RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY target/AlmacenWeb-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war




