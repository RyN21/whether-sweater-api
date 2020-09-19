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

  def initialize(data)
    @id              = nil
    @current_temp    = data[:current][:temp]
    @weather_summary = data[:current][:weather][0][:description]
    @weather_main    = data[:current][:weather][0][:main]
    @high            = data[:daily][0][:temp][:max]
    @low             = data[:daily][0][:temp][:min]
    @feels_like      = data[:current][:feels_like]
    @humidity        = data[:current][:humidity]
    @visibility      = data[:current][:visibility]
    @uv_index        = data[:current][:uvi]
    @sunrise         = data[:current][:sunrise]
    @sunset          = data[:current][:sunset]
    @hourly_48       = data[:hourly]
    @daily_8         = data[:daily]
  end
end
