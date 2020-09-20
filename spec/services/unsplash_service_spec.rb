require 'rails_helper'

describe 'Unsplash Service' do
  it "Background Image API" do
    location = "Denver,CO"
    result   = UnsplashService.new.background(location)
    
    expect(result[:results].length).to eq(3)
    expect(result[:results][0][:id]).to be_truthy
    expect(result[:results][1][:id]).to be_truthy
    expect(result[:results][2][:id]).to be_truthy
  end
end
