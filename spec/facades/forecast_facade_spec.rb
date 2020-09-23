require 'rails_helper'

describe "Forecast Facade" do
  it "facade produces a forecast object" do
    VCR.use_cassette('sends_forecast_with_attributes') do
      headers  = { "CONTENT_TYPE" => "application/json" }
      location = 'Denver, CO'

      forecast = ForecastFacade.new.forecast_object(location)

      expect(forecast.class).to eq(Forecast) 
    end
  end
end
