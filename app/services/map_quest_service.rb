class MapQuestService
  def lat_and_lon(location)
    lat_lon  = {}
    response = conn.get("/geocoding/v1/address?location=#{location}")
    json     = JSON.parse(response.body, symbolize_names: true)

    lat_lon[:lat] = json[:results][0][:locations][0][:latLng][:lat]
    lat_lon[:lon] = json[:results][0][:locations][0][:latLng][:lng]
    lat_lon
  end

  def reverse_geocode(lat, lon)
    response = conn.get("http://www.mapquestapi.com/geocoding/v1/reverse?location=#{lat},#{lon}")
    json     = JSON.parse(response.body, symbolize_names: true)
    street   = json[:results][0][:locations][0][:street]
  end

  def distance_to_destination(from, to_lat, to_lon)
    street   = reverse_geocode(to_lat, to_lon)
    response = conn.get("http://www.mapquestapi.com/directions/v2/route?from=#{from}&to=#{street}")
    json     = JSON.parse(response.body, symbolize_names: true)
    distance = json[:route][:distance]
  end

  private
  def conn
    Faraday.new(url: 'http://www.mapquestapi.com') do |faraday|
      faraday.params['key'] = ENV['MAPQUEST_API_KEY']
    end
  end
end
