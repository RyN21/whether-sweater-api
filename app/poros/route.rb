class Route
  attr_reader :name,
              :type,
              :rating,
              :location,
              :lat,
              :lon,
              :distance

  def initialize(data, distance)
    @name     = data[:name]
    @type     = data[:type]
    @rating   = data[:rating]
    @location = data[:location]
    @lat      = data[:latitude]
    @lon      = data[:longitude]
    @distance = distance
  end
end
