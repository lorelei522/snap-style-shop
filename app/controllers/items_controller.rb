class ItemsController < ApplicationController

  def new
    if logged_in?
      @item = Item.new
    else
      redirect_to new_session_path
    end
  end

  def create
    if logged_in?
      @item =  Item.new(item_params)

      if @item.save
        redirect_to products_path
      else
        flash[:notice]= "Picture is invalid"
        render "welcome/index"
      end
    else
      redirect_to new_session_path
    end 
  end

  private

  def item_params
    params.require(:items).permit(:image)
  end
end
