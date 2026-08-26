# ==============================================================================
# Project: Enterprise Spring Petclinic Infrastructure
# Component: Multi-Stage Dockerfile
# Infrastructure Architect: Ahmed Mohamed Abbas
# ==============================================================================

# ------------------------------------------------------------------------------
# Stage 1: Build Stage (The Builder)
# ------------------------------------------------------------------------------
FROM eclipse-temurin:17-jdk-alpine AS build
WORKDIR /workspace/app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

RUN ./mvnw dependency:go-offline

COPY src src
RUN ./mvnw clean package -DskipTests

# ------------------------------------------------------------------------------
# Stage 2: Production Stage (The Runner)
# ------------------------------------------------------------------------------
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

RUN addgroup -S petclinic && adduser -S petclinic -G petclinic
USER petclinic:petclinic

COPY --from=build /workspace/app/target/spring-petclinic-*.jar app.jar

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -qO- http://localhost:8080/actuator/health/ || exit 1

ENTRYPOINT ["java", "-jar", "app.jar"]
