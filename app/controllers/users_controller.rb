class UsersController < ApplicationController
  def index
   redirect_to root_url
 end

 def show
   @user = User.find(params[:id])
 end

 def new
   @user =User.new
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
end

def update
    @user = User.find(params[:id])
    @user.update_attribute(:image, params[:user][:image])
end

private

 def user_params
    params.require(:user).permit(:username, :email, :password, :image, :aboutme)
 end
end
