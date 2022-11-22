module ArticlesHelper

  def c_user
    @c_user ||= User.find(session[:user_id]) if session[:user_id]

  end
  def login?
      !!c_user
  end

end
