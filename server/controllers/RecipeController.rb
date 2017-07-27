class RecipeController < ApplicationController

  get '/' do
    recipes = Recipe.all
    # binding pry
    recipes.to_json
  end

  get '/:id' do
    id = params[:id]
    recipe = Recipe.find(id)
    recipe.to_json
  end

  post '/' do
    token = params[:token]
    user = User.where(token: token)
    user_id = user[0].id
    request_body = JSON.parse(request.body.read)
    recipe = Recipe.new(request_body)
    recipe["user_id"] = user_id
    recipe.save
    Recipe.all.to_json
  end

  patch '/:id' do
    id = params[:id]
    recipe = Recipe.find(id)
    request_body = JSON.parse(request.body.read)
    recipe.update_attributes(request_body)
    recipe.save
    Recipe.all.to_json
  end

  delete '/:id' do
    id = params[:id]
    recipe = Recipe.find(id)
    recipe.destroy
    Recipe.all.to_json
  end

end
