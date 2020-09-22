class RoadTrip
  attr_reader :origin,
              :destination

  def initialize(forecast, directions, origin, destination)
    @origin          = origin
    @destination     = destination
    @time_in_sec     = directions[:route][:realTime]
    @travel_time     = nil
    @arrival_temp    = nil
    @arrival_weather = nil
  end

  def travel_time
    @travel_time = Time.at(@time_in_sec).utc.strftime("%H:%M:%S")
  end
end
