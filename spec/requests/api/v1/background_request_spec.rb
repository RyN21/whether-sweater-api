require 'rails_helper'

describe 'Background request' do
  it "sends back a selected image from API based on current location", :vcr do
    headers  = { "CONTENT_TYPE" => "application/json" }
    location = 'Denver, CO'

    get "/api/v1/backgrounds?location=#{location}"
    expect(response).to be_successful

    image = JSON.parse(response.body, symbolize_names: true)

    expect(image[:data][:type]).to eq('image')
    expect(image[:data][:id]).to                      be_nil
    expect(image[:data][:image]).to                   be_truthy
    expect(image[:data][:image][:location]).to        be_truthy
    expect(image[:data][:image][:image_url]).to       be_truthy
    expect(image[:data][:image][:credit]).to          be_truthy
    expect(image[:data][:image][:credit][:source]).to be_truthy
    expect(image[:data][:image][:credit][:author]).to be_truthy
    expect(image[:data][:image][:credit][:logo]).to   be_truthy
  end
end
