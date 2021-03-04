'use strict'

/*
|--------------------------------------------------------------------------
| ServiceSeeder
|--------------------------------------------------------------------------
|
| Make use of the Factory instance to seed database with dummy data or
| make use of Lucid models directly.
|
*/

/** @type {import('@adonisjs/lucid/src/Factory')} */
const Factory = use('Factory')
const Database = use('Database')

class ServiceSeeder {
  async run () {
    await Database.table('services').insert([{
      name: 'dapo',
      description: 'Data pokok',
      active: '1'
    },{
      name: 'siakad',
      description: 'Siakad',
      active: '1'
    }])
  }
}

module.exports = ServiceSeeder
