require 'test_helper'

class OpenWeather::CountryTest < ActiveSupport::TestCase
  test '#initialize country with correct iso code if country exists' do
    country = OpenWeather::Country.new('United Kingdom')
    assert_equal('GB', country.iso_code)
  end

  test '#initialize country should set iso code to nil if country does not exist' do
    country = OpenWeather::Country.new('Fake Country')
    assert_nil country.iso_code
  end
end
