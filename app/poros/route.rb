class Route
  attr_reader :name,
              :type,
              :rating,
              :location,
              :lat,
              :lon

  def initialize(data, distance, weather)
    @name     = data[:name]
    @type     = data[:type]
    @rating   = data[:rating]
    @location = data[:location]
    @lat      = data[:latitude]
    @lon      = data[:longitude]
    @distance = distance
    @weather  = weather[:weather][0][:description]
    @temp     = weather[:main][:temp]
  end
end
