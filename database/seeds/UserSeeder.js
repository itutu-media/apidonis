'use strict'

/*
|--------------------------------------------------------------------------
| UserSeeder
|--------------------------------------------------------------------------
|
| Make use of the Factory instance to seed database with dummy data or
| make use of Lucid models directly.
|
*/

/** @type {import('@adonisjs/lucid/src/Factory')} */
const Factory = use('Factory')
const Database = use('Database')
const Hash = use('Hash')

class UserSeeder {
  async run() {
    await Database.table('users').insert([{
      username: 'demouser',
      email: 'demo@mail.com',
      password: await Hash.make('password')
    },{
      username: 'demouser2',
      email: 'demo2@mail.com',
      password: await Hash.make('password')
    }])
  }
}

module.exports = UserSeeder
