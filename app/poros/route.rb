class Route
  attr_reader :name,
              :type,
              :rating,
              :location,
              :lat,
              :lon

  def initialize(data)
    @name     = data[:name]
    @type     = data[:type]
    @rating   = data[:rating]
    @location = data[:location]
    @lat      = data[:latitude]
    @lon      = data[:longitude]
  end
end
