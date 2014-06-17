fixtures =

  create:
    user:
      user_id: 3
      name: 'New Guy'
      email: 'new@company.com'
      title: 'Intern'
      password: 'd294H58zlE'
      photo_url: 'https:\/\/www.hipchat.com\/img\/silhouette_125.png'
      status: 'offline'
      status_message: ''
      is_group_admin: '0'

  delete:
    deleted: true

  list:
    users: [
      user_id: 1
      name: 'Chris Rivers'
      mention_name: 'chris'
      email: 'chris@hipchat.com'
      title: 'Developer'
      photo_url: 'https:\/\/www.hipchat.com\/chris.png'
      last_active: 1360031425
      created: 1315711352
      status: 'away'
      status_message: 'gym bbl'
      is_group_admin: 1
      is_deleted: 0
    ,
      user_id: 2
      name: 'Peter Curley'
      mention_name: 'pete'
      email: 'pete@hipchat.com'
      title: 'Designer'
      photo_url: 'https:\/\/www.hipchat.com\/pete.png'
      last_active: 1360031425
      created: 1315711352
      status: 'offline'
      status_message: ''
      is_group_admin: 1
      is_deleted: 0
    ]

  show:
    user:
      user_id: 5
      name: 'Garret Heaton'
      mention_name: 'garret'
      last_active: 1360031425
      created: 1315711352
      email: 'garret@hipchat.com'
      title: 'Co-founder'
      photo_url: 'https:\/\/www.hipchat.com\/img\/silhouette_125.png'
      status: 'available'
      status_message: 'Come see what I´m working on!'
      is_group_admin: 1

  undelete:
    undeleted: true

  update:
    user:
      user_id: 5
      name: 'Garret Heaton'
      mention_name: 'garret'
      email: 'garret@hipchat.com'
      title: 'Co-founder'
      photo_url: 'https:\/\/www.hipchat.com\/img\/silhouette_125.png'
      status: 'available'
      status_message: 'Come see what I´m working on!'
      is_group_admin: 1

module.exports = fixtures
