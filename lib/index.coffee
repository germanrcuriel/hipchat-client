request = require 'superagent'

# generate an error from the response
generateError = (res) ->
  body = res.body and res.body.error or { message: 'FLAGRANT ERROR' }
  err = new Error(body.message)

  Object.keys(body).forEach (k) -> err[k] = body[k] if k is not 'message'

  err

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
        notify: 1,
        message_format: 'html'

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
          cb generateError res
        else
          email = user.email for user in res.body.users when user.mention_name is name

          if email
            cb null, email
          else
            cb new Error('Could not find an email in hipchat response')

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
          cb generateError res
        else
          cb room.room_id for room in res.body.rooms when room.name is name

  getRoomIdByJid: (jid, cb) ->
    request
      .get(@options.url + 'v1/rooms/list')
      .query({auth_token: @options.token})
      .end (res) ->
        if !res.ok
          cb generateError res
        else
          room_id = room.room_id for room in res.body.rooms when room.xmpp_jid is jid
          cb null, room_id

  getRoomParticipantIds: (room_id, cb) ->
    request
      .get(@options.url + 'v1/rooms/show')
      .query( {room_id: room_id, auth_token: @options.token} )
      .end (res) ->
        if !res.ok
          cb generateError res
        else
          ids = (p.user_id for p in res.body.room.participants)
          cb null, ids

  getUsers: (cb) ->
    request
      .get(@options.url + 'v1/users/list')
      .query( {auth_token: @options.token} )
      .end (res) ->
        if !res.ok
          cb generateError res
        else
          cb null, res.body.users

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
      notify: params.notify ? @options.message.notify,
      message_format: params.message_format or @options.message.message_format

    request
      .post(@options.url + 'v1/rooms/message')
      .type('form')
      .send(data)
      .end (res) ->
        if !res.ok
          cb generateError res
        else
          cb null


module.exports = (auth_token) ->
  new HipChat auth_token
