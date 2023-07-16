FROM maven:3.9.1-amazoncorretto-19 AS builder

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package

COPY --from=builder /app/target/*.jar /app/application.jar

#CMD ["java", "-jar", "/app/application.jar"]
