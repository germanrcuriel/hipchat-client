# Users

## Create a new user

####Params:

- **email** _(String)_ **Required**. User's email.
- **name** _(Number)_ **Required**. User's full name.
- **mention_name** _(String)_ User's @mention name.
- **title** _(String)_ User's title.
- **is_group_admin** _(Boolean, Number)_ Whether or not this user is an admin. 0 = false, 1 = true. _(default: 0)_
- **password** _(String)_ User's password. If not provided, a randomly generated password will be returned.
- **timezone** _(String)_ User's timezone. Must be a [supported timezone](https://www.hipchat.com/docs/api/timezones). _(default: UTC)_
- **format** _(String)_ Desired response format: json or xml. _(default: json)_

####Example:

CoffeeScript

```coffeescript
hipchat.api.users.create
  email: 'new@company.com'
  name: 'New Guy'
, (err, res) ->
  throw err if err
  console.log res
```

JavaScript

```javascript
hipchat.api.users.create({
  email: 'new@company.com',
  name: 'New Guy'
}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

####Response:

```json
{
  "user": {
    "user_id": 3,
    "name": "New Guy",
    "email": "new@company.com",
    "title": "Intern",
    "password": "d294H58zlE",
    "photo_url": "https:\/\/www.hipchat.com\/img\/silhouette_125.png",
    "status": "offline",
    "status_message": "",
    "is_group_admin": 0
  }
}
```

- **user_id** — User's ID.
- **name** — User's full name.
- **email** — User's email.
- **title** — User's title.
- **password** — User's password. Can not be retreieved again so make sure you record it.
- **photo** — URL to user's photo. 125px on the longest side.
- **status** — User's current status. Either offline, away, dnd, or available.
- **status_message** — User's current status message.
- **is_group_admin** — Whether or not this user is an admin of the group.

===

## Delete a user

####Params:

- **user_id** _(Number)_ **Required**. ID or email address of the user.
- **format** _(String)_ Desired response format: json or xml. _(default: json)_

####Example:

CoffeeScript

```coffeescript
hipchat.api.users.delete
  user_id: 5
, (err, res) ->
  throw err if err
  console.log res
