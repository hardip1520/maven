# Base image with JDK for building the application
FROM maven:3.8.4-openjdk-17 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the project's POM file to the container
COPY pom.xml .

# Copy the source code to the container
COPY src ./src

# Build the Maven project inside the container
RUN mvn clean package

# Base image with Java and application server for running the application
FROM tomcat:9.0.56-jdk17

# Copy the built application artifact from the builder stage to the application server
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose the default port of the application server
EXPOSE 8080

# Start the application server when the container is run
CMD ["catalina.sh", "run"]
