'use strict'

/*
|--------------------------------------------------------------------------
| GroupSeeder
|--------------------------------------------------------------------------
|
| Make use of the Factory instance to seed database with dummy data or
| make use of Lucid models directly.
|
*/

/** @type {import('@adonisjs/lucid/src/Factory')} */
const Factory = use('Factory')
const Database = use('Database')

class GroupSeeder {
  async run () {
    await Database.table('auth_groups').insert([{
      name: 'dosen',
      description: 'Dosen',
    },{
      name: 'karyawan',
      description: 'Karyawan',
    },{
      name: 'mahasiswa',
      description: 'Mahasiswa',
    },{
      name: 'alumni',
      description: 'Alumni',
    }])
  }
}

module.exports = GroupSeeder
