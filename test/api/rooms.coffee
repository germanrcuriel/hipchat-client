Rooms = require '../../src/api/rooms'
sinon = require 'sinon'

describe 'Rooms resource', =>

  @fixtures = require './fixtures/rooms'

  @data =
    name: 'Test Room'
    owner_user_id: 1
    room_id: 1
    date: '2014-06-17'
    from: 'HipChat-Client'
    message: 'Hello World!'
    topic: 'Hello!'

  beforeEach =>
    @rooms = new Rooms

  afterEach =>
    @rooms = null

  it 'is an instance of Rooms class', =>
    @rooms.should.be.an.instanceof(Rooms)

  describe '#create', =>
    it 'returns the created room', =>
      req = sinon.stub(@rooms, 'request')
      req.yields null, @fixtures.create

      @rooms.create
        name: @data.name
        owner_user_id: @data.owner_user_id
      , (err, res) =>
        res.should.be.exactly @fixtures.create

    it 'throws an error when a required param is missing', =>
      ( => @rooms.create name: @data.name).should.throw(/^Missing/)
      ( => @rooms.create owner_user_id: @data.owner_user_id).should.throw(/^Missing/)
      ( => @rooms.create()).should.throw(/^Missing/)

  describe '#delete', =>
    it 'returns the delete status', =>
      req = sinon.stub(@rooms, 'request')
      req.yields null, @fixtures.delete

      @rooms.delete
        room_id: @data.room_id
      , (err, res) =>
        res.should.be.exactly @fixtures.delete

    it 'throws an error when a required param is missing', =>
      ( => @rooms.delete()).should.throw(/^Missing/)

  describe '#history', =>
    it 'returns the history messages', =>
      req = sinon.stub(@rooms, 'request')
      req.yields null, @fixtures.history

      @rooms.history
        room_id: @data.room_id
        date: @data.date
      , (err, res) =>
        res.should.be.exactly @fixtures.history

    it 'throws an error when a required param is missing', =>
      ( => @rooms.history room_id: @data.room_id).should.throw(/^Missing/)
      ( => @rooms.history date: @data.date).should.throw(/^Missing/)
      ( => @rooms.history()).should.throw(/^Missing/)

  describe '#list', =>
    it 'returns the list data', =>
      req = sinon.stub(@rooms, 'request')
      req.yields null, @fixtures.list

      @rooms.list {}, (err, res) =>
        res.should.be.exactly @fixtures.list

  describe '#message', =>
    it 'returns the message status', =>
      req = sinon.stub(@rooms, 'request')
      req.yields null, @fixtures.message

      @rooms.message
        room_id: @data.room_id
        from: @data.from
        message: @data.message
      , (err, res) =>
        res.should.be.exactly @fixtures.message

    it 'throws an error when a required param is missing', =>
      ( => @rooms.message room_id: @data.room_id).should.throw(/^Missing/)
      ( => @rooms.message from: @data.from).should.throw(/^Missing/)
      ( => @rooms.message message: @data.message).should.throw(/^Missing/)
      ( => @rooms.message()).should.throw(/^Missing/)

  describe '#topic', =>
    it 'returns the topic status', =>
      req = sinon.stub(@rooms, 'request')
      req.yields null, @fixtures.topic

      @rooms.topic
        room_id: @data.room_id
        topic: @data.topic
      , (err, res) =>
        res.should.be.exactly @fixtures.topic

    it 'throws an error when a required param is missing', =>
      ( => @rooms.topic room_id: @data.room_id).should.throw(/^Missing/)
      ( => @rooms.topic topic: @data.topic).should.throw(/^Missing/)
      ( => @rooms.topic()).should.throw(/^Missing/)

  describe '#show', =>
    it 'returns the room details', =>
      req = sinon.stub(@rooms, 'request')
      req.yields null, @fixtures.show

      @rooms.show
        room_id: @data.room_id
      , (err, res) =>
        res.should.be.exactly @fixtures.show

    it 'throws an error when a required param is missing', =>
      ( => @rooms.show()).should.throw(/^Missing/)
