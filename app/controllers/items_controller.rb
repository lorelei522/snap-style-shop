class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item =  Item.new(item_params)

    if @item.save
      @products = shopstylecall
      redirect_to product_path(@products)
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
