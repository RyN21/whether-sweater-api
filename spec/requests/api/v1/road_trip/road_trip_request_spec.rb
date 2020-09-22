require 'rails_helper'

describe "Road trip request" do
  it "can create road trip request" do
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
                    "travel_time": ""
                  },
                  "forecast": {
                    "arrival_temp": "",
                    "arrival_weather": ""
                  },
                }
              }
            }

      expect(response.status).to eq(200)
      expect(road_trip).to eq(body)
      expect(road_trip[:data][:attributes][:origin]).to eq(request[:origin])
      expect(road_trip[:data][:attributes][:destination]).to eq(request[:destination])
  end
end
