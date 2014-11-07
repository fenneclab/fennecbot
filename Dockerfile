FROM node:latest

RUN mkdir /bot && cd /bot

ADD . /bot

EXPOSE 9999

WORKDIR /bot

CMD ["bin/hubot", "--adapter", "slack"]
