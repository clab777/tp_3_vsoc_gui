FROM goyalzz/ubuntu-java-8-maven-docker-image

RUN useradd -m -u 1000 -s /bin/bash jenkins

RUN yum install -y openssh-clients

RUN apt-get update && \
      apt-get -y install sudo

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

USER docker
CMD /bin/bash

EXPOSE 8080

ADD target/vsoc-jdi.jar vsoc-jdi.jar

ENTRYPOINT ["java", "-jar", "/vsoc-jdi.jar"]
