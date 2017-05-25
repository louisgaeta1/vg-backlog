def logged_in?
  session.has_key?(:user_id)
end

def current_user
  User.find_by_id(session[:user_id])
end

def authorized?(user)
  logged_in? && current_user == user
end
