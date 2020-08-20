FROM goyalzz/ubuntu-java-8-maven-docker-image

RUN useradd -m -u 1000 -s /bin/bash jenkins

EXPOSE 8000

ADD target/vsoc-jdi.jar vsoc-jdi.jar

ENTRYPOINT ["java", "-jar", "/vsoc-jdi.jar"]
