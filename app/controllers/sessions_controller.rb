class SessionsController < ApplicationController
  def new
  end

  def create
    # binding.pry
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome to Personal Shopper, #{user.username}!"
      redirect_to users_path
    else
      @errors = ['Invalid email/password combination']
      render "new"
    end
  end

  def destroy
    if logged_in?
      session.clear
    end
    redirect_to root_url
  end
end
