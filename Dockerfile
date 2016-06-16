FROM node:slim
MAINTAINER silecne.tang@daocloud.io
WORKDIR /tmp
RUN npm install -g karma jasmine-core karma-jasmine karma-webpack webpack && \
    webdriver-manager update && \
    apt-get update && \
    apt-get install -y xvfb wget openjdk-7-jre && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg --unpack google-chrome-stable_current_amd64.deb && \
    apt-get install -f -y && \
    apt-get clean && \
    rm google-chrome-stable_current_amd64.deb && \
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null
