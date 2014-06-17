# Rooms

### Create a new room

#####Params:

- **name** (String) <span style="color: #f00;">Required</span>. Name of the room.
- **owner_user_id** (Number) <span style="color: #f00;">Required</span>. User ID of the room's owner.
- **privacy** (String) Privacy: private or public. _(default: public)_
- **topic** (String) Initial room topic
- **guest_access** (Boolean, Number) Whether or not to enable guest access for this room. 0 = false, 1 = true. _(default: 0)_
- **format** (String) Desired response format: json or xml. _(default: json)_

#####Example:

```
hipchat.api.rooms.create
  name: 'Room name'
  owner_user_id: 111111
, (err, res) ->
  throw err if err
  console.log res
  
```

```
hipchat.api.rooms.create({
  name: 'Room name',
  owner_user_id: 111111
}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

#####Response:

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



### Delete a room

#####Params:

- **room_id** (Number) <span style="color: #f00;">Required</span>. ID of the room.
- **format** (String) Desired response format: json or xml. _(default: json)_

#####Example:

```
hipchat.api.rooms.delete
  room_id: 1234
, (err, res) ->
  throw err if err
  console.log res
  
```

```
hipchat.api.rooms.delete({
  room_id: 1234
}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

#####Response:

- **deleted** — Always "true" for now. Any failures will be returned with a non-200 return code.



### Fetch chat history of a room

#####Params:

- **room_id** (Number) <span style="color: #f00;">Required</span>. ID of the room.
- **date** (Date) <span style="color: #f00;">Required</span>. Either the date to fetch history for in YYYY-MM-DD format, or "recent" to fetch the latest 75 messages.
- **timezone** (String) Your timezone. Must be a supported timezone. _(default: UTC)_
- **format** (String) Desired response format: json or xml. _(default: json)_

#####Example:

```
hipchat.api.rooms.history
  room_id: 1234,
  date: '2014-06-17'
, (err, res) ->
  throw err if err
  console.log res
  
```

```
hipchat.api.rooms.history({
  room_id: 1234,
  date: '2014-06-17'
}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

#####Response:

- **date** — Date message was sent in ISO-8601 format in request timezone.
- **from** — Name and user_id of sender. user_id will be "api" for API messages and "guest" for guest messages.
- **message** — Message body.
- **file** — Name, size, and URL of uploaded file.



### List rooms

#####Params:

- **format** (String) Desired response format: json or xml. _(default: json)_

#####Example:

```
hipchat.api.rooms.list {}, (err, res) ->
  throw err if err
  console.log res
  
```

```
hipchat.api.rooms.list({}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

#####Response:

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



### Send a message to a room

#####Params:

- **room_id** (Number) <span style="color: #f00;">Required</span>. ID or name of the room.
- **from** (String) <span style="color: #f00;">Required</span>. Name the message will appear be sent from. Must be less than 15 characters long. May contain letters, numbers, -, _, and spaces.
- **message** (String) <span style="color: #f00;">Required</span>. The message body. 10,000 characters max.
- **message_format** (String) Determines how the message is treated by our server and rendered inside 	HipChat applications. _(default: html)_
    - **html** - Message is rendered as HTML and receives no special treatment. Must be valid HTML and entities must be [escaped](http://www.w3schools.com/tags/ref_entities.asp) (e.g.: `&amp;` instead of `&`). May contain basic tags: `a`, `b`, `i`, `strong`, `em`, `br`, `img`, `pre`, `code`, `lists`, `tables`. Special HipChat features such as @mentions, emoticons, and image previews are NOT supported when using this format.
    - **text** - Message is treated just like a message sent by a user. Can include @mentions, emoticons, pastes, and auto-detected URLs (Twitter, YouTube, images, etc).
- **notify** (Boolean, Number) Whether or not this message should trigger a notification for people in the room (change the tab color, play a sound, etc). Each recipient's notification preferences are taken into account. 0 = false, 1 = true. _(default: 0)_
- **color** (String) Background color for message. One of "yellow", "red", "green", "purple", "gray", or "random". _(default: yellow)_
- **format** (String) Desired response format: json or xml. _(default: json)_

#####Example:

```
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

```
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

- **status** — Delivery status. The only current value is "sent".



### Set a room's topic

#####Params:

- **room_id** (Number) <span style="color: #f00;">Required</span>. ID or name of the room.
- **topic** (String) <span style="color: #f00;">Required</span>. The topic body. 250 characters max.
- **from** (String) Name of the service changing the topic. _(default: API)_
- **format** (String) Desired response format: json or xml. _(default: json)_

#####Example:

```
hipchat.api.rooms.topic
  room_id: 1234
  topic: 'Hello World!'
  from: 'HipChat-Client'
, (err, res) ->
  throw err if err
  console.log res
  
```

```
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

- **status** — Delivery status. The only current value is "ok".



### Get room details

#####Params:

- **room_id** (Number) <span style="color: #f00;">Required</span>. ID or name of the room.
- **format** (String) Desired response format: json or xml. _(default: json)_

#####Example:

```
hipchat.api.rooms.show
  room_id: 1234
, (err, res) ->
  throw err if err
  console.log res
  
```

```
hipchat.api.rooms.show({
  room_id: 1234
}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

#####Response:

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