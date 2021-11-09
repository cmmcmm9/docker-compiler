FROM docker.io/ubuntu:latest
#COPY ./libRes /libRes



RUN apt-get update

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /libRes
RUN wget -O phpunit https://phar.phpunit.de/phpunit-9.phar
RUN mv phpunit /libRes
RUN chmod +x /libRes/phpunit
RUN wget -O junit-console.jar https://repo1.maven.org/maven2/org/junit/platform/junit-platform-console-standalone/1.7.0-RC1/junit-platform-console-standalone-1.7.0-RC1-all.jar
RUN mv junit-console.jar /libRes

RUN apt-get update --fix-missing
#Install all the languages/compilers we are supporting.
RUN apt-get install -y gcc
RUN apt-get install -y g++
#RUN apt install -y build-essential
RUN apt-get install -y php7.4-cli
# RUN apt-get install -y phpunit
RUN apt-get install -y ruby

RUN apt-get install -y python-is-python3
RUN apt-get install -y python3-pip
RUN python -m pip install -U matplotlib
RUN python -m pip install -U numpy
RUN python -m pip install -U pandas

RUN apt-get install -y nodejs npm
RUN npm install -g npm
RUN npm install jest --global
# RUN apt-get install -y mono-xsp2 mono-xsp2-base


#RUN systemctl restart apache2

RUN apt install -y default-jdk
