hipchat-client
==============

A HipChat Client

[![NPM Version](https://badge.fury.io/js/hipchat-client.svg)](https://npmjs.org/package/hipchat-client)&nbsp;
[![Build Status](https://api.travis-ci.org/germanrcuriel/hipchat-client.svg?branch=master)](https://travis-ci.org/germanrcuriel/hipchat-client)
[![Package downloads](http://img.shields.io/npm/dm/hipchat-client.svg)](https://npmjs.org/package/hipchat-client)


## Installation

    $ npm install hipchat-client

### Usage

    var HipchatClient = require('hipchat-client');

##### Constructor

    var HipChat = new HipchatClient(auth_token);

##### Get user email by mention name

    HipChat.getMailByMentionName('mention_name', function (email) {
      console.log(email);
    });

##### Get room id by room name

    HipChat.getRoomByName('room_name', function (id) {
      console.log(id);
    });

##### Get room id by room Jid

    HipChat.getRoomByIdByJid('123_room@conf.hipchat.com', function (id)) {
      console.log(id);
    });

##### Get list of room participant Ids

    HipChat.getRoomParticipantIds(room_api_id, function (ids) {
      for (var i=0; i < ids.length; i++) {
        console.log(ids[i]);
      }
    });

##### Get list of all users in your account

    HipChat.getUsers(function (users) {
      for (var i=0; i < users.length; i++) {
        console.log(users[i].name);
      }
    });

##### Send message to a room

    var message = "<a href='http://hipchat.com'>HipChat</a>";
    var params = {
      from: 'HipChat',
      color: 'yellow',
      notify: 1
    };

    HipChat.sendRoomMessage(message, room_id, params, function (success) {
      console.log(success);
    });

##### Example: Send Message to a Room without room_id

    HipChat.getRoomByName('room_name', function (id) {
      var message = "<a href='http://hipchat.com'>HipChat</a>";
      var params = {
        from: 'HipChat',
        color: 'yellow',
        notify: 1
      };

      HipChat.sendRoomMessage(message, id, params, function (success) {
        console.log(success);
      });
    });

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
