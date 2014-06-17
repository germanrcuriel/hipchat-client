BaseClass = require './common/base_class'

class Users extends BaseClass

  create: (opts = {}, callback) ->
    @validate.obj opts, [ 'email', 'name' ]
    @request 'POST', '/v1/users/create', opts, callback

  delete: (opts = {}, callback) ->
    @validate.obj opts, [ 'user_id' ]
    @request 'POST', '/v1/users/delete', opts, callback

  list: (opts = {}, callback) ->
    @request 'GET', '/v1/users/list', opts, callback

  show: (opts = {}, callback) ->
    @validate.obj opts, [ 'user_id' ]
    @request 'GET', '/v1/users/show', opts, callback

  undelete: (opts = {}, callback) ->
    @validate.obj opts, [ 'user_id' ]
    @request 'POST', '/v1/users/undelete', opts, callback

  update: (opts = {}, callback) ->
    @validate.obj opts, [ 'user_id' ]
    @request 'POST', '/v1/users/update', opts, callback

module.exports = Users
