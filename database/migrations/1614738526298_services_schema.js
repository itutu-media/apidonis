'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class ServicesSchema extends Schema {
  up () {
    this.create('services', (table) => {
      table.increments()
      table.string('name', 20).notNullable().unique()
      table.string('description').notNullable()
      table.enu('active', ['0','1'])
      table.timestamps()
    })
  }

  down () {
    this.drop('services')
  }
}

module.exports = ServicesSchema
