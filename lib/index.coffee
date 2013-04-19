request = require 'superagent'

class HipChat
  constructor: (@token) ->
    unless @token
      return false

    @options =
      url: 'https://api.hipchat.com/',
      token: @token
      message:
        from: 'JIRA',
        color: 'yellow',
        notify: 1

  getMailByMentionName: (name, cb) ->
    unless name
      return false
    unless cb
      return false

    request
      .get(@options.url + 'v1/users/list')
      .query({ auth_token: @options.token })
      .end (res) ->
        if !res.ok
          cb false
        else
          cb user.email for user in res.body.users when user.mention_name is name

  getRoomByName: (name, cb) ->
    unless name
      return false
    unless cb
      return false

    request
      .get(@options.url + 'v1/rooms/list')
      .query({ auth_token: @options.token })
      .end (res) ->
        if !res.ok
          cb false
        else
          cb room.room_id for room in res.body.rooms when room.name is name

  sendRoomMessage: (message, room_id, params, cb) ->
    unless message
      return false
    unless room_id
      return false
    unless params
      return false
    unless cb
      return false

    data =
      message: message
      room_id: room_id,
      auth_token: @options.token
      from: params.from or @options.message.from,
      color: params.color or @options.message.color,
      notify: params.notify or @options.message.notify,

    request
      .post(@options.url + 'v1/rooms/message')
      .type('form')
      .send(data)
      .end (res) ->
        if !res.ok
          cb false
        else
          cb true


module.exports = Hipchat
