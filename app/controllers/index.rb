require 'bcrypt'

enable :sessions

get '/' do
  erb :index
end

get '/register' do
  erb :register
end

post '/add_user' do
  password = BCrypt::Password.create(params[:password])
  user = User.create(name: params[:name], email: params[:email], password: params[:password])
  # user.decks << Deck.find([0,1]) #give user some starter decks.

  login! user #this method (and others) in login_helper.rb
  erb :decks
end

post '/login' do
  user = User.find_by_email(params[:email])
  if user.password == params[:password]
    login! user
    redirect '/decks'
  else
    @message = "Login failed"
    erb :index
  end
end

get '/logout' do
  @message = "Thanks for playing, #{current_user.name}."
  logout!
  erb :index
end
