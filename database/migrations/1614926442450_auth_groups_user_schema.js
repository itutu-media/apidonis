'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class AuthGroupsUserSchema extends Schema {
  up () {
    this.create('auth_groups_users', (table) => {
      table.increments()
      table.integer('group_id')
      table.integer('user_id')
    })
  }

  down () {
    this.drop('auth_groups_users')
  }
}

module.exports = AuthGroupsUserSchema
