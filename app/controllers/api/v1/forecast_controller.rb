class Api::V1::ForecastController < ApplicationController
  def index
    forecast = ForecastFacade.new.forecast_object(params[:location])
    json = render json: ForecastSerializer.new(forecast)
  end
end
