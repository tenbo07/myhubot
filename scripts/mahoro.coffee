# Description:
#   まほろさんコマンド
#
# Commands:
#   まほろさーん - Returns "えっちなのはいけないとおもいますっ！"

module.exports = (robot) ->
  robot.hear /まほろさ(.*)ん/, (msg) ->
    msg.send "えっちなのはいけないとおもいますっ！"
