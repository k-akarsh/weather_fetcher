module OpenWeather
  class Country
    attr_reader :iso_code
    def initialize(name)
      country = ISO3166::Country.find_country_by_name(name) ||
                ISO3166::Country.find_country_by_alpha2(name) ||
                ISO3166::Country.find_country_by_alpha3(name) ||
                ISO3166::Country.find_country_by_gec(name)
      @iso_code = country.alpha2 if country
    end
  end
end
