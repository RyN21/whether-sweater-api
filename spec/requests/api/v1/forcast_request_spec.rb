require 'rails_helper'

describe "Forcast API per location" do
  it "sends forcast with attributes" do
    headers = { "CONTENT_TYPE" => "application/json" }
    placename = 'Denver, CO'

    get "/api/v1/forecast?location=#{placename}"
    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)


  end
end
