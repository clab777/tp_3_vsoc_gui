FROM openjdk:8
EXPOSE 8080
ADD target/vsoc-jenkins-docker-integration.jar vsoc-jenkins-docker-integration.jar
ENTRYPOINT ["java", "-jar", "/vsoc-jdi.jar"]
