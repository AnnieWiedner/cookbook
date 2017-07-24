class UserController < Sinatra::Base

  options '*' do
    response['Access-Control-Allow-Origin'] = '*'
    response['Access-Control-Allow-Headers'] = 'content-type'
    response['Access-Control-Allow-Methods'] = 'GET,POST,PATCH,DELETE'
    200
  end

  get '/' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    users = User.all
    users.to_json
  end

  get '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    user = User.find(id)
    user.to_json
  end

  post '/register' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    request_body = JSON.parse(request.body.read)
    user = User.new(request_body)
    user.save
    user.to_json
  end

  post '/login' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    request_body = JSON.parse(request.body.read)
    user = User.find_by({email: request_body["email"]})
    if user && user.authenticate(request_body["password"])
      user.to_json
    else
      p "user not there"
    end
  end

  patch '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    user = User.find(id)
    request_body = JSON.parse(request.body.read)
    user.update_attributes(request_body)
    user.save
    user.to_json
  end

  delete '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    user = User.find(id)
    user.destroy
    users = User.all
    users.to_json
  end

end
