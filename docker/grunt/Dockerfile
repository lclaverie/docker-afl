FROM debian:jessie

RUN apt-get update
RUN apt-get install -y curl

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs build-essential

COPY init-grunt.sh /

WORKDIR /src

CMD ["sh", "/init-grunt.sh"]
