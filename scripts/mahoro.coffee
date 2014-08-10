# Description:
#   まほろさんコマンド
#
# Commands:
#   まほろさ(.*)ん - Returns "えっちなのはいけないとおもいますっ！"

module.exports = (robot) ->
  robot.hear /まほろさ(.*)ん/, (msg) ->
    msg.send "えっちなのはいけないとおもいますっ！"
