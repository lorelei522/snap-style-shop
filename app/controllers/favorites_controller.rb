class FavoritesController < ApplicationController

  def create
    if logged_in?
      @product =  Product.create(product_params)
      @favorite = Favorite.new(product_id: @product.id)
      @favorite.user_id = current_user.id
      @favorite.save
    end
  end

  private

  def product_params
    params.require(:p).permit(:image, :link, :name, :price)
  end
end
