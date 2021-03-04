'use strict'

class AuthController {
  async login({
    auth,
    request
  }) {
    const {
      refreshToken,
      email,
      password
    } = request.post();
    if (refreshToken) {
      return await auth.
      generateForRefreshToken(refreshToken);
    }
    return auth.withRefreshToken().attempt(email, password);
  }
}

module.exports = AuthController
