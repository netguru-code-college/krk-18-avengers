# frozen_string_literal: true

class NasaService
  include HTTParty
  base_uri 'https://api.nasa.gov'

  def get_image_url(action_name = 'planetary')
    count = (1..15).to_a.sample
    results = self.class.get("/#{action_name}/apod?api_key=#{Rails.application.credentials.nasa_apikey}&count=#{count}")
    result = results.sample
    result.dig('url')
  end
end
