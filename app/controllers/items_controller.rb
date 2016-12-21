class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item =  Item.new(item_params)

    if @item.save
      redirect_to products_path
    else
      flash[:notice]= "Picture is invalid"
      render "new"
    end
  end

  private

  def item_params
    params.require(:items).permit(:image)
  end
end
