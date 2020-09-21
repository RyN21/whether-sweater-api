class ClimbingRoutesSerializer
  def handroll_routes(routes, weather, location)
    {
      "data": {
        "id": nil,
        "type": "climbing route",
        "attributes": {
          "location": "#{location}",
          "forecast": {
            "summary": "#{weather.weather_summary}",
            "temperature": "#{weather.current_temp}"
          },
          "routes": serialize_routes(routes)
        }
      }
    }
  end

  def serialize_routes(routes)
    routes.map do |route|
      {
        "name": route.name,
        "type": route.type,
        "rating": route.rating,
        "location": route.location,
        "distance_to_destination": route.distance
      }
    end
  end
end
