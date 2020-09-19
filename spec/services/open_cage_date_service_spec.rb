require 'rails_helper'

describe 'Open Cage Data Service' do
  it "can return latitude and longitude" do
    placename = "Denver, CO"
    result    = {'lat': 39.7348381,
                 'lng': -104.9653271}

    expect(OpenCageDataService.new.get_lat_and_lng(placename)).to eq(result)
  end
end
