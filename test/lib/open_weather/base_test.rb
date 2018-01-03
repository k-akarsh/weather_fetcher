require 'test_helper'

class OpenWeather::BaseTest < ActiveSupport::TestCase
  test '#get_weather to return weather response if city exists and no country passed' do
    response = OpenWeather::Base.get_weather('Berlin')
    assert_includes(response, 'weather')
    assert_includes(response['main'], 'temp')
    assert_equal('DE', response['sys']['country'])
  end

  test '#get_weather to return weather response if city exists in the country passed' do
    response = OpenWeather::Base.get_weather('Budapest', 'Hungary')
    assert_includes(response, 'weather')
    assert_includes(response['main'], 'temp')
    assert_equal('HU', response['sys']['country'])
  end

  test '#get_weather to return error message if city does not exist in the passed country' do
    response = OpenWeather::Base.get_weather('Berlin', 'France')
    assert_equal('404', response['cod'])
    assert_equal('city not found', response['message'])
  end

  test '#get_weather to return error message if city does not exist' do
    response = OpenWeather::Base.get_weather('Fake City')
    assert_equal('404', response['cod'])
    assert_equal('city not found', response['message'])
  end
end
