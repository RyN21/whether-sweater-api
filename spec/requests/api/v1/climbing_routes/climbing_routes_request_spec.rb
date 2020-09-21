require 'rails_helper'

describe "Climbing routes request" do
  it "sends climbing routes based on location" do
    headers  = { "CONTENT_TYPE" => "application/json" }
    location = 'erwin,tn'

    get "/api/v1/climbing_routes?location=#{location}"
    expect(response).to be_successful

    routes = JSON.parse(response.body, symbolize_names: true)
require "pry"; binding.pry

    expect(response.body).to eq(body)
  end
end
