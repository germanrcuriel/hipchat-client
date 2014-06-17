BaseClass = require './common/base_class'

class Rooms extends BaseClass

  create: (opts = {}, callback) ->
    @validate opts, [ 'name', 'owner_user_id' ]
    @request 'POST', '/v1/rooms/create', opts, callback

  delete: (opts = {}, callback) ->
    @validate opts, [ 'room_id' ]
    @request 'POST', '/v1/rooms/delete', opts, callback

  history: (opts = {}, callback) ->
    @validate opts, [ 'room_id', 'date' ]
    @request 'GET', '/v1/rooms/history', opts, callback

  list: (opts = {}, callback) ->
    @request 'GET', '/v1/rooms/list', opts, callback

  message: (opts = {}, callback) ->
    @validate opts, [ 'room_id', 'from', 'message' ]
    @request 'POST', '/v1/rooms/message', opts, callback

  topic: (opts = {}, callback) ->
    @validate opts, [ 'room_id', 'topic' ]
    @request 'POST', '/v1/rooms/topic', opts, callback

  show: (opts = {}, callback) ->
    @validate opts, [ 'room_id' ]
    @request 'GET', '/v1/rooms/show', opts, callback

module.exports = Rooms
