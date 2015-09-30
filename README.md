# fennecbot

### Installation

```
docker build -t fenneclab/fennecbot .
```

### Run

```
docker run -e HUBOT_SLACK_TOKEN="${HUBOT_SLACK_TOKEN}" \
  -e HUBOT_SLACK_TEAM="${HUBOT_SLACK_TEAM}" \
  -e HUBOT_SLACK_BOTNAME="${HUBOT_SLACK_BOTNAME}" \
  -e PORT=9999 \
  -e HUBOT_REDMINE_BASE_URL="${HUBOT_REDMINE_BASE_URL}" \
  -e HUBOT_REDMINE_TOKEN="${HUBOT_REDMINE_TOKEN}" \
  -d -p 9999:9999 \
  -v "$(pwd)":/bot \
  fenneclab/fennecbot

# or shell mode
docker run -v "$(pwd)":/bot \
  -it -p 9999:9999 \
  -e HUBOT_REDMINE_TOKEN="${HUBOT_REDMINE_TOKEN}" \
  -e HUBOT_REDMINE_BASE_URL="${HUBOT_REDMINE_BASE_URL}" \
  fenneclab/fennecbot \
  bin/hubot
```

### Deploy
```
git push heroku master
```
