require 'rails_helper'

describe 'Background request' do
  it "sends back a selected image from API based on current location" do
    headers  = { "CONTENT_TYPE" => "application/json" }
    location = 'Denver, CO'

    get "/api/v1/backgrounds?location=#{location}"
    expect(response).to be_successful

    image = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry

    expect(forecast[:data][:type]).to eq('image')
    expect(forecast[:data][:id]).to                      be_nil
    expect(forecast[:data][:image]).to                   be_truthy
    expect(forecast[:data][:image][:location]).to        be_truthy
    expect(forecast[:data][:image][:image_url]).to       be_truthy
    expect(forecast[:data][:image][:credit]).to          be_truthy
    expect(forecast[:data][:image][:credit][:source]).to be_truthy
    expect(forecast[:data][:image][:credit][:author]).to be_truthy
    expect(forecast[:data][:image][:credit][:logo]).to   be_truthy
  end
end
