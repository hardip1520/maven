FROM maven:3.8.4-openjdk-17 AS builder

# Install Java 19
RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL "https://github.com/adoptium/temurin19-binaries/releases/download/jdk-19%2B8/OpenJDK19-jdk_x64_linux_hotspot_19_8.tar.gz" | tar xz -C /opt

# Set the Java 19 environment variables
ENV JAVA_HOME=/opt/jdk-19+8
ENV PATH=$PATH:$JAVA_HOME/bin

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package

FROM adoptopenjdk/openjdk19:latest

COPY --from=builder /app/target/*.jar /app/application.jar

CMD ["java", "-jar", "/app/application.jar"]
