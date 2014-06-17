request = require 'superagent'

class BaseClass

  constructor: (@hipchat) ->

  throwError: (error) ->
    {error} = error
    new Error "#{error.code} (#{error.type}) - #{error.message}"

  request: (method, url, params, callback) ->
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

  validate: (options = {}, validation = []) ->
    validation.forEach (value) ->
      throw new Error "Missing #{value} parameter." unless options[value]

module.exports = BaseClass
