# Description:
#   Start or Stop AWS EC2 Instance
#
# Dependencies:
#   "aws2js": "0.6.12"
#   "underscore": "1.3.3"
#   "moment": "1.6.2"
#
# Configuration:
#   HUBOT_AWS_ACCESS_KEY_ID
#   HUBOT_AWS_SECRET_ACCESS_KEY
#   HUBOT_AWS_EC2_REGIONS
#
# Commands:
#   hubot ec2 start <instace-Id> - Start EC2 instances
#   hubot ec2 stop <instace-Id> - Stop EC2 instances

key = process.env.HUBOT_AWS_ACCESS_KEY_ID
secret = process.env.HUBOT_AWS_SECRET_ACCESS_KEY

_ = require 'underscore'
moment = require 'moment'
aws = require 'aws2js'
ec2 = aws
  .load('ec2', key, secret)
  .setApiVersion('2012-05-01')

startInstances = (region,instance,msg) ->
  ec2.setRegion(region).request 'StartInstances', { InstanceId : instance },(error, response) ->
    if error?
        msg.send error
    else
        msg.send "起動しました StartInstances InstanceId : " + instance
stopInstances = (region,instance,msg) ->
  ec2.setRegion(region).request 'StopInstances', { InstanceId : instance },(error, response) ->
    if error?
        msg.send error
    else
        msg.send "停止しました StopInstances InstanceId : " + instance

defaultRegions = 'us-east-1,us-west-1,us-west-2,eu-west-1,ap-southeast-1,ap-northeast-1,sa-east-1'

module.exports = (robot) ->
  robot.respond /(^|\W)ec2 start (.*)$/i, (msg) ->
    regions = process.env?.HUBOT_AWS_EC2_REGIONS ? defaultRegions
    startInstances region,msg.match[2],msg for region in regions.split ','
  robot.respond /(^|\W)ec2 stop (.*)$/i, (msg) ->
    regions = process.env?.HUBOT_AWS_EC2_REGIONS ? defaultRegions
    stopInstances region,msg.match[2],msg for region in regions.split ','
