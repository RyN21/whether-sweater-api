class Forecast
  attr_reader :id,
              :current_temp,
              :weather_summary,
              :weather_main,
              :high,
              :low,
              :feels_like,
              :humidity,
              :visibility,
              :uv_index,
              :sunrise,
              :sunset,
              :hourly_48,
              :daily_8

  def initialize(forecast_data)
    @id              = nil
    @current_temp    = forecast_data[:current][:temp]
    @weather_summary = forecast_data[:current][:weather][0][:description]
    @weather_main    = forecast_data[:current][:weather][0][:main]
    @high            = forecast_data[:daily][0][:temp][:max]
    @low             = forecast_data[:daily][0][:temp][:min]
    @feels_like      = forecast_data[:current][:feels_like]
    @humidity        = forecast_data[:current][:humidity]
    @visibility      = forecast_data[:current][:visibility]
    @uv_index        = forecast_data[:current][:uvi]
    @sunrise         = forecast_data[:current][:sunrise]
    @sunset          = forecast_data[:current][:sunset]
    @hourly_48       = forecast_data[:hourly]
    @daily_8         = forecast_data[:daily]
  end
end
