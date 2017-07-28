require 'bundler'
Bundler.require

require './models/RecipeModel'
require './models/UserModel'


require './controllers/ApplicationController'
require './controllers/RecipeController'
require './controllers/UserController'


run Sinatra::Application

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'cookbooks'
)


map('/recipes'){run RecipeController}
map('/users'){run UserController}
