hipchat-client
==============

[![NPM Version](https://badge.fury.io/js/hipchat-client.svg)](https://npmjs.org/package/hipchat-client)&nbsp;
[![Build Status](https://api.travis-ci.org/germanrcuriel/hipchat-client.svg?branch=master)](https://travis-ci.org/germanrcuriel/hipchat-client)
[![Package downloads](http://img.shields.io/npm/dm/hipchat-client.svg)](https://npmjs.org/package/hipchat-client)

```javascript
var HipChatClient = require('hipchat-client');

var hipchat = new HipChatClient('auth_token');

hipchat.api.rooms.message({
  room_id: 'Frontend',
  from: 'HipChat Client',
  message: 'Hello world!'
}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

## Installation

```sh
$ npm install hipchat-client
```
      
## API and documentation

  - Rooms:
    - [Create a new room](docs/rooms.md#create-a-new-room)
    - [Delete a room](docs/rooms.md#delete-a-room)
    - [Fetch chat history of a room](docs/rooms.md#fetch-chat-history-of-a-room)
    - [List rooms](docs/rooms.md#list-rooms)
    - [Send a message to a room](docs/rooms.md#send-a-message-to-a-room)
    - [Set a room's topic](docs/rooms.md#set-a-rooms-topic)
    - [Get room details](docs/rooms.md#get-room-details)
    - [Get room by name](docs/rooms.md#get-room-by-name)
    - [Get room by XMPP/Jabber ID](docs/rooms.md#get-room-by-xmppjabber-id)
   
  - Users:
    - WIP

More information at [HipChat API Documentation](https://www.hipchat.com/docs/api/)


## Running Tests

To run the test suite, first invoke the following command within the repo, installing the development dependencies:

```sh
$ npm install
```

Then run the tests:

```sh
$ npm test
```

## License

[MIT](LICENSE.md)
