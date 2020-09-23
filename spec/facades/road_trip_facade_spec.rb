require 'rails_helper'

describe "Road Trip Facade" do
  it "facade produces a road trip object", vcr: { record: :new_episodes } do
    user     = create(:user)
    headers  = { "CONTENT_TYPE" => "application/json" }
    request  = {origin: "Denver,CO",
                destination: "Pueblo,CO",
                api_key: user.api_key}

    road_trip = RoadTripFacade.new.road_trip_object(request[:origin], request[:destination])

    expect(road_trip.class).to eq(RoadTrip)
  end
end
