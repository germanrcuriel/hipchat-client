HipChat = require '../src/hipchat'

Rooms = require '../src/api/rooms'
Users = require '../src/api/users'

describe 'HipChat', ->

  beforeEach ->
    @hipchat = new HipChat

  afterEach ->
    @hipchat = null

  it 'is an instance of HipChat class', ->
    @hipchat.should.be.an.instanceof(HipChat)

  it 'has a host property', ->
    @hipchat.should.have.property('host', 'https://api.hipchat.com')

  it 'adds rooms to the api object', ->
    @hipchat.api.should.have.property('rooms')

  it 'adds users to the api object', ->
    @hipchat.api.should.have.property('users')
