class MapQuestService
  def lat_and_lon(location)
    lat_lon  = {}
    response = conn.get("/geocoding/v1/address?location=#{location}")
    json     = JSON.parse(response.body, symbolize_names: true)

    lat_lon[:lat] = json[:results][0][:locations][0][:latLng][:lat]
    lat_lon[:lon] = json[:results][0][:locations][0][:latLng][:lng]
    lat_lon
  end

  def directions(from, to)
    response = conn.get("http://www.mapquestapi.com/directions/v2/route?from=#{from}&to=#{to}&unit=miles")
    json     = JSON.parse(response.body, symbolize_names: true)
  end

  private
  def conn
    Faraday.new(url: 'http://www.mapquestapi.com') do |faraday|
      faraday.params['key'] = ENV['MAPQUEST_API_KEY']
    end
  end
end
