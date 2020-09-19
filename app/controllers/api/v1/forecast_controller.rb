class Api::V1::ForecastController < ApplicationController
  def index
    forecast = Forecast.new
    render json: forecast.forecast_by_location(params[:location])
    require "pry"; binding.pry
    # render json: ForecastSerializer.new(forecast.forecast_by_location(params[:location]))
  end
end
