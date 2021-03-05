'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class AuthGroupSchema extends Schema {
  up () {
    this.create('auth_groups', (table) => {
      table.increments()
      table.string('name', 20).notNullable().unique()
      table.string('description').notNullable()
      table.timestamp('created_at').defaultTo(this.fn.now()).notNullable()
      // table.timestamp('updated_at').nullable()
      table.timestamp('deleted_at').nullable()
    })
    this.raw("ALTER TABLE auth_groups ADD COLUMN updated_at timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP AFTER created_at")
  }

  down () {
    this.drop('auth_groups')
  }
}

module.exports = AuthGroupSchema
