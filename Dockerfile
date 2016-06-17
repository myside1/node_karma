FROM ubuntu:trusty

MAINTAINER 357003671@qq.com

RUN apt-get update; \
    apt-get install -y git curl; \
    curl -sL https://deb.nodesource.com/setup_4.x | sudo bash -; \
    && npm -g install npm@3.5.3 \
    curl https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - ; \
    sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'; \
    apt-get update && apt-get install -y google-chrome-stable nodejs Xvfb; \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD xvfb.sh /etc/init.d/xvfb
RUN chmod 777 /etc/init.d/xvfb
ADD entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh
ENV DISPLAY :99.0
ENV CHROME_BIN /usr/bin/google-chrome

ENTRYPOINT ["/entrypoint.sh"]