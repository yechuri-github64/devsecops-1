FROM openjdk:8-jdk-alpine  
EXPOSE 4499         
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]
