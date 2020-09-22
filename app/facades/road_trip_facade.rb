class RoadTripFacade
  def road_trip_object(origin, destination)
    search_weather = OpenWeatherService.new
    onecall_data   = search_weather.onecall(destination)
    forecast      = Forecast.new(onecall_data)

    search_directions = MapQuestService.new
    directions = search_directions.directions(origin, destination)

    RoadTrip.new(forecast, directions, origin, destination)
  end
end
