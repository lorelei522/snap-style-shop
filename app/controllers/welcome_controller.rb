class WelcomeController < ApplicationController
  def index
  end

  def create
    pp @products = shopstylecall
    redirect_to product_path(@products)
  end

  private
    def find_final_response(description_array, clothing_array)
      description_array.find { |search| clothing_array.include?(search) }
    end

    def clothing_array
      ["suit", "formal wear", "tuxedo", "sweater", "blouse", "t-shirt", "cardigan", "jeans", "trousers", "plaid", "dress shirt",  "wedding dress", "gown", "hood", "watch", "sleeve", "shoulder bag", "footwear", "shoe", "running shoe", "athletic shoe", "outerwear", "long sleeve t-shirt", "watch", "dress", "little black dress", "day dress", "bag", "handbag", "sunglasses", "eyewear", "glasses", "hat", "fedora", "costume hat"]
    end
end
