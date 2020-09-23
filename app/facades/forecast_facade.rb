class ForecastFacade
  def forecast_object(location)
    onecall_data = OpenWeatherService.new.onecall(location)
    
    Forecast.new(onecall_data)
  end
end
