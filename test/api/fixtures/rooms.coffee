fixtures =
  delete:
    deleted: true

  history:
    [
      date: '2010-11-19T16:13:40-0800'
      from:
        name: 'User 1'
        user_id: 'api'
      message: 'Hello'
    ,
      date: '2010-11-19T16:13:44-0800'
      from:
        name: 'User 2'
        user_id: 'api'
      message: 'Hi'
    ]

  room:
    room_id: 1234
    name: 'Test Room'
    topic: 'Topic'
    last_active: 1234567890
    created: 1234567890
    is_archived: false
    is_private: false
    owner_user_id: 111111
    guest_access_url: 0
    xmpp_jid: 'test_room@hipchat.com'

  message:
    status: 'sent'

  topic:
    status: 'ok'

module.exports = fixtures