```

JavaScript

```javascript
hipchat.api.users.delete({
  user_id: 5
}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

####Response:

```json
{
  "deleted": true
}
```

- **deleted** — Always "true" for now. Any failures will be returned with a non-200 return code.

===

## List all users

####Params:

- **include_deleted** _(Boolean, Number)_ Include deleted users in response. 0 = false, 1 = true. _(default: 0)_
- **format** _(String)_ Desired response format: json or xml. _(default: json)_

####Example:

CoffeeScript

```coffeescript
hipchat.api.users.list {}, (err, res) ->
  throw err if err
  console.log res
```

JavaScript

```javascript
hipchat.api.users.list({}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

####Response:

```json
{
  "users": [
    {
      "user_id": 1,
      "name": "Chris Rivers",
      "mention_name": "chris",
      "email": "chris@hipchat.com",
      "title": "Developer",
      "photo_url": "https:\/\/www.hipchat.com\/chris.png",
      "last_active": 1360031425,
      "created": 1315711352,
      "status": "away",
      "status_message": "gym, bbl",
      "is_group_admin": 1,
      "is_deleted": 0
    },
    {
      "user_id": 3,
      "name": "Peter Curley",
      "mention_name": "pete",
      "email": "pete@hipchat.com",
      "title": "Designer",
      "photo_url": "https:\/\/www.hipchat.com\/pete.png",
      "last_active": 1360031425,
      "created": 1315711352,
      "status": "offline",
      "status_message": "",
      "is_group_admin": 1,
      "is_deleted": 0
    },
    {
      "user_id": 5,
      "name": "Garret Heaton",
      "mention_name": "garret",
      "email": "garret@hipchat.com",
      "title": "Co-founder",
      "photo_url": "https:\/\/www.hipchat.com\/garret.png",
      "last_active": 1360031425,
      "created": 1315711352,
      "status": "available",
      "status_message": "Come see what I'm working on!",
      "is_group_admin": 1,
      "is_deleted": 0
    }
  ]
}
```

- **user_id** — User's ID.
- **name** — User's full name.
- **mention_name** — User's @mention name.
- **last_active** — Time the account was last used in UNIX time (UTC). May be 0 in rare cases when the time is unknown.
- **created** — Time the user was created in UNIX time (UTC).
- **email** — User's email.
- **title** — User's title.
- **photo** — URL to user's photo. 125px on the longest side.
- **status** — User's current status. Either offline, away, dnd, or available.
- **status_message** — User's current status message.
- **is_group_admin** — '1' if the user is an admin, otherwise '0'.
- **is_deleted** — '1' if the account is deleted, otherwise '0'.

===

## Get a user's details

####Params:

- **user_id** _(Number)_ **Required**. ID or email address of the user.
- **format** _(String)_ Desired response format: json or xml. _(default: json)_

####Example:

CoffeeScript

```coffeescript
hipchat.api.users.show
  user_id: 5
, (err, res) ->
  throw err if err
  console.log res
```

JavaScript

```javascript
hipchat.api.rooms.list({
  user_id: 5
}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

####Response:

```json
{
  "user": {
    "user_id": 5,
    "name": "Garret Heaton",
    "mention_name": "garret",
    "last_active": 1360031425,
    "created": 1315711352,
    "email": "garret@hipchat.com",
    "title": "Co-founder",
    "photo_url": "https:\/\/www.hipchat.com\/img\/silhouette_125.png",
    "status": "available",
    "status_message": "Come see what I'm working on!",
    "is_group_admin": 1
  }
}
```

- **user_id** — User's ID.
- **email** — User's email.
- **name** — User's full name.
- **mention_name** — User's @mention name.
- **title** — User's title.
- **photo** — URL to user's photo. 125px on the longest side.
- **last_active** — Time the account was last used in UNIX time (UTC). May be 0 in rare cases when the time is unknown.
- **created** — Time the user was created in UNIX time (UTC).
- **status** — User's current status. Either offline, away, dnd, or available.
- **status_message** — User's current status message.
- **is_group_admin** — Whether or not this user is an admin of the group.

===

## Undelete a user

####Params:

- **user_id** _(Number)_ **Required**. ID or email address of the user.
- **format** _(String)_ Desired response format: json or xml. _(default: json)_

####Example:

CoffeeScript

```coffeescript
hipchat.api.users.undelete
  user_id: 5
, (err, res) ->
  throw err if err
  console.log res
```

JavaScript

```javascript
hipchat.api.users.undelete({
  user_id: 5
}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

####Response:

```json
{
  "undeleted": true
}
```

- **undeleted** — Always "true" for now. Any failures will be returned with a non-200 return code.

===

## Update a user

####Params:

- **user_id** _(Number)_ **Required**. User ID.
- **email** _(String)_ User's email.
- **name** _(Number)_ User's full name.
- **mention_name** _(String)_ User's @mention name.
- **title** _(String)_ User's title.
- **is_group_admin** _(Boolean, Number)_ Whether or not this user is an admin. 0 = false, 1 = true. _(default: 0)_
- **password** _(String)_ User's password. If not provided, a randomly generated password will be returned.
- **timezone** _(String)_ User's timezone. Must be a [supported timezone](https://www.hipchat.com/docs/api/timezones). _(default: UTC)_
- **format** _(String)_ Desired response format: json or xml. _(default: json)_

####Example:

CoffeeScript

```coffeescript
hipchat.api.users.update
  user_id: 5
  name: 'Garret Heaton'
, (err, res) ->
  throw err if err
  console.log res
```

JavaScript

```javascript
hipchat.api.rooms.topic({
  user_id: 5,
  name: 'Garret Heaton'
}, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

####Response:

```json
{
  "user": {
    "user_id": 5,
    "name": "Garret Heaton",
    "mention_name": "garret",
    "email": "new-email-address@hipchat.com",
    "title": "Co-founder",
    "photo_url": "https:\/\/www.hipchat.com\/img\/silhouette_125.png",
    "status": "available",
    "status_message": "Come see what I'm working on!",
    "is_group_admin": 1
  }
}
```

- **user_id** — User's ID.
- **name** — User's full name.
- **mention_name** — User's @mention name.
- **email** — User's email.
- **title** — User's title.
- **photo** — URL to user's photo. 125px on the longest side.
- **status** — User's current status. Either offline, away, dnd, or available.
- **status_message** — User's current status message.
- **is_group_admin** — Whether or not this user is an admin of the group.

===

## Get user by mention name

####Params:

- **mention_name** _(String)_ **Required**. User's @mention name.
- **opts** _(Object)_:
  - **include_deleted** _(Boolean, Number)_ Include deleted users in response. 0 = false, 1 = true. _(default: 0)_
  - **format** _(String)_ Desired response format: json or xml. _(default: json)_

####Example:

CoffeeScript

```coffeescript
hipchat.api.users.getByMentionName 'garret', null, (err, res) ->
  throw err if err
  console.log res
```

JavaScript

```javascript
hipchat.api.users.getByMentionName('garret', null, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

####Response:

```json
{
  "user": {
    "user_id": 5,
    "name": "Garret Heaton",
    "mention_name": "garret",
    "email": "new-email-address@hipchat.com",
    "title": "Co-founder",
    "photo_url": "https:\/\/www.hipchat.com\/img\/silhouette_125.png",
    "status": "available",
    "status_message": "Come see what I'm working on!",
    "is_group_admin": 1
  }
}
```

- **user_id** — User's ID.
- **name** — User's full name.
- **mention_name** — User's @mention name.
- **email** — User's email.
- **title** — User's title.
- **photo** — URL to user's photo. 125px on the longest side.
- **status** — User's current status. Either offline, away, dnd, or available.
- **status_message** — User's current status message.
- **is_group_admin** — Whether or not this user is an admin of the group.

===

## Get user by name

####Params:

- **name** _(String)_ **Required**. User's full name.
- **opts** _(Object)_:
  - **include_deleted** _(Boolean, Number)_ Include deleted users in response. 0 = false, 1 = true. _(default: 0)_
  - **format** _(String)_ Desired response format: json or xml. _(default: json)_

####Example:

CoffeeScript

```coffeescript
hipchat.api.users.getByName 'Garret Heaton', null, (err, res) ->
  throw err if err
  console.log res
```

JavaScript

```javascript
hipchat.api.users.getByName('Garret Heaton', null, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

####Response:

```json
{
  "user": {
    "user_id": 5,
    "name": "Garret Heaton",
    "mention_name": "garret",
    "email": "new-email-address@hipchat.com",
    "title": "Co-founder",
    "photo_url": "https:\/\/www.hipchat.com\/img\/silhouette_125.png",
    "status": "available",
    "status_message": "Come see what I'm working on!",
    "is_group_admin": 1
  }
}
```

- **user_id** — User's ID.
- **name** — User's full name.
- **mention_name** — User's @mention name.
- **email** — User's email.
- **title** — User's title.
- **photo** — URL to user's photo. 125px on the longest side.
- **status** — User's current status. Either offline, away, dnd, or available.
- **status_message** — User's current status message.
- **is_group_admin** — Whether or not this user is an admin of the group.

===

## Get user by email

####Params:

- **email** _(String)_ **Required**. User's email.
- **opts** _(Object)_:
  - **include_deleted** _(Boolean, Number)_ Include deleted users in response. 0 = false, 1 = true. _(default: 0)_
  - **format** _(String)_ Desired response format: json or xml. _(default: json)_

####Example:

CoffeeScript

```coffeescript
hipchat.api.users.getByEmail 'new-email-address@hipchat.com', null, (err, res) ->
  throw err if err
  console.log res
```

JavaScript

```javascript
hipchat.api.users.getByEmail('new-email-address@hipchat.com', null, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

####Response:

```json
{
  "user": {
    "user_id": 5,
    "name": "Garret Heaton",
    "mention_name": "garret",
    "email": "new-email-address@hipchat.com",
    "title": "Co-founder",
    "photo_url": "https:\/\/www.hipchat.com\/img\/silhouette_125.png",
    "status": "available",
    "status_message": "Come see what I'm working on!",
    "is_group_admin": 1
  }
}
```

- **user_id** — User's ID.
- **name** — User's full name.
- **mention_name** — User's @mention name.
- **email** — User's email.
- **title** — User's title.
- **photo** — URL to user's photo. 125px on the longest side.
- **status** — User's current status. Either offline, away, dnd, or available.
- **status_message** — User's current status message.
- **is_group_admin** — Whether or not this user is an admin of the group.

===

## Get users by status

####Params:

- **status** _(String)_ **Required**. User's current status. Either offline, away, dnd, or available.
- **opts** _(Object)_:
  - **include_deleted** _(Boolean, Number)_ Include deleted users in response. 0 = false, 1 = true. _(default: 0)_
  - **format** _(String)_ Desired response format: json or xml. _(default: json)_

####Example:

CoffeeScript

```coffeescript
hipchat.api.users.getByStatus 'available', null, (err, res) ->
  throw err if err
  console.log res
```

JavaScript

```javascript
hipchat.api.users.getByStatus('available', null, function (err, res) {
  if (err) { throw err; }
  console.log(res);
});
```

####Response:

```json
{
  "users": [
    {
      "user_id": 3,
      "name": "Peter Curley",
      "mention_name": "pete",
      "email": "pete@hipchat.com",
      "title": "Designer",
      "photo_url": "https:\/\/www.hipchat.com\/pete.png",
      "last_active": 1360031425,
      "created": 1315711352,
      "status": "available",
      "status_message": "",
      "is_group_admin": 1,
      "is_deleted": 0
    },
    {
      "user_id": 5,
      "name": "Garret Heaton",
      "mention_name": "garret",
      "email": "new-email-address@hipchat.com",
      "title": "Co-founder",
      "photo_url": "https:\/\/www.hipchat.com\/img\/silhouette_125.png",
      "status": "available",
      "status_message": "Come see what I'm working on!",
      "is_group_admin": 1
    }
  ]
}
```

- **user_id** — User's ID.
- **name** — User's full name.
- **mention_name** — User's @mention name.
- **email** — User's email.
- **title** — User's title.
- **photo** — URL to user's photo. 125px on the longest side.
- **status** — User's current status. Either offline, away, dnd, or available.
- **status_message** — User's current status message.
- **is_group_admin** — Whether or not this user is an admin of the group.
