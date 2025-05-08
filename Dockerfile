FROM tomcat:10.1

# Elimina la app por defecto de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copia tu archivo .war al Tomcat
COPY AlmacenWeb-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
