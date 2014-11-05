FROM node:latest

RUN mkdir /bot

ADD . /bot

EXPOSE 9999

CMD cd /bot; bin/hubot --adapter slack
