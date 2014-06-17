HipChat = require '../src/hipchat'

describe 'HipChat', ->

  beforeEach ->
    @hipchat = new HipChat 'token'

  afterEach ->
    @hipchat = null

  it 'is an instance of HipChat class', ->
    @hipchat.should.be.an.instanceof HipChat

  it 'has a host property', ->
    @hipchat.should.have.property 'host', 'https://api.hipchat.com'

  it 'sets apiKey with provided argument', ->
    @hipchat.apiKey.should.be.equal 'token'

  it 'adds rooms to the api object', ->
    @hipchat.api.should.have.property 'rooms'

  it 'adds users to the api object', ->
    @hipchat.api.should.have.property 'users'
