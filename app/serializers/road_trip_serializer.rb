class RoadTripSerializer
  def self.handroll_road_trip(road_trip, api_key)
    {
      "data": {
        "type": "road trip",
        "id": nil,
        "api_key": api_key,
        "attributes": {
          "directions": {
            "origin": road_trip.origin,
            "destination": road_trip.destination,
            "travel_time": road_trip.travel_time_rounded_up_15,
            "exact_travel_time": road_trip.travel_time
          },
          "forecast": {
            "arrival_temp": road_trip.arrival_temp,
            "arrival_weather": road_trip.arrival_weather
          }
        }
      }
    }
  end
end
