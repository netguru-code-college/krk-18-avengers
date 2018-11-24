class NasaService
  include HTTParty
  base_uri "https://api.nasa.gov"

  def get_image_url(action_name)
    result = self.class.get("/#{action_name}/apod?api_key=#{Rails.application.credentials.nasa_apikey}")
    result.dig('url')
  end
end
