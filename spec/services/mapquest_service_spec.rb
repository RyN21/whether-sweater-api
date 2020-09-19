require 'rails_helper'

describe 'MapQuest Service' do
  it "can return latitude and longitude" do
    placename = "Denver, CO"
    result    = {lat: 39.738453,
                 lon: -104.984853}

    expect(MapQuestService.new.lat_and_lng(placename)).to eq(result)
  end

  it "spacing doesn't matter" do
    placename = "Denver,CO"
    result    = {lat: 39.738453,
                 lon: -104.984853}

    expect(MapQuestService.new.lat_and_lng(placename)).to eq(result)
  end
end
