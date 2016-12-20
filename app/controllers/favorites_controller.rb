class FavoritesController < ApplicationController

  def create
    if logged_in?
      @product =  Product.find_or_create_by(product_params)
      @favorite = Favorite.new(product_id: @product.id)
      @favorite.user_id = current_user.id
      @favorite.save
      if request.xhr?
        render 'products/_delete_partial', layout: false
        # render json: {id: @favorite.id}
      end
    end
  end


  def destroy
     favorite = Favorite.find(params[:id])
     @product = favorite.product
     if logged_in? && authorized?(favorite)
      favorite.destroy
      if request.xhr?
        render json: {status: "status 200"}
      else
  #stretch: give non-JS users access to delete
        redirect_to user_path(current_user)
      end
    else
      redirect_to new_session_path
   end
  end

private

  def product_params
    params.require(:p).permit(:image, :link, :name, :price)
  end
end
