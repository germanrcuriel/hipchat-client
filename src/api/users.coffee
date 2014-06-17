BaseClass = require './common/base_class'

class Users extends BaseClass

  endpoints:
    create: '/v1/users/create'
    delete: '/v1/users/delete'
    list: '/v1/users/list'
    show: '/v1/users/show'
    undelete: '/v1/users/undelete'
    update: '/v1/users/update'

  #
  # Official API methods
  #
  create: (opts = {}, callback) ->
    @validate.obj opts, [ 'email', 'name' ]
    @request 'POST', @endpoints.create, opts, callback

  delete: (opts = {}, callback) ->
    @validate.obj opts, [ 'user_id' ]
    @request 'POST', @endpoints.delete, opts, callback

  list: (opts = {}, callback) ->
    @request 'GET', @endpoints.list, opts, callback

  show: (opts = {}, callback) ->
    @validate.obj opts, [ 'user_id' ]
    @request 'GET', @endpoints.show, opts, callback

  undelete: (opts = {}, callback) ->
    @validate.obj opts, [ 'user_id' ]
    @request 'POST', @endpoints.undelete, opts, callback

  update: (opts = {}, callback) ->
    @validate.obj opts, [ 'user_id' ]
    @request 'POST', @endpoints.update, opts, callback

  #
  # Custom methods
  #
  getByMentionName: (mention_name = '', opts = {}, callback) ->
    @validate.str mention_name
    @list opts, (err, res) =>
      callback err if err
      callback null, user: @select res.users, mention_name: mention_name

  getByName: (name = '', opts = {}, callback) ->
    @validate.str name
    @list opts, (err, res) =>
      callback err if err
      callback null, user: @select res.users, name: name

  getByEmail: (email = '', opts = {}, callback) ->
    @validate.str email
    @list opts, (err, res) =>
      callback err if err
      callback null, user: @select res.users, email: email

  getByStatus: (status = '', opts = {}, callback) ->
    @validate.inclusion status, [ 'available', 'dnd', 'away', 'offline' ]
    @list opts, (err, res) =>
      callback err if err
      callback null, users: @select res.users, status: status, 'all'

module.exports = Users
