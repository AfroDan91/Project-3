FROM maven:latest AS build-stage
COPY . /build
WORKDIR /build
RUN mvn clean package -DskipTests

FROM openjdk:8-jdk-alpine 
COPY --from=build-stage /build/target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]