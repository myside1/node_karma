FROM ubuntu:trusty

MAINTAINER 357003671@qq.com

RUN apt-get update; \
    apt-get install -y git curl; \
    curl -sL https://deb.nodesource.com/setup_4.x | sudo bash -; \
    curl https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - ; \
    sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'; \
    apt-get update && apt-get install -y google-chrome-stable nodejs Xvfb; \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0AB215679C571D1C8325275B9BDB3D89CE49EC21 \
	&& echo "deb http://ppa.launchpad.net/mozillateam/firefox-next/ubuntu wily main" >> /etc/apt/sources.list.d/firefox.list \
	&& apt-get update && apt-get install -y \

ADD xvfb.sh /etc/init.d/xvfb
RUN chmod 777 /etc/init.d/xvfb
ADD entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh
ENV DISPLAY :99.0
ENV CHROME_BIN /usr/bin/google-chrome
ENV FIREFOX_BIN /usr/bin/firefox

ENTRYPOINT ["/entrypoint.sh"]