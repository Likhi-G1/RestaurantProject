FROM openjdk:17
ARG CONTAINER_NAME=restaurant
ARG IMAGE_NAME=restaurant

EXPOSE 8080

ADD target/docker-0.0.1-SNAPSHOT.jar docker-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java", "-jar", "/docker-0.0.1-SNAPSHOT.jar"]
