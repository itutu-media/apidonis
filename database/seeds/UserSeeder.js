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
      username: 'demodosen',
      email: 'demodosen@mail.com',
      password: await Hash.make('password')
    },{
      username: 'demostaf',
      email: 'demostaf@mail.com',
      password: await Hash.make('password')
    },{
      username: 'demomhs',
      email: 'demomhs@mail.com',
      password: await Hash.make('password')
    },{
      username: 'demoalumni',
      email: 'demoalumni@mail.com',
      password: await Hash.make('password')
    }])
  }
}

module.exports = UserSeeder
