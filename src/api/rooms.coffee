BaseClass = require './common/base_class'

class Rooms extends BaseClass

  endpoints:
    create: '/v1/rooms/create'
    delete: '/v1/rooms/delete'
    history: '/v1/rooms/history'
    list: '/v1/rooms/list'
    message: '/v1/rooms/message'
    show: '/v1/rooms/show'
    topic: '/v1/rooms/topic'

  #
  # Official API methods
  #
  create: (opts = {}, callback) ->
    @validate.obj opts, [ 'name', 'owner_user_id' ]
    @request 'POST', @endpoints.create, opts, callback

  delete: (opts = {}, callback) ->
    @validate.obj opts, [ 'room_id' ]
    @request 'POST', @endpoints.delete, opts, callback

  history: (opts = {}, callback) ->
    @validate.obj opts, [ 'room_id', 'date' ]
    @request 'GET', @endpoints.history, opts, callback

  list: (opts = {}, callback) ->
    @request 'GET', @endpoints.list, opts, callback

  message: (opts = {}, callback) ->
    @validate.obj opts, [ 'room_id', 'from', 'message' ]
    @request 'POST', @endpoints.message, opts, callback

  show: (opts = {}, callback) ->
    @validate.obj opts, [ 'room_id' ]
    @request 'GET', @endpoints.show, opts, callback

  topic: (opts = {}, callback) ->
    @validate.obj opts, [ 'room_id', 'topic' ]
    @request 'POST', @endpoints.topic, opts, callback

  #
  # Custom methods
  #
  getByName: (name = '', opts = {}, callback) ->
    @validate.str name
    @list opts, (err, res) =>
      callback err if err
      callback null, room: @select res.rooms, name: name

  getByXmppJid: (xmpp_jid = '', opts = {}, callback) ->
    @validate.str xmpp_jid
    @list opts, (err, res) =>
      callback err if err
      callback null, room: @select res.rooms, xmpp_jid: xmpp_jid

module.exports = Rooms
