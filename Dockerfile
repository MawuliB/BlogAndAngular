FROM maven:3.9.6

WORKDIR /app

COPY . .

COPY .env .

RUN mvn clean package


FROM openjdk:24-ea-17-jdk-oracle

WORKDIR /app

COPY ./target/blog-0.0.1-SNAPSHOT.jar /app

EXPOSE 2020

CMD ["java", "-jar", "blog-0.0.1-SNAPSHOT.jar"]
