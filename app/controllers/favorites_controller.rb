class FavoritesController < ApplicationController

  def create
    # binding.pry
    if logged_in?
      @product =  Product.find_or_create_by(product_params)
      @favorite = Favorite.new(product_id: @product.id)
      @favorite.user_id = current_user.id
      @favorite.save
      # there's a "rails" way to tell this controller action:
      # if the request is expection json, send this, and
      # if the request is expecting html, send this, etc.
      if request.xhr?
        render json: {
          id: @favorite.id,
          delete_partial: render_to_string('products/_delete_partial', layout: false, locals: {favorite: @favorite })
        }
        # render json: {id: @favorite.id}
      end
    end
  end



 def destroy
  # proper error status codes for http response
     favorite = Favorite.find(params[:id])
     @product = favorite.product
     if logged_in? && authorized?(favorite)
      favorite.destroy
      if request.xhr?
        # binding.pry
        render json: {
          id: favorite.id,
          like_partial: render_to_string('products/like_button_partial', layout: false, locals: { product: @product })
        }
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
    params.require(:product).permit(:image, :link, :name, :price)
  end
end
