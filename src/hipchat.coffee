Rooms = require './api/rooms'
Users = require './api/users'

class HipChat

  host: 'https://api.hipchat.com'
  api: []

  constructor: (@apiKey) ->
    @addResources
      'rooms': Rooms
      'users': Users

  addResources: (resources) ->
    for name, module of resources
      @api[name] = new module @

module.exports = HipChat
