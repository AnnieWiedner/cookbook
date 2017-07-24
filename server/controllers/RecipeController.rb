class RecipeController < Sinatra::Base

  options '*' do
    response['Access-Control-Allow-Origin'] = '*'
    response['Access-Control-Allow-Headers'] = 'content-type'
    response['Access-Control-Allow-Methods'] = 'GET,POST,PATCH,DELETE'
    200
  end

  get '/' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    recipes = Recipe.all
    recipes.to_json
  end

  get '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    recipe = Recipe.find(id)
    recipe.to_json
  end

  post '/' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    request_body = JSON.parse(request.body.read)
    recipe = Recipe.new(request_body)
    recipe.save
    recipe.to_json
  end

  patch '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    recipe = Recipe.find(id)
    request_body = JSON.parse(request.body.read)
    recipe.update_attributes(request_body)
    recipe.save
    recipe.to_json
  end

  delete '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    recipe = Recipe.find(id)
    recipe.destroy
    recipes = Recipe.all
    recipes.to_json
  end

end
