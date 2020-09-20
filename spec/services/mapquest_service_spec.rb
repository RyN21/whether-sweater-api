require 'rails_helper'

RSpec.describe 'MapQuest Service' do
  it "can return latitude and longitude" do
    location  = "Denver, CO"
    result    = {lat: 39.738453,
                 lon: -104.984853}

    expect(MapQuestService.new.lat_and_lon(location)).to eq(result)
  end

  it "spacing doesn't matter" do
    location  = "Denver,CO"
    result    = {lat: 39.738453,
                 lon: -104.984853}

    expect(MapQuestService.new.lat_and_lon(location)).to eq(result)
  end
end
