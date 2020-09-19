require 'rails_helper'

describe "Forcast API per location" do
  it "sends forcast with attributes" do
    headers = { "CONTENT_TYPE" => "application/json" }
    placename = 'Denver, CO'

    get "/api/v1/forcast?location=#{placename}"
    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    require "pry"; binding.pry
  end
end
