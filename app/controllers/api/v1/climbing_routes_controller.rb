class Api::V1::ClimbingRoutesController < ApplicationController
  def index
    location   = params[:location]
    facade     = ClimbingRoutesFacade.new
    routes     = facade.climbing_routes_objects(location)
    weather   = facade.climbing_routes_weather(location)
    json = render json: ClimbingRoutesSerializer.new.handroll_routes(routes, weather, location)
  end
end
