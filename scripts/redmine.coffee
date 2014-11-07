# Description:
#   Redmineにチケットを登録する
#
# Configuration:
#   HUBOT_REDMINE_BASE_URL
#   HUBOT_REDMINE_TOKEN
#
# Commands:
#   hubot redmine create <subject> - RedmineのBuddyプロジェクトにチケットを登録します
#
# Author:
#   satoshun00

request = require 'request'

module.exports = (robot) ->
  robot.respond /redmine create (.+)$/i, (msg) ->
    data =
      issue:
        project_id: 'Buddy'
        subject: msg.match[1]
    url = process.env.HUBOT_REDMINE_BASE_URL.replace /\/$/, ''
    request
      url: url + '/issues.json'
      method: 'POST'
      headers:
        Accept: 'application/json'
        "X-Redmine-API-Key": process.env.HUBOT_REDMINE_TOKEN
      json: true
      body: data
    , (err, res, body) ->
      msg.send '@satoshun00 Redmineのチケット作成に失敗したよ =͟͟͞͞((☞ ՞ਊ ՞)☞' + err if err?
      if body?
        msg.send '◜◡‾)◞つくたよ http://redmine.fenneclab.com/issues/' + body.issue.id
