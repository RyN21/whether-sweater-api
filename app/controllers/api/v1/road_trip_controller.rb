class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: rt_params[:api_key])
    if user
      road_trip = RoadTripFacade.new.road_trip_object(rt_params[:origin], rt_params[:destination])
      render json: RoadTripSerializer.new(road_trip)
    else
      render json: "Unsuccessful. Invalid API key"
      response.status = 401
    end
  end

  private
  def rt_params
    params.permit(:origin, :destination, :api_key)
  end
end
