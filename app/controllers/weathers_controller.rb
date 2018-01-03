class WeathersController < ApplicationController
  def new; end

  def create
    @response = OpenWeather::Base.get_weather(params[:city], params[:country])
    @partial = @response['cod'] == '404' ? 'weathers/not_found' : 'weathers/weather'
  end
end
