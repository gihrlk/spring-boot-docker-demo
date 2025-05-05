# Build stage
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Run stage
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
COPY --from=build /app/target/*.jar app.jar

# Add labels for GitHub Container Registry
LABEL org.opencontainers.image.source="https://github.com/gihrlk/spring-boot-docker-demo"
LABEL org.opencontainers.image.description="Spring Boot application with PostgreSQL, Traefik, and monitoring"
LABEL org.opencontainers.image.licenses="MIT"

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"] 