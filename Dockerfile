FROM openjdk:17
ARG CONTAINER_NAME=restaurant
ARG IMAGE_NAME=restaurant

EXPOSE 8081

ADD target/RestaurantProject-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]
