class OpenWeatherService
  def onecall(location)
    result = MapQuestService.new.lat_and_lon(location)

    lat = result[:lat]
    lon = result[:lon]

    response = conn.get("/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=minutely,alerts&units=imperial")
    json     = JSON.parse(response.body, symbolize_names: true)
  end

  private
  def conn
    Faraday.new(url: 'https://api.openweathermap.org') do |faraday|
      faraday.params['appid'] = ENV['OPEN_WEATHER_API_ID']
    end
  end
end
