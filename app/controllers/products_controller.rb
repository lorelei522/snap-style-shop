class ProductsController < ApplicationController
  #making the search_keyword split? when we get the GOOGLE VISION to work
  #does it get passed like "black dress" or "black+dress" to shopstyle
  #because of how the json string comes back use ["products"] to get the actual products
  def create
    @products = []
    query_params = params[:query]
    #getting an error that the below doesn't exist but if i copy and paste into the query it exists
    shopstyle_response_api = open(shopstyle_api + shopstyle_token2 + "&fts=" + query_params + "&offset=0&limit=2").read
    shopstyle_response = JSON.parse(shopstyle_response_api)["products"]
    @products = shopstyle_response
    redirect_to product_path(@products)
    # @products =  shopstyle_response.map! do |product|
    #   image = product["images"].select { |i| i["sizeName"] == 'Large' }.pop
    #   puts image.inspect
    #   {
    #     'name' => product["name"],
    #     'image' => image
    #   }
    # end
    #shopstyle_products = Product.create() USE THIS IF WE WANT TO SAVE EACH RETURN INTO THE database
  end

private
    def shopstyle_api
      "http://api.shopstyle.com/api/v2/products?pid="
    end

    def shopstyle_token2
      "uid2849-2518543-97"
    end
end
