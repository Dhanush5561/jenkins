FROM maven:3.8-openjdk-11
WORKDIR /app
COPY . .
RUN mvn clean package
CMD ["java", "-jar", "target/*.jar"]
