class ForecastFacade
  def forecast_object(location)
    search = OpenWeatherService.new
    data = search.onecall(location)
    Forecast.new(data)
  end
end
