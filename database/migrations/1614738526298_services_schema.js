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
      table.timestamp('created_at').defaultTo(this.fn.now()).notNullable()
      // table.timestamp('updated_at').nullable()
      table.timestamp('deleted_at').nullable()
    })
    this.raw("ALTER TABLE services ADD COLUMN updated_at timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP AFTER created_at")
  }

  down () {
    this.drop('services')
  }
}

module.exports = ServicesSchema
