class RoadTrip
  attr_reader :origin,
              :destination,
              :current_time

  def initialize(forecast, directions, origin, destination)
    @origin          = origin
    @destination     = destination
    @hourly_forecast = forecast.hourly_48
    @time_in_sec     = directions[:route][:realTime]
    @current_time    = DateTime.now
  end

  def travel_time
    @travel_time = Time.at(@time_in_sec).utc.strftime("%H:%M:%S")
  end

  def travel_time_rounded_up_15
    time = Time.at(@time_in_sec).utc - (@time_in_sec % 15.minutes) + 15.minutes
    @travel_time = time.strftime("%H:%M:%S")
  end

  def minutes_to_arrival
    t = Time.parse(travel_time_rounded_up_15)
    t.hour * 60 + t.min
  end

  def arrival_time
    @current_time + minutes_to_arrival.minutes
  end

  def unix_arrival_time
    arrival_time.beginning_of_hour.to_time.to_i
  end

  def arrival_temp
    unix = unix_arrival_time
    weather = @hourly_forecast.find do |weather|
      weather[:dt] == unix
    end
    weather[:temp]
  end

  def arrival_weather
    unix = unix_arrival_time
    weather = @hourly_forecast.find do |weather|
      weather[:dt] == unix
    end
    weather[:weather][0][:description]
  end
end
