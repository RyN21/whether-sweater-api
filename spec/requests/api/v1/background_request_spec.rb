require 'rails_helper'

describe 'Background request' do
  it "sends back a selected image from API based on current location", :vcr do
    headers  = { "CONTENT_TYPE" => "application/json" }
    location = 'Denver, CO'

    get "/api/v1/backgrounds?location=#{location}"
    expect(response).to be_successful

    image = JSON.parse(response.body, symbolize_names: true)

    parsed_json = {
                    data: {
                      type: "image",
                      id: nil,
                      image: {
                        location: "Denver, CO",
                        image_url: "https://images.unsplash.com/photo-1599408169542-620fc453382c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE2Njk4NX0",
                        credit: {
                          source: "unsplash.com", author: "andrewcoop", logo: "https://unsplash.com/apple-touch-icon.png"
                        }
                      }
                    }
                  }

    expect(image).to eq(parsed_json)
    expect(image[:data][:type]).to eq('image')
    expect(image[:data][:id]).to be_nil
    expect(image[:data][:image]).to be_truthy
    expect(image[:data][:image][:location]).to eq("Denver, CO")
    expect(image[:data][:image][:image_url]).to eq("https://images.unsplash.com/photo-1599408169542-620fc453382c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE2Njk4NX0")
    expect(image[:data][:image][:credit]).to be_truthy
    expect(image[:data][:image][:credit][:source]).to eq("unsplash.com")
    expect(image[:data][:image][:credit][:author]).to eq("andrewcoop")
    expect(image[:data][:image][:credit][:logo]).to eq("https://unsplash.com/apple-touch-icon.png")
  end
end
