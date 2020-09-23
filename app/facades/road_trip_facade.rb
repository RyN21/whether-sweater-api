class RoadTripFacade
  def road_trip_object(origin, destination)
    onecall_data = OpenWeatherService.new.onecall(destination)
    forecast     = Forecast.new(onecall_data)

    directions   = MapQuestService.new.directions(origin, destination)

    RoadTrip.new(forecast, directions, origin, destination)
  end
end
