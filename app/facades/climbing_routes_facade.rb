class ClimbingRoutesFacade
  def climbing_routes_objects(location)
    search = MountainProjectService.new
    routes = search.find_routes_by_lat_and_lon(location)
    routes[:routes].map do |route_data|
      search = MapQuestService.new
      lat    = route_data[:latitude]
      lon    = route_data[:longitude]
      distance_to_route = search.distance_to_destination(location, lat, lon)

      search  = OpenWeatherService.new
      weather = search.current_weather(lat, lon)
      
      Route.new(route_data, distance_to_route, weather)
    end
  end

  def climbing_routes_weather(location)
    search = OpenWeatherService.new
    onecall_data = search.onecall(location)
    Forecast.new(onecall_data)
  end

  def climbing_routes_distance(location, route)
    search = MapQuestService.new
    distance_to_route = search.distance_to_destination(location, route)
  end
end
