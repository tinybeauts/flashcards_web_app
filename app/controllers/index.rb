require 'bcrypt'

enable :sessions

get '/' do
  sessions[:current_user_id] ? erb :decks : erb :index
end

get '/register' do
  erb :register
end

post '/add_user' do
  password = BCRYPT::Password.create(params[:password])
  user = User.create(name: params[:name], email: params[:email], password: password)
  login! user
  erb: decks
end

post '/login' do
  user = User.find_by_email(params[:email])
  if user.password == params[:password]
    login! user
    erb: decks
  else
    @message = "Login failed"
    erb: index
  end
end

post '/logout' do
  logout!
  erb :index
end
