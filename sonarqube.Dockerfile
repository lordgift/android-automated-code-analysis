FROM sonarqube

LABEL maintainer="LordGift"

USER root
RUN apt-get update

ENV SONARQUBE_HOME /opt/sonarqube

ARG sonarqube_default_port=9000
EXPOSE ${sonarqube_default_port}