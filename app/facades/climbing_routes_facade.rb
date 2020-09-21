class ClimbingRoutesFacade
  def climbing_routes_objects(location)
    search = MountainProjectService.new
    routes = search.find_routes_by_lat_and_lon(location)
    routes.map do |route_data|
      Route.new(route_data)
    end
  end
end
