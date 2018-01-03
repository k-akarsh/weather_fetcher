module OpenWeather
  class Request
    include HTTParty
    base_uri 'api.openweathermap.org'
    default_params appid: Rails.application.secrets.open_weather_api_key

    class << self
      def by_city_name(query)
        response = get("/data/2.5/weather?q=#{query}&units=metric")
        response.parsed_response
      end
    end
  end
end
