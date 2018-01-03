module OpenWeather
  class Base
    class << self
      def get_weather(city_name, country_name = nil)
        iso_code = OpenWeather::Country.new(country_name).iso_code
        query = iso_code.present? ? "#{city_name},#{iso_code}" : city_name
        OpenWeather::Request.by_city_name query
      end
    end
  end
end
