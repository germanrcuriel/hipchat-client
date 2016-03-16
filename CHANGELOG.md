## 1.0.5 (2016-03-16)

  Bugfixes:

    - Manage unexpected hipchat errors

## 1.0.4 (2014-04-18)

  Bugfixes:

    - Set up a default error

## 1.0.3 (2014-03-17)

  Bugfixes:

    - Move `coffee-script` dependency to `devDependencies`

## 1.0.2 (2014-06-18)

  Bugfixes:

    - Add .npmignore

## 1.0.1 (2014-06-18)

  Bugfixes:

    - Remove postpublish script

## 1.0.0 (2014-06-18)

Features:

  - Refactor of all the code, including breaking changes.
  - Support to all methods of the official HipChat API
  - Added the following custom methods:
    - `rooms.getByName`
    - `rooms.getByXmppJid`
    - `users.getByMentionName`
    - `users.getByName`
    - `users.getByEmail`
    - `users.getByStatus`
  - Added tests (finally)
  - Added documentation on docs folder
  - Updated README

## 0.1.2 (2014-06-17)

Bugfixes:

  - Update callbacks with error and response (node.js style)

## 0.1.1 (2014-05-05)

  - Update README with some badges

## 0.1.0 (2014-05-05)

Features:

  - Add `getRoomByIdByJid`, `getRoomParticipantIds`, `getUsers` methods.

## 0.0.9 (2013-08-29)

Features:

  - Add message format to sendRoomMessage method (default to 'html').

## 0.0.8 (2013-08-28)

Bugfixes:

  - Fix a bug comparing in sendMessageRoom method.
