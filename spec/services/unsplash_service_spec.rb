require 'rails_helper'

describe 'Unsplash Service' do
  it "Background Image API" do
    location = "Denver,CO"
    result   = UnsplashService.new.image_by_current_location(location)

    expect(result[:results].length).to eq(1)
    expect(result[:results][0][:id]).to be_truthy
  end
end
