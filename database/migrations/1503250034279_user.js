'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class UserSchema extends Schema {
  up () {
    this.create('users', (table) => {
      table.increments()
      table.string('username', 32).notNullable().unique()
      table.string('email', 255).notNullable().unique()
      table.string('password', 255).notNullable()
      table.timestamp('created_at').defaultTo(this.fn.now()).notNullable()
      // table.timestamp('updated_at').nullable()
      table.timestamp('deleted_at').nullable()
    })
    this.raw("ALTER TABLE users ADD COLUMN updated_at timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP AFTER created_at")
  }

  down () {
    this.drop('users')
  }
}

module.exports = UserSchema
