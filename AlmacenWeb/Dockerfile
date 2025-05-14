# Etapa de construcción (builder)
FROM maven:3.9.5-jdk-17 AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Etapa de ejecución
FROM tomcat:10.1-jdk17
RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY --from=builder /app/target/AlmacenWeb-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war



