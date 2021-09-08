FROM maven:latest AS build-stage
COPY . /build
WORKDIR /build
RUN mvn clean package

FROM openjdk:8-jdk-alpine
WORKDIR backend/spring-petclinic-rest
COPY --from=build-stage /build/target/*.jar
ENTRYPOINT ["java","-jar","/app.jar"]