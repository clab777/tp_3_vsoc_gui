FROM openjdk:8
EXPOSE 8080
ADD target/vsoc-jdi.jar vsoc-jdi.jar
ENTRYPOINT ["java", "-jar", "/vsoc-jdi.jar"]
