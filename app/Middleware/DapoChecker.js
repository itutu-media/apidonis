'use strict'
/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */

class DapoChecker {
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

    if (!request.header('X-UHB'))
      return response.status(401).json({
        status: false,
        message: 'unauthorized'
      })

    var serviceId = Encryption.decrypt(request.header('X-UHB'))

    var service = await Database.select('id').from('services').where('id', serviceId).first()

    if (service.id != 1)
      return response.status(401).json({
        status: false,
        message: 'unauthorized'
      })

    await next()
  }
}

module.exports = DapoChecker
