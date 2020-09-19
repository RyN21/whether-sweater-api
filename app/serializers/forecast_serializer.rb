class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
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
end
