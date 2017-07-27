require 'SecureRandom'

class UserController < ApplicationController

  get '/' do
    users = User.all
    users.to_json
  end

  get '/:id' do
    id = params[:id]
    user = User.find(id)
    user.to_json
  end

  post '/register' do
    user_details = JSON.parse(request.body.read)
    user = User.new
    user.name = user_details["name"]
    user.email = user_details["email"]
    user.password = user_details["password"]
    user.image_url = user_details["image_url"]
    user.token = SecureRandom.hex
    user.save
    user.to_json
  end

  post '/login' do
    user_details = JSON.parse(request.body.read)
    user = User.find_by({email: user_details["email"]})
    if user && user.authenticate(user_details["password"])
      user.to_json
    else
      {error: "Login failed... try again or register as a new user"}.to_json
    end
  end

  patch '/:id' do
    id = params[:id]
    user = User.find(id)
    request_body = JSON.parse(request.body.read)
    user.update_attributes(request_body)
    user.save
    user.to_json
  end

  delete '/:id' do
    id = params[:id]
    user = User.find(id)
    user.destroy
    users = User.all
    users.to_json
  end

end
