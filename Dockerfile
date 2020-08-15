FROM openjdk:8
EXPOSE 8080
ADD target/vsoc.jar vsoc.jar
ENTRYPOINT ["java", "-jar", "/vsoc.jar"]
