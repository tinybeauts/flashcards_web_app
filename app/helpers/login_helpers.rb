def login! user
  session[:current_user_id] = user.id
end

def logout!
  session.clear
end

def logged_in?
  session[:current_user_id].present?
end

def current_user
  return nil unless logged_in?
  @current_user ||= User.find(session[:current_user_id])
end

def logged_in_redirect
  unless logged_in?
    redirect '/'
  end
end

