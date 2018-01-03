require 'test_helper'

class WeathersControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_weather_url
    assert_response :success
  end

  test 'create should return js response' do
    post weathers_url, params: { city: 'Frankfurt', country: 'Germany' }, xhr: true
    assert_equal 'text/javascript', @response.content_type
  end
end
