class BreedsController < ApplicationController
  require 'net/http'

  def index
  end

  def fetch_breed
    breed = params[:breed]
    #url = URI("https://dog.ceo/api/breed/#{breed}/images/random")
    url = URI("https://dog.ceo/api/breeds/image/random")
    response = Net::HTTP.get(url)
    result = JSON.parse(response)

    if result['status'] == 'success'
      @breed = breed
      @image_url = result['message']
    else
      @error = "Breed not found"
    end

    respond_to do |format|
      format.html { render partial: 'breed_result' }
    end
  end
end
