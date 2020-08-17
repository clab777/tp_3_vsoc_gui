FROM maven:3.6.0-jdk-13

RUN useradd -m -u 1000 -s /bin/bash jenkins

RUN yum install -y openssh-clients

EXPOSE 8080

ADD target/vsoc-jdi.jar vsoc-jdi.jar

ENTRYPOINT ["java", "-jar", "/vsoc-jdi.jar"]
