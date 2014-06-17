# Rooms

### Create a new room

#####Params:

- **name** _(String)_ **Required**. Name of the room.
- **owner_user_id** _(Number)_ **Required**. User ID of the room's owner.
- **privacy** _(String)_ Privacy: private or public. _(default: public)_
- **topic** _(String)_ Initial room topic
- **guest_access** _(Boolean, Number)_ Whether or not to enable guest access for this room. 0 = false, 1 = true. _(default: 0)_
- **format** _(String)_ Desired response format: json or xml. _(default: json)_

#####Example:

Coffeescript

```coffeescript
hipchat.api.rooms.create
  name: 'Development'
  owner_user_id: 5
, (err, res) ->
  throw err if err
  console.log res
```

JavaScript

```javascript
hipchat.api.rooms.create({
  name: 'Development',
  owner_user_id: 5
}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

#####Response:

```json
{
  "room": {
    "room_id": 5,
    "name": "Development",
    "topic": "",
    "last_active": 0,
    "created": 1269010311,
    "is_archived": false,
    "is_private": false,
    "owner_user_id": 5,
    "guest_access_url": null,
    "xmpp_jid": "5_development@conf.hipchat.com"
  }
}
```

- **room_id** — ID of the room.
- **name** — Name of the room.
- **topic** — Current topic.
- **last_active** — Time of last activity (sent message) in the room in UNIX time (UTC). May be 0 in rare cases when the time is unknown.
- **created** — Time the room was created in UNIX time (UTC).
- **is_archived** — Whether or not this room is archived.
- **is_private** — Whether or not this room is private.
- **owner_user_id** — User ID of the room owner.
- **guest_access_url** — URL for guest access, if enabled.
- **xmpp_jid** — XMPP/Jabber ID of the room.

===

### Delete a room

#####Params:

- **room_id** _(Number)_ **Required**. ID of the room.
- **format** _(String)_ Desired response format: json or xml. _(default: json)_

#####Example:

CoffeeScript

```coffeescript
hipchat.api.rooms.delete
  room_id: 5
, (err, res) ->
  throw err if err
  console.log res
