require 'rails_helper'

describe 'Open Cage Data Service' do
  it "can return latitude and longitude" do
    placename = "Denver, CO"
    result    = {lat: 39.738453,
                 lng: -104.984853}

    expect(MapQuestService.new.get_lat_and_lng(placename)).to eq(result)
  end

  it "spacing doesn't matter" do
    placename = "Denver,CO"
    result    = {lat: 39.738453,
                 lng: -104.984853}

      expect(MapQuestService.new.get_lat_and_lng(placename)).to eq(result)
  end
end
