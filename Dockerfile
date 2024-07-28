# FROM maven:3.8.4-openjdk-11 AS build
# WORKDIR /app
# COPY pom.xml .
# RUN mvn dependency:go-offline
# COPY src ./src
# COPY package.json .
# COPY webpack.config.js .
# RUN mvn package -DskipTests=true 

FROM openjdk:11-jre-slim
RUN apt-get update 
RUN apt-get install -y gcc
RUN apt-get install -y curl
WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
