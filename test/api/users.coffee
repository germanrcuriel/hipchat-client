Users = require '../../src/api/users'
sinon = require 'sinon'

describe 'Users resource', =>

  @fixtures = require './fixtures/users'

  @data =
    user_id: 1
    email: 'pete@hipchat.com'
    name: 'Peter Curley'
    mention_name: 'pete'
    error: /^Missing/
    not_valid: /possibility/

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
      ( => @users.delete()).should.throw @data.error

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
      ( => @users.show()).should.throw @data.error

  describe '#undelete', =>
    it 'returns the undeleted status', =>
      req = sinon.stub @users, 'request'
      req.yields null, @fixtures.undelete

      @users.undelete
        user_id: @data.user_id
      , (err, res) =>
        res.should.be.exactly @fixtures.undelete

    it 'throws an error when a required param is missing', =>
      ( => @users.undelete()).should.throw @data.error

  describe '#update', =>
    it 'returns the updated user', =>
      req = sinon.stub @users, 'request'
      req.yields null, @fixtures.update

      @users.update
        user_id: @data.user_id
      , (err, res) =>
        res.should.be.exactly @fixtures.update

    it 'throws an error when a required param is missing', =>
      ( => @users.update()).should.throw @data.error

  describe '#getByMentionName', =>
    it 'returns the user', =>
      req = sinon.stub @users, 'request'
      req.yields null, @fixtures.list

      @users.getByMentionName @data.mention_name, null, (err, res) =>
        res.should.be.eql user: @fixtures.list.users[1]

    it 'throws an error when a required param is missing', =>
      ( => @users.getByMentionName()).should.throw @data.error

  describe '#getByName', =>
    it 'returns the user', =>
      req = sinon.stub @users, 'request'
      req.yields null, @fixtures.list

      @users.getByName @data.name, null, (err, res) =>
        res.should.be.eql user: @fixtures.list.users[1]

    it 'throws an error when a required param is missing', =>
      ( => @users.getByName()).should.throw @data.error

  describe '#getByEmail', =>
    it 'returns the user', =>
      req = sinon.stub @users, 'request'
      req.yields null, @fixtures.list

      @users.getByEmail @data.email, null, (err, res) =>
        res.should.be.eql user: @fixtures.list.users[1]

    it 'throws an error when a required param is missing', =>
      ( => @users.getByEmail()).should.throw @data.error

  describe '#getByStatus', =>
    it 'returns the users filtered by status', =>
      req = sinon.stub @users, 'request'
      req.yields null, @fixtures.list

      @users.getByStatus 'offline', null, (err, res) =>
        res.should.be.eql users: [ @fixtures.list.users[1] ]

    it 'throws an error when status isn\'t a possibility', =>
      ( => @users.getByStatus()).should.throw @data.not_valid
