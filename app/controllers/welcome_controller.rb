class WelcomeController < ApplicationController
  def index
  end

  def create
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
    binding.pry
    response_description_array = response[:responses][0][:label_annotations]
    pp  response_description_array
    response_description_array.each do |response|
      description_array << response[:description]
    end


    # clothing_item = params[:welcome][:image].original_filename
    #
    # service = Google::Apis::VisionV1::VisionService.new
    # service.authorization = \
    #     Google::Auth.get_application_default(['https://www.googleapis.com/auth/cloud-platform'])
    # content = File.read(clothing_item)
    # image = Google::Apis::VisionV1::Image.new(content: content)
    # feature = Google::Apis::VisionV1::Feature.new(type: 'IMAGE_PROPERTIES')
    #
    # annotate_image_request_object = Google::Apis::VisionV1::BatchAnnotateImagesRequest.new(requests: [
    #   {
    #     image: image,
    #     features: [feature]
    #   }
    # ])
    #
    # response = service.annotate_image(annotate_image_request_object)
    # response_hash = response.to_h
    # colors = response_hash[:responses][0][:image_properties_annotation][:dominant_colors][:colors][0][:color]
    # colors_number =[]
    # colors_number << colors[:red]
    # colors_number << colors[:green]
    # colors_number << colors[:blue]
    # hexcode = "##{colors_number[0].to_s(16).rjust(2, '0').upcase}#{colors_number[1].to_s(16).rjust(2, '0').upcase}#{colors_number[2].to_s(16).rjust(2, '0').upcase}"
  end
end
