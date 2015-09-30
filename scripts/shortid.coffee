# Description:
#   shortidを取得する
#
# Commands:
#   hubot shortid - shortidを取得します
#
# Author:
#   satoshun00

shortid = require 'shortid'

module.exports = (robot) ->
  robot.respond /shortid/i, (msg) ->
    msg.send "◜◡‾)◞たのんだ #{shortid.generate()}"
