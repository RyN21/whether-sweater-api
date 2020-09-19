class MapQuestService
  def get_lat_and_lng(placename)
    lat_lng = {}
    response = conn.get("/geocoding/v1/address?location=#{placename}")
    json = JSON.parse(response.body, symbolize_names: true)
    
    lat_lng[:lat] = json[:results][0][:locations][0][:latLng][:lat]
    lat_lng[:lng] = json[:results][0][:locations][0][:latLng][:lng]
    lat_lng
  end

  private
  def conn
    Faraday.new(url: 'http://www.mapquestapi.com') do |faraday|
      faraday.params['key'] = ENV['MAPQUEST_API_KEY']
    end
  end
end
