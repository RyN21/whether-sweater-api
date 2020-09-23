require 'rails_helper'

describe 'Background request' do
  it "sends back a selected image from API based on current location", :vcr do
    headers  = { "CONTENT_TYPE" => "application/json" }
    location = 'Denver, CO'
    weather  = 'snowy'

    get "/api/v1/backgrounds?location=#{location}&weather=#{weather}"
    expect(response).to be_successful

    image = JSON.parse(response.body, symbolize_names: true)

    expected_json = {
                      data: {
                        type: "image",
                        id: nil,
                        attributes: {
                          location: "Denver, CO",
                          image_url: "https://images.unsplash.com/photo-1578635073897-3807ceb9a88d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE2Njk4NX0",
                          credit: {
                            source: "unsplash.com", author: "rdehamer", logo: "https://unsplash.com/apple-touch-icon.png"
                          }
                        }
                      }
                    }

    expect(image).to eq(expected_json)
    expect(image[:data][:type]).to eq('image')
    expect(image[:data][:id]).to be_nil
    expect(image[:data][:attributes]).to be_truthy
    expect(image[:data][:attributes][:location]).to eq("Denver, CO")
    expect(image[:data][:attributes][:image_url]).to eq("https://images.unsplash.com/photo-1578635073897-3807ceb9a88d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE2Njk4NX0")
    expect(image[:data][:attributes][:credit]).to be_truthy
    expect(image[:data][:attributes][:credit][:source]).to eq("unsplash.com")
    expect(image[:data][:attributes][:credit][:author]).to eq("rdehamer")
    expect(image[:data][:attributes][:credit][:logo]).to eq("https://unsplash.com/apple-touch-icon.png")
  end
end
