class ForecastFacade
  def forecast_object(location)
    search = OpenWeatherService.new
    onecall_data = search.onecall(location)
    Forecast.new(onecall_data)
  end
end
