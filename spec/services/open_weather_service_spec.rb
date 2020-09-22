require 'rails_helper'

describe 'Open Weather Service' do
  it "One Call API", :vcr do
    location = "Denver,CO"
    result   = OpenWeatherService.new.onecall(location)

    expect(result[:timezone]).to eq("America/Denver")
    expect(result[:current]).to be_truthy
    expect(result[:daily]).to be_truthy
    expect(result[:hourly]).to be_truthy
    expect(result[:minutely]).to be_nil
    expect(result[:alerts]).to be_nil
  end
end
