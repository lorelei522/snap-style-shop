class WelcomeController < ApplicationController
  def index
  end

  # def create
  #   if logged_in?
  #     pp @products = shopstylecall
  #     redirect_to product_path(@products)
  #   else
  #     redirect_to new_session_path
  #   end
  # end

  private
    def clothing_array
      ["suit", "formal wear", "tuxedo", "sweater", "blouse", "t-shirt", "cardigan", "jeans", "trousers", "plaid", "dress shirt",  "wedding dress", "gown", "hood", "watch", "sleeve", "shoulder bag", "footwear", "shoe", "running shoe", "athletic shoe", "outerwear", "long sleeve t-shirt", "watch", "dress", "little black dress", "day dress", "bag", "handbag", "sunglasses", "eyewear", "glasses", "hat", "fedora", "costume hat"]
    end
end
