class Api::V1::ClimbingRoutesController < ApplicationController
  def index
    facade = ClimbingRoutesFacade.new
    routes     = facade.climbing_routes_objects(params[:location])
    forecast   = facade.climbing_routes_weather(params[:location])
    directions = facade.climbing_routes_direction(params[:location])
    json = render json: ClimbingRoutesSerializer.handroll_routes(routes, forecast, directions)
  end
end
