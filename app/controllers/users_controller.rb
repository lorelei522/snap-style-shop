class UsersController < ApplicationController
  def index
   redirect_to root_url
 end

 def show
   @user = User.find(params[:id])
 end

 def new
   @user = User.new
 end

 def create
   @user = User.new(user_params)
   if @user.save
     session[:user_id] = @user.id
     flash[:notice]= "Success!"
     flash[:color]="valid"
     redirect_to root_url
   else
     flash[:notice]= "Form is invalid"
     flash[:color]="invalid"
     render "new"
   end
 end

def edit
  @user = User.find(params[:id])
end

def update
  # protect this route
  @user = User.find(params[:id])
  @user.update_attribute(:image, params[:user][:image])
  if @user.update(user_params)
    redirect_to user_path(@user)
  else
    @errors = @user.errors.full_messages
    render 'edit'
  end
end

private

 def user_params
    params.require(:user).permit(:username, :email, :password, :image, :aboutme)
 end
end
