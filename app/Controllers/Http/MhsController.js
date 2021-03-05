'use strict'
const User = use('App/Models/User')

class MhsController {
  results = {}
  statusCode = 200

  async index({
    request,
    response
  }) {
    const page = parseInt(request.get().page) || 1
    const limit = parseInt(request.get().limit) || 20
    const offset = parseInt(limit * (page - 1))
    const keyword = request.get().keyword || false
    const sort = request.get().sort || false

    let total = parseInt(await User.query().getCount())
    let pages = Math.ceil(total / limit)

    let meta = {
      total,
      limit,
      page,
      pages,
      sort,
      keyword
    }

    try {
      let query = User.query().innerJoin('auth_groups_users', 'user_id', 'users.id').where('group_id', 3).offset(offset).limit(limit)
      // if (keyword) query.where('referrers_name', 'ILIKE', '%' + keyword + '%')

      // if (sort) {
      //   let arr = sort.split(',')
      //   arr.forEach((item) => {
      //     let order = item.substring(0, item.indexOf("("))
      //     let field = item.match(/\((.*)\)/)[1]
      //     query.orderBy(field, order)
      //   })
      // }

      let mhs = await query.fetch()

      
      this.results.status = true
      this.results.message = mhs.rows.length + ' data ditemukan di database'
      this.results.meta = meta
      // this.results.properties = cacheReferrer.properties
      this.results.data = mhs
    } catch (e) {
      this.statusCode = 500
      this.results.status = false
      this.results.message = e.message || 'Terjadi kesalahan dalam mendapatkan data'
      this.results.data = null
    }
    return response.status(this.statusCode).json(this.results)
  }
}

module.exports = MhsController
