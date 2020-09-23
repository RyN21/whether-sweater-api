require 'rails_helper'

describe Forecast, type: :poro do
  describe "Attributes" do
    before :each do
      VCR.use_cassette('One_call_API') do
        headers  = { "CONTENT_TYPE" => "application/json" }
        location = 'Denver, CO'

        @forecast = ForecastFacade.new.forecast_object(location)
      end
    end

    it "has attributes" do
      expect(@forecast.id).to be_nil
      expect(@forecast.current_temp).to eq(65.84)
      expect(@forecast.weather_summary).to eq("broken clouds")
      expect(@forecast.weather_main).to eq("Clouds")
      expect(@forecast.high).to eq(86.74)
      expect(@forecast.low).to eq(65.84)
      expect(@forecast.feels_like).to eq(58.5)
      expect(@forecast.humidity).to eq(39)
      expect(@forecast.visibility).to eq(10000)
      expect(@forecast.uv_index).to eq(7.24)
      expect(@forecast.sunrise).to eq(1600778883)
      expect(@forecast.sunset).to eq(1600822611)
      expect(@forecast.hourly_48.length).to eq(48)
      expect(@forecast.daily_8.length).to eq(8)
    end
  end
end
