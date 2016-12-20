class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    binding.pry
    @item =  Item.new(item_params)

    if @item.save
      #check where to redirect to
      redirect_to
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
