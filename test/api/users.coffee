Users = require '../../src/api/users'
sinon = require 'sinon'

describe 'Users resource', ->

  beforeEach ->
    @users = new Users

  afterEach ->
    @users = null

  it 'is an instance of Users class', ->
    @users.should.be.an.instanceof(Users)

  it 'throws an error when a required param is missing', ->
    ( => @users.create email: 'bla@bla.com').should.throw(/^Missing/)
    ( => @users.create name: 'HipChat').should.throw(/^Missing/)
    ( => @users.create() ).should.throw(/^Missing/)
