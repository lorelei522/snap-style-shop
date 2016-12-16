
class ProductsController < ApplicationController
  #making the search_keyword split? when we get the GOOGLE VISION to work
  #does it get passed like "black dress" or "black+dress" to shopstyle
  #because of how the json string comes back use ["products"] to get the actual products
  def create
  end

  def index
    query_params = params[:query]
    limit = 4
    shopstyle_response_api = open("http://api.shopstyle.com/api/v2/products?pid=#{Dotenv.load["SHOPSTYLE_TOKEN"]}&fts=#{query_params}&offset=0&limit=#{limit}").read
    shopstyle_response = JSON.parse(shopstyle_response_api)["products"]
    @products = shopstyle_response.map! do |product|
      {
        image: product['image']['sizes']['XLarge']['url'],
        link: product['clickUrl'],
        name: product['name'],
        price: product['priceLabel'],
      }
    end
    @products
    #shopstyle_products = Product.create() USE THIS IF WE WANT TO SAVE EACH RETURN INTO THE database
  end

private
    def shopstyle_api
      "http://api.shopstyle.com/api/v2/products?pid="
    end

end
