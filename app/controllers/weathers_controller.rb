class WeathersController < ApplicationController
  def new; end

  def create
    @response = OpenWeather::Base.get_weather(params[:city], params[:country])
  end
end
