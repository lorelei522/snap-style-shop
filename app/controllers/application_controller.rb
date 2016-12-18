class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  #put back "dress" #put in there for a test!!!!! -Lori
  def clothing_array
    ["suit", "formal wear", "tuxedo", "sweater", "blouse", "t-shirt", "cardigan", "jeans", "trousers", "plaid", "dress shirt",  "wedding dress", "gown", "hood", "watch", "sleeve", "shoulder bag", "footwear", "shoe", "running shoe", "athletic shoe",
    "outerwear", "long sleeve t-shirt", "watch", "little black dress", "day dress", "bag", "handbag", "sunglasses", "eyewear", "glasses", "fedora", "costume hat"]
  end

  def find_final_response(description_array, clothing_array)
    description_array.find { |search| clothing_array.include?(search) }
  end

  def search_word
    clothing_item = params[:products][:image]

    service = Google::Apis::VisionV1::VisionService.new
    service.authorization = \
        Google::Auth.get_application_default(['https://www.googleapis.com/auth/cloud-platform'])
    content = File.read(clothing_item)
    image = Google::Apis::VisionV1::Image.new(content: content)
    feature = Google::Apis::VisionV1::Feature.new(type: 'LABEL_DETECTION')

    annotate_image_request_object = Google::Apis::VisionV1::BatchAnnotateImagesRequest.new(requests: [
      {
        image: image,
        features: [feature]
      }
    ])

    response = service.annotate_image(annotate_image_request_object)
    description_array = []
    response = response.to_h
    description_number = response[:responses][0][:label_annotations].length
    response_description_array = response[:responses][0][:label_annotations]

    response_description_array.each do |response|
      description_array << response[:description]
    end

    pp find_final_response(description_array, clothing_array)
  end

  def image_query
    clothing_item = params[:products][:image]

    service = Google::Apis::VisionV1::VisionService.new
    service.authorization = \
        Google::Auth.get_application_default(['https://www.googleapis.com/auth/cloud-platform'])
    content = File.read(clothing_item)
    image = Google::Apis::VisionV1::Image.new(content: content)
    feature = Google::Apis::VisionV1::Feature.new(type: 'IMAGE_PROPERTIES')

    annotate_image_request_object = Google::Apis::VisionV1::BatchAnnotateImagesRequest.new(requests: [
      {
        image: image,
        features: [feature]
      }
    ])

    response = service.annotate_image(annotate_image_request_object)
    response_hash = response.to_h
    colors = response_hash[:responses][0][:image_properties_annotation][:dominant_colors][:colors][0][:color]
    colors_number =[]
    colors_number << colors[:red]
    colors_number << colors[:green]
    colors_number << colors[:blue]
    hexcode = "##{colors_number[0].to_s(16).rjust(2, '0').upcase}#{colors_number[1].to_s(16).rjust(2, '0').upcase}#{colors_number[2].to_s(16).rjust(2, '0').upcase}"
  end

  #need to adjust shopstylecall
  def shopstylecall
    # query_params = search_word
    limit = 50
    # shopstyle_response_api = open("http://api.shopstyle.com/api/v2/products?pid=#{Dotenv.load["SHOPSTYLE_TOKEN"]}&fts=#{search_word}&offset=0&limit=#{limit}").read
    shopstyle_response_api = open("http://api.shopstyle.com/api/v2/products?pid=#{Dotenv.load["SHOPSTYLE_TOKEN"]}&fts=#{search_word}&fl=p10&fl=p11&fl=p12&fl=p9&limit=#{limit}").read
    pp shopstyle_response = JSON.parse(shopstyle_response_api)["products"]
    shopstyle_response.map! do |product|
      {
        image: product['image']['sizes']['XLarge']['url'],
        link: product['clickUrl'],
        name: product['name'],
        price: product['priceLabel']
      }
    end
  end

end
