FROM mysql:latest

LABEL maintainer="Soyl <soyl@live.cn>"
LABEL description="Docker container for Swift Vapor development"

RUN mkdir /run/secrets

ADD mysql /run/secrets/mysql
