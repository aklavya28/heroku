module ApplicationHelper
  def gravatar_for(user, options = {size: 80})
      email_address = user.email.downcase
      size = options[:size]
      hash = Digest::MD5.hexdigest(email_address)
      gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
      image_tag(gravatar_url, alt: user.username)
    # return  render plain: gravatar_url
  end



  def current_user
    # if session[:user_id]
    #   User.find(session[:user_id])
    @current_user ||=   User.find(session[:user_id]) if session[:user_id]
  end
  def logged_in?
    !!current_user
  end
  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end

end
