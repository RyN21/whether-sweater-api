require 'rails_helper'

describe 'Open Weather Service' do
  it "One Call API", :vcr do
    location = "Denver,CO"
    result   = OpenWeatherService.new.onecall(location)

    expect(result[:timezone]).to eq("America/Denver")
  end
end
