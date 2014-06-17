Users = require '../../src/api/users'
sinon = require 'sinon'

describe 'Users resource', =>

  @fixtures = require './fixtures/users'

  @data =
    user_id: 1
    email: 'new@company.com'
    name: 'New Guy'
    error: /^Missing/

  beforeEach =>
    @users = new Users

  afterEach =>
    @users = null

  it 'is an instance of Users class', =>
    @users.should.be.an.instanceof(Users)

  describe '#create', =>
    it 'returns the created user', =>
      req = sinon.stub @users, 'request'
      req.yields null, @fixtures.create

      @users.create
        email: @data.email
        name: @data.name
      , (err, res) =>
        res.should.be.exactly @fixtures.create

    it 'throws an error when a required param is missing', =>
      ( => @users.create email: @data.email).should.throw @data.error
      ( => @users.create name: @data.name).should.throw @data.error
      ( => @users.create()).should.throw @data.error

  describe '#delete', =>
    it 'returns the deleted status', =>
      req = sinon.stub @users, 'request'
      req.yields null, @fixtures.delete

      @users.delete
        user_id: @data.user_id
      , (err, res) =>
        res.should.be.exactly @fixtures.delete

    it 'throws an error when a required param is missing', =>
      ( => @users.create()).should.throw @data.error

  describe '#list', =>
    it 'returns the users', =>
      req = sinon.stub @users, 'request'
      req.yields null, @fixtures.list

      @users.list {}, (err, res) =>
        res.should.be.exactly @fixtures.list

  describe '#show', =>
    it 'returns the user details', =>
      req = sinon.stub @users, 'request'
      req.yields null, @fixtures.show

      @users.show
        user_id: @data.user_id
      , (err, res) =>
        res.should.be.exactly @fixtures.show

    it 'throws an error when a required param is missing', =>
      ( => @users.create()).should.throw @data.error

  describe '#undelete', =>
    it 'returns the undeleted status', =>
      req = sinon.stub @users, 'request'
      req.yields null, @fixtures.undelete

      @users.undelete
        user_id: @data.user_id
      , (err, res) =>
        res.should.be.exactly @fixtures.undelete

    it 'throws an error when a required param is missing', =>
      ( => @users.create()).should.throw @data.error

  describe '#update', =>
    it 'returns the updated user', =>
      req = sinon.stub @users, 'request'
      req.yields null, @fixtures.update

      @users.update
        user_id: @data.user_id
      , (err, res) =>
        res.should.be.exactly @fixtures.update

    it 'throws an error when a required param is missing', =>
      ( => @users.create()).should.throw @data.error
