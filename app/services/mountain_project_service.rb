class MountainProjectService
  def find_routes_by_lat_and_lon(location)
    search_coords = MapQuestService.new
    result = search_coords.lat_and_lon(location)

    lat = result[:lat]
    lon = result[:lon]

    response = conn.get("/data/get-routes-for-lat-lon?lat=#{lat}&lon=#{lon}&maxResults=15")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  private
  def conn
    Faraday.new(url: 'https://www.mountainproject.com') do |faraday|
      faraday.params['key'] = ENV['MOUNTAIN_PROJECT_KEY']
    end
  end
end
