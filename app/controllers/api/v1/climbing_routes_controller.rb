class Api::V1::ClimbingRoutesController < ApplicationController
  def index
    facade     = ClimbingRoutesFacade.new
    routes     = facade.climbing_routes_objects(params[:location])
    forecast   = facade.climbing_routes_weather(params[:location])
    require "pry"; binding.pry
    json = render json: ClimbingRoutesSerializer.handroll_routes(routes, forecast, distance)
  end
end
