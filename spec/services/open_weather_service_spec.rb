require 'rails_helper'

describe 'Open Weather Service' do
  it "One Call API" do
    lat    = 39.738453
    lon    = -104.984853
    result = OpenWeatherService.new.onecall(lat, lon)

    expect(result[:timezone]).to eq("America/Denver")
  end
end
