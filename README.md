hipchat-client
==============

A HipChat Client


### Installation

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
	

## MIT License

Copyright (c) 2013 <germanrcuriel@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
