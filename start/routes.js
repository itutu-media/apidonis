'use strict'

/*
|--------------------------------------------------------------------------
| Routes
|--------------------------------------------------------------------------
|
| Http routes are entry points to your web application. You can create
| routes for different URLs and bind Controller actions to them.
|
| A complete guide on routing is available here.
| http://adonisjs.com/docs/4.1/routing
|
*/

/** @type {typeof import('@adonisjs/framework/src/Route/Manager')} */
const Route = use('Route')
const Env = use('Env')

Route.get('/', () => {
  return 'Server is ready'
})

Route.resource('coba', 'CobaController')

Route.post('login', 'UserController.login').middleware(['guest','dapo'])
Route.post('auth', 'AuthController.login').middleware(['guest','dapo'])
// Route.get('users/:id', 'UserController.show').middleware('auth')

Route.get('mhs', 'MhsController.index').middleware(['auth','dapo'])
