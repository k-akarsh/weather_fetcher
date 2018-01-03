require 'test_helper'

class OpenWeather::RequestTest < ActiveSupport::TestCase
  test 'by_city_name to return weather response if city exists' do
    response = OpenWeather::Request.by_city_name('Berlin')
    assert_includes(response, 'weather')
    assert_includes(response['main'], 'temp')
    assert_equal('DE', response['sys']['country'])
  end

  test 'by_city_name to return error message if city does not exist' do
    response = OpenWeather::Request.by_city_name('Fake City')
    assert_equal('404', response['cod'])
    assert_equal('city not found', response['message'])
  end
end
