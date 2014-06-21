FROM ubuntu:14.04
MAINTAINER James Duncan Davidson <duncan@jdd.io>

RUN apt-get update
RUN apt-get install -y dialog
RUN apt-get install -y software-properties-common
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN apt-get install -y oracle-java8-installer oracle-java8-set-default

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

CMD ["java", "-version"]
