# pfeffer whisper
#
# pfeffer me

module.exports = (robot) ->

  robot.respond /pfeffer me/i, (msg) ->
    msg.http("https://api.twitter.com/1/statuses/user_timeline.json?include_entities=true&include_rts=true&screen_name=terriblepfeffer&count=10")
    .get() (err, res, body) ->
      response = JSON.parse body
      if response[0]
       msg.send response[0]["text"]
      else
       msg.send "Error"
