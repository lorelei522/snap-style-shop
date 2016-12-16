class WelcomeController < ApplicationController
  def index
  end

  def create
    params[:welcome][:image].original_filename
  end
end
