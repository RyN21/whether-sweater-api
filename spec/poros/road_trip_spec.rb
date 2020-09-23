require 'rails_helper'

describe RoadTrip, type: :poro do
  describe "instance methods" do
    before :each do
      VCR.use_cassette('facade_produces_a_road_trip_object') do
        user     = create(:user)
        headers  = { "CONTENT_TYPE" => "application/json" }
        request  = {origin: "Denver,CO",
                    destination: "Pueblo,CO",
                    api_key: user.api_key}

        @road_trip = RoadTripFacade.new.road_trip_object(request[:origin], request[:destination])
      end
    end

    it "travel_time" do
      expect(@road_trip.travel_time).to eq("01:50:24")
    end

    it "travel_time_rounded_up_15" do
      expect(@road_trip.travel_time_rounded_up_15).to eq("02:00:00")
    end

    it "minutes_to_arrival" do
      expect(@road_trip.minutes_to_arrival).to eq(120)
    end

    it "arrival_time" do
      expect(@road_trip.arrival_time.class).to eq(DateTime)
    end

    it "unix_arrival_time" do
      expect(@road_trip.unix_arrival_time).to eq(1600840800)
    end

    it "arrival_temp" do
      expect(@road_trip.arrival_temp).to eq(66.87)
    end

    it "arrival_weather" do
      expect(@road_trip.arrival_weather).to eq("overcast clouds")
    end
  end
end
