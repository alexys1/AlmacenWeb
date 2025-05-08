# Imagen oficial de Tomcat 10 con Java 17
FROM tomcat:10.1.40-jdk17-temurin

# Elimina aplicaciones por defecto
RUN rm -rf /usr/local/tomcat/webapps/*

# Copia tu archivo WAR al servidor Tomcat
COPY target/AlmacenWeb-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Expone el puerto 8080
EXPOSE 8080

# Comando para ejecutar Tomcat
CMD ["catalina.sh", "run"]
