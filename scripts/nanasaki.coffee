# Description:
#   七咲コマンド
#
# Commands:
#   七咲 - Returns nanasaki world

normal_count=0
suki_count=0

nanasaki_words = [
  "なんですか？ 先輩",
  "...なんですか",
  "なんですかって！!",
  "もうっ！怒りますよ！！",
  "もう知りません",
  "...",
  "うざいです"
]

nanasaki_words_suki = [
  "と、突然なんですかっ！！？？",
  "や、やめてくださいよ、こんなところで...",
  "もう...",
  "わかりましたって...",
  "私も好きですっ！はいっ、もう行きますよ！"
]

module.exports = (robot) ->
  robot.hear /七咲(.*)/i, (msg) ->
    normal = ->
      suki_count = 0
      if normal_count >= 0 && normal_count < 5
        msg.send "#{nanasaki_words[normal_count]}"
      else if normal_count >= 5 && normal_count < 8
        msg.send "#{nanasaki_words[5]}"
      else
        msg.send "#{nanasaki_words[6]}"

      normal_count = normal_count + 1
    suki = ->
      normal_count = 0
      msg.send "#{nanasaki_words_suki[suki_count]}"
      suki_count = suki_count + 1

    switch msg.match[1]
      when "好きだよ" then suki()
      else normal()
