'use strict'
/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */

class CekHeader {
  /**
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Function} next
   */
  async handle({
    request,
    response
  }, next) {
    // call next to advance the request
    const Encryption = use('Encryption')
    const Database = use('Database')

    var serviceId = Encryption.decrypt(request.header('X-UHB'))

    var service = await Database.select('id', 'name').from('services').where('id', serviceId).first()

    if (!service)
      return response.status(403).json('unauthorized')

    await next()
  }
}

module.exports = CekHeader
