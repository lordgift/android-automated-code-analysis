FROM sonarqube

LABEL maintainer="LordGift"

USER root
RUN apt-get update

ENV SONARQUBE_HOME /opt/sonarqube

ARG sonarqube_defualt_port=9000
EXPOSE ${sonarqube_defualt_port}