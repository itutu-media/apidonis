'use strict'

class DapoController {
  async index ({ request, response, view }) {
    const Database = use('Database')

    var services = await Database.table('services')

    response.status(200).json(services)
  }
}

module.exports = DapoController
