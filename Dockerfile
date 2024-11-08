FROM maven:3.9.6 AS build

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests


FROM openjdk:24-ea-17-jdk-oracle

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE 2020

CMD ["java", "-jar", "app.jar"]
