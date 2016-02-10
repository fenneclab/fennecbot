# fennecbot

### Installation

```
docker build -t fenneclab/fennecbot .
```

### Run

```
source ./.env; docker run -e HUBOT_SLACK_TOKEN="${HUBOT_SLACK_TOKEN}" \
  -e HUBOT_SLACK_TEAM="${HUBOT_SLACK_TEAM}" \
  -e HUBOT_SLACK_BOTNAME="${HUBOT_SLACK_BOTNAME}" \
  -e HUBOT_TRELLO_BOARD="${HUBOT_TRELLO_BOARD}" \
  -e HUBOT_TRELLO_KEY="${HUBOT_TRELLO_KEY}" \
  -e HUBOT_TRELLO_TOKEN="${HUBOT_TRELLO_TOKEN}" \
  -e HUBOT_KANE_FORM_ID="${HUBOT_KANE_FORM_ID}" \
  -e PORT=9999 \
  -d -p 9999:9999 \
  -v "$(pwd)":/bot \
  fenneclab/fennecbot

# or shell mode
source ./.env; docker run -v "$(pwd)":/bot \
  -e HUBOT_TRELLO_BOARD="${HUBOT_TRELLO_BOARD}" \
  -e HUBOT_TRELLO_KEY="${HUBOT_TRELLO_KEY}" \
  -e HUBOT_TRELLO_TOKEN="${HUBOT_TRELLO_TOKEN}" \
  -e HUBOT_KANE_FORM_ID="${HUBOT_KANE_FORM_ID}" \
  -it -p 9999:9999 \
  fenneclab/fennecbot \
  bin/hubot

# or
source ./.env; bin/hubot
```

### Deploy
```
# check config
heroku config

git push heroku master
```
