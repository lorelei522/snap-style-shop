
class ProductsController < ApplicationControllers
  # comments like this become outdated very fast!

  #making the search_keyword split? when we get the GOOGLE VISION to work
  #does it get passed like "black dress" or "black+dress" to shopstyle
  #because of how the json string comes back use ["products"] to get the actual products

  def index
    @products = shopstylecall
  end
end
