FROM node:latest

RUN mkdir /bot

ADD . /bot

RUN cd /bot && npm install

EXPOSE 9999

CMD cd /bot; bin/hubot --adapter slack
