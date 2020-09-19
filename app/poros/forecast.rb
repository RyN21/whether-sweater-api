class Forecast
  def forecast_by_location(location)
    forecast = OpenWeatherService.new
    forecast.onecall(location)
  end
end