```

JavaScript

```javascript
hipchat.api.rooms.delete({
  room_id: 5
}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

#####Response:

```json
{
  "deleted": true
}
```

- **deleted** — Always "true" for now. Any failures will be returned with a non-200 return code.

===

### Fetch chat history of a room

#####Params:

- **room_id** _(Number)_ **Required**. ID of the room.
- **date** _(String)_ **Required**. Either the date to fetch history for in YYYY-MM-DD format, or "recent" to fetch the latest 75 messages.
- **timezone** _(String)_ Your timezone. Must be a supported timezone. _(default: UTC)_
- **format** _(String)_ Desired response format: json or xml. _(default: json)_

#####Example:

CoffeeScript

```coffeescript
hipchat.api.rooms.history
  room_id: 5,
  date: '2010-11-19'
, (err, res) ->
  throw err if err
  console.log res
```

JavaScript

```javascript
hipchat.api.rooms.history({
  room_id: 5,
  date: '2010-11-19'
}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

#####Response:

```json
{
  "messages": [
    {
      "date": "2010-11-19T15:48:19-0800",
      "from": {
        "name": "Garret Heaton",
        "user_id": 10
      },
      "message": "Good morning! This is a regular message."
    },
    {
      "date": "2010-11-19T15:49:44-0800",
      "from": {
        "name": "Garret Heaton",
        "user_id": 10
      },
      "file": {
        "name": "Screenshot.png",
        "size": 141909,
        "url": "http:\/\/uploads.hipchat.com\/xxx\/Screenshot.png"
      },
      "message": "This is a file upload"
    },
    {
      "date": "2010-11-19T16:13:40-0800",
      "from": {
        "name": "Deploy Bot",
        "user_id": "api"
      },
      "message": "This message is sent via the API so the user_id is 'api'."
    }
  ]
}
```

- **date** — Date message was sent in ISO-8601 format in request timezone.
- **from** — Name and user_id of sender. user_id will be "api" for API messages and "guest" for guest messages.
- **message** — Message body.
- **file** — Name, size, and URL of uploaded file.

===

### List rooms

#####Params:

- **format** _(String)_ Desired response format: json or xml. _(default: json)_

#####Example:

CoffeeScript

```coffeescript
hipchat.api.rooms.list {}, (err, res) ->
  throw err if err
  console.log res
```

JavaScript

```javascript
hipchat.api.rooms.list({}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

#####Response:

```json
{
  "rooms": [
    {
      "room_id": 7,
      "name": "Development",
      "topic": "Make sure to document your API functions well!",
      "last_active": 1269020400,
      "created": 1269010311,
      "owner_user_id": 1,
      "is_archived": false,
      "is_private": false,
      "xmpp_jid": "7_development@conf.hipchat.com",
      "guest_access_url": ""
    },
    {
      "room_id": 10,
      "name": "Ops",
      "topic": "Chef is so awesome.",
      "last_active": 1269010500,
      "created": 1269010211,
      "owner_user_id": 5,
      "is_archived": false,
      "is_private": true,
      "xmpp_jid": "10_ops@conf.hipchat.com",
      "guest_access_url": ""
    }
  ]
}
```

- **room_id** — ID of the room.
- **name** — Name of the room.
- **topic** — Current topic.
- **last_active** — Time of last activity (sent message) in the room in UNIX time (UTC). May be 0 in rare cases when the time is unknown.
- **created** — Time the room was created in UNIX time (UTC).
- **is_archived** — Whether or not this room is archived.
- **is_private** — Whether or not this room is private.
- **owner_user_id** — User ID of the room owner.
- **guest_access_url** — URL for guest access, if enabled.
- **xmpp_jid** — XMPP/Jabber ID of the room. 

===

### Send a message to a room

#####Params:

- **room_id** _(Number)_ **Required**. ID or name of the room.
- **from** _(String)_ **Required**. Name the message will appear be sent from. Must be less than 15 characters long. May contain letters, numbers, -, _, and spaces.
- **message** _(String)_ **Required**. The message body. 10,000 characters max.
- **message_format** _(String)_ Determines how the message is treated by our server and rendered inside 	HipChat applications. _(default: html)_
    - **html** - Message is rendered as HTML and receives no special treatment. Must be valid HTML and entities must be [escaped](http://www.w3schools.com/tags/ref_entities.asp) (e.g.: `&amp;` instead of `&`). May contain basic tags: `a`, `b`, `i`, `strong`, `em`, `br`, `img`, `pre`, `code`, `lists`, `tables`. Special HipChat features such as @mentions, emoticons, and image previews are NOT supported when using this format.
    - **text** - Message is treated just like a message sent by a user. Can include @mentions, emoticons, pastes, and auto-detected URLs (Twitter, YouTube, images, etc).
- **notify** _(Boolean, Number)_ Whether or not this message should trigger a notification for people in the room (change the tab color, play a sound, etc). Each recipient's notification preferences are taken into account. 0 = false, 1 = true. _(default: 0)_
- **color** _(String)_ Background color for message. One of "yellow", "red", "green", "purple", "gray", or "random". _(default: yellow)_
- **format** _(String)_ Desired response format: json or xml. _(default: json)_

#####Example:

CoffeeScript

```coffeescript
hipchat.api.rooms.message
  room_id: 1234
  from: 'HipChat-Client'
  message: 'Hello World!'
  format: 'text'
  color: 'green'
  notify: 1
, (err, res) ->
  throw err if err
  console.log res
```

JavaScript

```javascript
hipchat.api.rooms.message({
  room_id: 1234,
  from: 'HipChat-Client',
  message: 'Hello World!',
  format: 'text',
  color: 'green',
  notify: 1
}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

#####Response:

```json
{
  "status": "sent"
}
```

- **status** — Delivery status. The only current value is "sent".

===

### Set a room's topic

#####Params:

- **room_id** _(Number)_ **Required**. ID or name of the room.
- **topic** _(String)_ **Required**. The topic body. 250 characters max.
- **from** _(String)_ Name of the service changing the topic. _(default: API)_
- **format** _(String)_ Desired response format: json or xml. _(default: json)_

#####Example:

CoffeeScript

```coffeescript
hipchat.api.rooms.topic
  room_id: 1234
  topic: 'Hello World!'
  from: 'HipChat-Client'
, (err, res) ->
  throw err if err
  console.log res
```

JavaScript

```javascript
hipchat.api.rooms.topic({
  room_id: 1234,
  topic: 'Hello World!',
  from: 'HipChat-Client'
}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

#####Response:

```json
{
  "status": "ok"
}
```

- **status** — Delivery status. The only current value is "ok".

===

### Get room details

#####Params:

- **room_id** _(Number)_ **Required**. ID or name of the room.
- **format** _(String)_ Desired response format: json or xml. _(default: json)_

#####Example:

CoffeeScript

```coffeescript
hipchat.api.rooms.show
  room_id: 5
, (err, res) ->
  throw err if err
  console.log res  
```

JavaScript

```javascript
hipchat.api.rooms.show({
  room_id: 5
}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

#####Response:

```json
{
  "room": {
    "room_id": 5,
    "name": "Ops",
    "topic": "Chef is so awesome.",
    "last_active": 1269020400,
    "created": 1269010311,
    "is_archived": false,
    "is_private": true,
    "owner_user_id": 5,
    "member_user_ids": [
      1,
      2,
      3,
      4,
      5
    ],
    "participants": [
      {
        "user_id": 5,
        "name": "Garret Heaton"
      },
      {
        "user_id": 1,
        "name": "Chris Rivers"
      }
    ],
    "guest_access_url": null,
    "xmpp_jid": "5_ops@conf.hipchat.com"
  }
}
```

- **room_id** — ID of the room.
- **name** — Name of the room.
- **topic** — Current topic.
- **last_active** — Time of last activity (sent message) in the room in UNIX time (UTC). May be 0 in rare cases when the time is unknown.
- **created** — Time the room was created in UNIX time (UTC).
- **is_archived** — Whether or not this room is archived.
- **is_private** — Whether or not this room is private.
- **owner_user_id** — User ID of the room owner.
- **guest_access_url** — URL for guest access, if enabled.
- **xmpp_jid** — XMPP/Jabber ID of the room.

===

### Get room by name

#####Params:

- **name** _(String)_ **Required**. Name of the room.
- **opts** _(Object)_:
  - **format** _(String)_ Desired response format: json or xml. _(default: json)_ 

#####Example:

CoffeeScript

```coffeescript
hipchat.api.rooms.getByName 'Ops', (err, res) ->
  throw err if err
  console.log res  
```

JavaScript

```javascript
hipchat.api.rooms.getByName('Ops', function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

#####Response:

```json
{
  "room": {
    "room_id": 10,
    "name": "Ops",
    "topic": "Chef is so awesome.",
    "last_active": 1269010500,
    "created": 1269010211,
    "owner_user_id": 5,
    "is_archived": false,
    "is_private": true,
    "xmpp_jid": "10_ops@conf.hipchat.com",
    "guest_access_url": ""
  }
}
```

- **room_id** — ID of the room.
- **name** — Name of the room.
- **topic** — Current topic.
- **last_active** — Time of last activity (sent message) in the room in UNIX time (UTC). May be 0 in rare cases when the time is unknown.
- **created** — Time the room was created in UNIX time (UTC).
- **is_archived** — Whether or not this room is archived.
- **is_private** — Whether or not this room is private.
- **owner_user_id** — User ID of the room owner.
- **guest_access_url** — URL for guest access, if enabled.
- **xmpp_jid** — XMPP/Jabber ID of the room.

===

### Get room by XMPP/Jabber ID

#####Params:

- **xmpp_jid** _(String)_ **Required**. XMPP/Jabber ID of the room.
- **opts** _(Object)_:
  - **format** _(String)_ Desired response format: json or xml. _(default: json)_ 

#####Example:

CoffeeScript

```coffeescript
hipchat.api.rooms.getByXmppJid '10_ops@conf.hipchat.com', null, (err, res) ->
  throw err if err
  console.log res  
```

JavaScript

```javascript
hipchat.api.rooms.getByName('10_ops@conf.hipchat.com', null, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

#####Response:

```json
{
  "room": {
    "room_id": 10,
    "name": "Ops",
    "topic": "Chef is so awesome.",
    "last_active": 1269010500,
    "created": 1269010211,
    "owner_user_id": 5,
    "is_archived": false,
    "is_private": true,
    "xmpp_jid": "10_ops@conf.hipchat.com",
    "guest_access_url": ""
  }
}
```

- **room_id** — ID of the room.
- **name** — Name of the room.
- **topic** — Current topic.
- **last_active** — Time of last activity (sent message) in the room in UNIX time (UTC). May be 0 in rare cases when the time is unknown.
- **created** — Time the room was created in UNIX time (UTC).
- **is_archived** — Whether or not this room is archived.
- **is_private** — Whether or not this room is private.
- **owner_user_id** — User ID of the room owner.
- **guest_access_url** — URL for guest access, if enabled.
- **xmpp_jid** — XMPP/Jabber ID of the room.