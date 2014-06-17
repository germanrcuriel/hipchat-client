fixtures =

  create:
    room:
      room_id: 5
      name: 'Development'
      topic: ''
      last_active: 0
      created: 1269010311
      is_archived: false
      is_private: false
      owner_user_id: 5
      guest_access_url: null
      xmpp_jid: '5_development@conf.hipchat.com'

  delete:
    deleted: true

  history:
    messages: [
      date: '2010-11-19T15:48:19-0800'
      from:
        name: 'Garret Heaton'
        user_id: 10
      message: 'Good morning! This is a regular message.'
    ,
      date: '2010-11-19T15:49:44-0800'
      from:
        name: 'Garret Heaton'
        user_id: 10
      file:
        name: 'Screenshot.png'
        size: 141909
        url: 'http:\/\/uploads.hipchat.com\/xxx\/Screenshot.png'
      message: 'This is a file upload'
    ]

  list:
    rooms: [
      room_id: 7
      name: 'Development'
      topic: 'Make sure to document your API functions well!'
      last_active: 1269020400
      created: 1269010311
      owner_user_id: 1
      is_archived: false
      is_private: false
      xmpp_jid: '7_development@conf.hipchat.com'
      guest_access_url: ''
    ,
      room_id: 10
      name: 'Ops'
      topic: 'Chef is so awesome.'
      last_active: 1269010500
      created: 1269010211
      owner_user_id: 5
      is_archived: false
      is_private: true
      xmpp_jid: '10_ops@conf.hipchat.com'
      guest_access_url: ''
    ]

  message:
    status: 'sent'

  topic:
    status: 'ok'

  show:
    room:
      room_id: 5
      name: 'Ops'
      topic: 'Chef is so awesome.'
      last_active: 1269020400
      created: 1269010311
      is_archived: false
      is_private: true
      owner_user_id: 5
      member_user_ids: [
        1,
        2,
        3,
        4,
        5
      ]
      participants: [
        user_id: 5
        name: 'Garret Heaton'
      ,
        user_id: 1
        name: 'Chris Rivers'
      ]
      guest_access_url: null
      xmpp_jid: '5_ops@conf.hipchat.com'

module.exports = fixtures
