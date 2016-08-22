FROM docker.io/openshift/jenkins-1-centos7

USER root
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-1.12.1.tgz && tar --strip-components=1 -xvzf docker-1.12.1.tgz -C /usr/bin
ENV DOCKER_API_VERSION=1.22

USER 1001
COPY plugins.txt /opt/openshift/configuration/plugins.txt
RUN /usr/local/bin/plugins.sh /opt/openshift/configuration/plugins.txt

# docker build -t my_jenkins_image -f Dockerfile .
# docker run --name jenkins --net=host --privileged -d -e JENKINS_PASSWORD=password -v /var/run/docker.sock:/var/run/docker.sock my_jenkins_image
