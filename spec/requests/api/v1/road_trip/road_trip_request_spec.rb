require 'rails_helper'

describe "Road trip request" do
  it "can create road trip request", :vcr do
    user     = create(:user)
    headers  = { "CONTENT_TYPE" => "application/json" }
    request  = {origin: "Denver,CO",
                destination: "Pueblo,CO",
                api_key: user.api_key}

    post "/api/v1/road_trip", params: JSON.generate(request), headers: headers
    expect(response).to be_successful

    road_trip = JSON.parse(response.body, symbolize_names: true)

    body = {
            "data": {
              "type": "road trip",
              "id": nil,
              "api_key": user.api_key,
              "attributes": {
                "directions": {
                  "origin": "Denver,CO",
                  "destination": "Pueblo,CO",
                  "travel_time": "02:00:00"
                },
                "forecast": {
                  "arrival_temp": 75.54,
                  "arrival_weather": "few clouds"
                }
              }
            }
          }

    expect(response.status).to eq(200)
    expect(road_trip).to eq(body)
    expect(road_trip[:data][:attributes][:directions][:origin]).to eq(request[:origin])
    expect(road_trip[:data][:attributes][:directions][:destination]).to eq(request[:destination])
    expect(road_trip[:data][:api_key]).to eq(request[:api_key])
  end
end

describe "Unsuccessful road trip requests" do
  it "api key does not match" do
    user     = create(:user)
    headers  = { "CONTENT_TYPE" => "application/json" }
    request  = {origin: "Denver,CO",
                destination: "Pueblo,CO",
                api_key: "incorrect_api_key"}

    post "/api/v1/road_trip", params: JSON.generate(request), headers: headers

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(response.body).to eq("Unsuccessful. Invalid API key")
  end

  it "is missing a field" do
    user     = create(:user)
    headers  = { "CONTENT_TYPE" => "application/json" }
    request  = {origin: "Denver,CO",
                destination: "",
                api_key: "incorrect_api_key"}

    post "/api/v1/road_trip", params: JSON.generate(request), headers: headers

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(response.body).to eq("Unsuccessful. Invalid API key")
  end
end
