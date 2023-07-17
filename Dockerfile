FROM maven:3.9.1-amazoncorretto-19 AS builder

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "target/spring-rest-comp-367-1.0.jar"]
