# Description:
#   経費を入力する
#
# Commands:
#   hubot 金 <項目> <金額> <支払先> - 経費を入力します(項目は 飯|移動|備品|その他)
#
# Configuration:
#   HUBOT_KANE_FORM_ID
#
# Author:
#   satoshun00

# entry.1082370069_year
# entry.1082370069_month
# entry.1082370069_day
# entry.401103785 (店舗名)
# entry.1824584658 (項目)
# entry.864989227 (金額)
# entry.348480466 (利用者)

KOUMOKUS_MAP = {
  '飯': '食事代・お歳暮・パーティ',
  '移動': '電車・バス・タクシー・航空券',
  '備品': '備品・パソコン・文房具・名刺',
  'その他': 'その他'
}

module.exports = (robot) ->
  robot.respond /金 (.+?) (.+?) (.+)/i, (msg) ->
    formId = process.env.HUBOT_KANE_FORM_ID
    return msg.send 'HUBOT_KANE_FORM_IDがないよ =͟͟͞͞((☞ ՞ਊ ՞)☞' if !formId?
    koumoku = msg.match[1]
    kingaku = msg.match[2]
    mise = msg.match[3]
    now = new Date
    user = '共通'
    return msg.send "<項目>は #{Object.keys(KOUMOKUS_MAP).join('|')} から選んでね =͟͟͞͞((☞ ՞ਊ ՞)☞" if koumoku not in Object.keys(KOUMOKUS_MAP)
    return msg.send '<金額>は数字だよ =͟͟͞͞((☞ ՞ਊ ՞)☞' if !/^\d+$/.test(kingaku)
    return msg.send '<支払先>を指定してね =͟͟͞͞((☞ ՞ਊ ՞)☞' if !mise?
    data = "entry.1082370069_year=#{now.getFullYear()}&entry.1082370069_month=#{now.getMonth()}&entry.1082370069_day=#{now.getDate()}&entry.401103785=#{encodeURIComponent(mise)}&entry.1824584658=#{encodeURIComponent(KOUMOKUS_MAP[koumoku])}&entry.864989227=#{kingaku}&entry.348480466=#{encodeURIComponent(user)}"
    robot.http("https://docs.google.com/forms/d/#{formId}/formResponse")
      .header('Content-Type', 'application/x-www-form-urlencoded')
      .post(data) (err, res, body) ->
        return msg.send "投稿でエラーが発生したよ =͟͟͞͞((☞ ՞ਊ ՞)☞: #{res.statusCode}/#{err}" if err or res.statusCode isnt 200
        msg.send "◜◡‾)◞ :money_with_wings:"
