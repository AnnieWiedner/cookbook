require 'bundler'
Bundler.require

require './models/UserModel'
require './models/RecipeModel'

require './controllers/UserController'
require './controllers/RecipeController'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'cookbooks'
)

map('/users'){run UserController}
map('/recipes'){run RecipeController}
