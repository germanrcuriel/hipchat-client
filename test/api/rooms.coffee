Rooms = require '../../src/api/rooms'
sinon = require 'sinon'

describe 'Rooms resource', =>

  @fixtures = require './fixtures/rooms'

  @data =
    name: 'Ops'
    owner_user_id: 1
    room_id: 1
    date: '2014-06-17'
    from: 'HipChat-Client'
    message: 'Hello World!'
    topic: 'Hello!'
    xmpp_jid: '10_ops@conf.hipchat.com'
    error: /^Missing/

  beforeEach =>
    @rooms = new Rooms

  afterEach =>
    @rooms = null

  it 'is an instance of Rooms class', =>
    @rooms.should.be.an.instanceof Rooms

  describe '#create', =>
    it 'returns the created room', =>
      req = sinon.stub @rooms, 'request'
      req.yields null, @fixtures.create

      @rooms.create
        name: @data.name
        owner_user_id: @data.owner_user_id
      , (err, res) =>
        res.should.be.exactly @fixtures.create

    it 'throws an error when a required param is missing', =>
      ( => @rooms.create name: @data.name).should.throw @data.error
      ( => @rooms.create owner_user_id: @data.owner_user_id).should.throw @data.error
      ( => @rooms.create()).should.throw @data.error

  describe '#delete', =>
    it 'returns the delete status', =>
      req = sinon.stub @rooms, 'request'
      req.yields null, @fixtures.delete

      @rooms.delete
        room_id: @data.room_id
      , (err, res) =>
        res.should.be.exactly @fixtures.delete

    it 'throws an error when a required param is missing', =>
      ( => @rooms.delete()).should.throw @data.error

  describe '#history', =>
    it 'returns the history messages', =>
      req = sinon.stub @rooms, 'request'
      req.yields null, @fixtures.history

      @rooms.history
        room_id: @data.room_id
        date: @data.date
      , (err, res) =>
        res.should.be.exactly @fixtures.history

    it 'throws an error when a required param is missing', =>
      ( => @rooms.history room_id: @data.room_id).should.throw @data.error
      ( => @rooms.history date: @data.date).should.throw @data.error
      ( => @rooms.history()).should.throw @data.error

  describe '#list', =>
    it 'returns the list data', =>
      req = sinon.stub @rooms, 'request'
      req.yields null, @fixtures.list

      @rooms.list {}, (err, res) =>
        res.should.be.exactly @fixtures.list

  describe '#message', =>
    it 'returns the message status', =>
      req = sinon.stub @rooms, 'request'
      req.yields null, @fixtures.message

      @rooms.message
        room_id: @data.room_id
        from: @data.from
        message: @data.message
      , (err, res) =>
        res.should.be.exactly @fixtures.message

    it 'throws an error when a required param is missing', =>
      ( => @rooms.message room_id: @data.room_id).should.throw @data.error
      ( => @rooms.message from: @data.from).should.throw @data.error
      ( => @rooms.message message: @data.message).should.throw @data.error
      ( => @rooms.message()).should.throw @data.error

  describe '#topic', =>
    it 'returns the topic status', =>
      req = sinon.stub @rooms, 'request'
      req.yields null, @fixtures.topic

      @rooms.topic
        room_id: @data.room_id
        topic: @data.topic
      , (err, res) =>
        res.should.be.exactly @fixtures.topic

    it 'throws an error when a required param is missing', =>
      ( => @rooms.topic room_id: @data.room_id).should.throw @data.error
      ( => @rooms.topic topic: @data.topic).should.throw @data.error
      ( => @rooms.topic()).should.throw @data.error

  describe '#show', =>
    it 'returns the room details', =>
      req = sinon.stub @rooms, 'request'
      req.yields null, @fixtures.show

      @rooms.show
        room_id: @data.room_id
      , (err, res) =>
        res.should.be.exactly @fixtures.show

    it 'throws an error when a required param is missing', =>
      ( => @rooms.show()).should.throw @data.error

  describe '#getByName', =>
    it 'returns a room', =>
      req = sinon.stub @rooms, 'request'
      req.yields null, @fixtures.list

      @rooms.getByName @data.name, null, (err, res) =>
        res.should.be.eql room: @fixtures.list.rooms[1]

    it 'throws an error when a required param is missing', =>
      ( => @rooms.getByName()).should.throw @data.error

  describe '#getByXmppJid', =>
    it 'returns a room', =>
      req = sinon.stub @rooms, 'request'
      req.yields null, @fixtures.list

      @rooms.getByXmppJid @data.xmpp_jid, null, (err, res) =>
        res.should.be.eql room: @fixtures.list.rooms[1]

    it 'throws an error when a required param is missing', =>
      ( => @rooms.getByXmppJid()).should.throw @data.error
