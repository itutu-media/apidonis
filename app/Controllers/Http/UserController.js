'use strict'

class UserController {
  async login({
    auth,
    request,
    response
  }) {
    const Database = use('Database')

    const {
      email,
      password
    } = request.all()

    var res = {}

    try {
      await auth.attempt(email, password)

      const data = await Database.select('id', 'username', 'email').from('users').where('email', email).first()
      res = {
        status: true,
        message: 'Logged in successfully',
        data
      }
      response.status(200).json(res)
    } catch (e) {
      res = {
        status: false,
        message: e.message
      }
      response.status(401).json(res)
    }
  }

  show({
    auth,
    params
  }) {
    return auth.user
  }
}

module.exports = UserController
