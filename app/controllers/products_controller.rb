
class ProductsController < ApplicationController
  def index
    if logged_in?
      @products = shopstylecall
    else
      redirect_to new_session_path
    end
  end
end
