class ClimbingRoutesFacade
  def climbing_routes_objects(location)
    search = MountainProjectService.new
    routes = search.find_routes_by_lat_and_lon(location)
    routes[:routes].map do |route_data|
      Route.new(route_data)
    end
  end

  def climbing_routes_weather(location)
    search = OpenWeatherService.new
    onecall_data = search.onecall(location)
    Forecast.new(onecall_data)
  end

  def climbing_routes_direction(location)
    search = MapQuestService.new
  end
end
