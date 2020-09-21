class Route
  attr_reader :name,
              :type,
              :rating,
              :location

  def initialize(data)
    @name     = data[:name]
    @type     = data[:type]
    @rating   = data[:rating]
    @location = data[:location]
  end
end
