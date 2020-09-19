class OpenWeatherService
  def onecall(location)
    search_coords = MapQuestService.new
    result = search_coords.lat_and_lon(location)

    lat = result[:lat]
    lon = result[:lon]

    response = conn.get("/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=minutely&units=imperial")
    json     = JSON.parse(response.body, symbolize_names: true)
  end

  private
  def conn
    Faraday.new(url: 'https://api.openweathermap.org') do |faraday|
      faraday.params['appid'] = "2a0dc08cdf9603ff63375cb6989bd9fd"
    end
  end
end
