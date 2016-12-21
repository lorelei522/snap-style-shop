
class ProductsController < ApplicationController
  #making the search_keyword split? when we get the GOOGLE VISION to work
  #does it get passed like "black dress" or "black+dress" to shopstyle
  #because of how the json string comes back use ["products"] to get the actual products

  def index
    if logged_in?
      @products = shopstylecall
    else
      redirect_to new_session_path
    end 
  end
end
