
'use strict'

/*
|--------------------------------------------------------------------------
| GroupsuserSeeder
|--------------------------------------------------------------------------
|
| Make use of the Factory instance to seed database with dummy data or
| make use of Lucid models directly.
|
*/

/** @type {import('@adonisjs/lucid/src/Factory')} */
const Factory = use('Factory')
const Database = use('Database')

class GroupsuserSeeder {
  async run () {
    await Database.table('auth_groups_users').insert([{
      group_id: '1',
      user_id: '1',
    },{
      group_id: '2',
      user_id: '2',
    },{
      group_id: '3',
      user_id: '3',
    },{
      group_id: '4',
      user_id: '4',
    }])
  }
}

module.exports = GroupsuserSeeder
