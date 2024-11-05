FROM maven:3.9.6 AS build

WORKDIR /app

COPY . .

COPY .env .

RUN mvn clean package -DskipTests


FROM openjdk:24-ea-17-jdk-oracle

WORKDIR /app

COPY --from=build /app/target/*.jar /app

EXPOSE 2020

CMD ["java", "-jar", "blog-0.0.1-SNAPSHOT.jar"]
