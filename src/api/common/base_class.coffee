request = require 'superagent'

class BaseClass

  constructor: (@hipchat) ->

  throwError: (error) ->
    # HipChat servers are not returning expected error format
    return new Error error unless error.error?
    
    {error} = error
    
    error.code or= ''
    error.type or= 'Error'
    error.message or= 'Server error'

    new Error "#{error.code} (#{error.type}) - #{error.message}"

  request: (method = 'GET', url = '', params = {}, callback) ->
    params.auth_token = @hipchat.apiKey

    xhr = request[method.toLowerCase()] "#{@hipchat.host}#{url}"

    if method is 'POST'
      xhr.type 'form'
      xhr.send params
    else
      xhr.query params

    xhr.end (err, res) =>
      throw err if err
      if res.ok
        callback null, res.body
      else
        callback @throwError res.body

  validate:
    obj: (options = {}, validation = []) ->
      validation.forEach (value) ->
        throw new Error "Missing #{value} parameter." unless options[value]
      true

    str: (param = '') ->
      throw new Error "Missing parameter." unless param
      true

    inclusion: (param = '', possibilities) ->
      unless param in possibilities
        throw new Error "#{param} isn't a possibility (#{possibilities})"
      true

  select: (collection = [], param = {}, type = 'one') ->
    @validate.str type, [ 'one', 'all' ]

    property = Object.keys(param)[0]
    selected = (item for item in collection when item[property] is param[property])

    if selected.length
      return selected[0] if type is 'one'
      return selected if type is 'all'
    else
      {}

module.exports = BaseClass
