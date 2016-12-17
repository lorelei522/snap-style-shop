class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def search_word
    clothing_item = params[:welcome][:image].original_filename

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

    pp response = service.annotate_image(annotate_image_request_object)
    description_array = []
    response = response.to_h
    description_number = response[:responses][0][:label_annotations].length
    response_description_array = response[:responses][0][:label_annotations]

    response_description_array.each do |response|
      description_array << response[:description]
    end

    find_final_response(description_array, clothing_array)
  end
end
