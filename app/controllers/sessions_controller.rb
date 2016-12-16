class SessionsController < ApplicationController
  def new
end

def create
  user = User.find_by_email(params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    flash[:notice] = "Welcome to Personal Shopper, #{user.username}!"
    redirect_to users_path
  else
    flash[:danger] = 'Invalid email/password combination'
    render "new"
  end
end

def destroy
  # log_out
  if logged_in?
    session.clear
  end
  redirect_to root_url
end
end
