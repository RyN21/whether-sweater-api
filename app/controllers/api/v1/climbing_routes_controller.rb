class Api::V1::ClimbingRoutesController < ApplicationController
  def index
    routes = ClimbingRoutesFacade.new.climbing_routes_objects(params[:location])
    json = render json: ClimbingRoutesSerializer.new(routes)
  end
end
