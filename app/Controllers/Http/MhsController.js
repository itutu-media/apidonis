'use strict'
const User = use('App/Models/User')
const GroupUser = use('App/Models/AuthGroupsUser')
const Redis = use('Redis')

class MhsController {
  results = {}
  statusCode = 200

  async index({
    request,
    response
  }) {
    const expiredTime = 600

    const page = parseInt(request.get().page) || 1
    const limit = parseInt(request.get().limit) || 20
    const offset = parseInt(limit * (page - 1))
    const keyword = request.get().keyword || false
    const sort = request.get().sort || false

    let total = parseInt(await GroupUser.query().where('group_id', 3).getCount())
    let pages = Math.ceil(total / limit)

    let meta = {
      total,
      limit,
      page,
      pages,
      sort,
      keyword
    }

    const isUpdate = await Redis.get('update')
    const cachedMhs = await Redis.get('mhs:' + JSON.stringify(meta))

    if (cachedMhs && request.get() && isUpdate === 'false') {
      let cachedData = JSON.parse(cachedMhs)
      let mhs = cachedData.data
      this.results.status = true
      this.results.message = mhs.length + ' data ditemukan di cache'
      this.results.meta = meta
      this.results.properties = cachedData.properties
      this.results.data = mhs
    } else {

      try {
        let query = User.query().innerJoin('auth_groups_users', 'user_id', 'users.id').where('group_id', 3).offset(offset).limit(limit)
        
        // if (keyword) query.where('referrers_name', 'ILIKE', '%' + keyword + '%')

        if (keyword) {
          let arr = keyword.split(',')
          arr.forEach((item) => {
            let field = item.substring(0, item.indexOf("("))
            let value = item.match(/\((.*)\)/)[1]
            query.where(field, 'LIKE', '%' + value + '%')
          })
        }

        if (sort) {
          let arr = sort.split(',')
          arr.forEach((item) => {
            let order = item.substring(0, item.indexOf("("))
            let field = item.match(/\((.*)\)/)[1]
            query.orderBy(field, order)
          })
        }
        query.orderBy('users.id', 'asc')

        let mhs = await query.fetch()

        let set_at = new Date()
        let expired_at = set_at.setSeconds(set_at.getSeconds() + expiredTime);

        let cacheReferrer = {
          properties: {
            set_at,
            expired_at
          },
          data: mhs
        }

        await Redis.setex('mhs:' + JSON.stringify(meta), expiredTime, JSON.stringify(cacheReferrer))
        await Redis.set('update', false)

        this.results.status = true
        this.results.message = mhs.rows.length + ' data ditemukan di database'
        this.results.meta = meta
        this.results.properties = cacheReferrer.properties
        this.results.data = mhs

      } catch (e) {
        this.statusCode = 500
        this.results.status = false
        this.results.message = e.message || 'Terjadi kesalahan dalam mendapatkan data'
        this.results.data = null
      }

    }
    return response.status(this.statusCode).json(this.results)
  }
}

module.exports = MhsController
