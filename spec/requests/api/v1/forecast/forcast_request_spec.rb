require 'rails_helper'

describe "Forcast request" do
  it "sends forcast with attributes", :vcr do
    headers  = { "CONTENT_TYPE" => "application/json" }
    location = 'Denver, CO'

    get "/api/v1/forecast?location=#{location}"
    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast[:data][:id]).to be_nil
    expect(forecast[:data][:type]).to eq('forecast')
    expect(forecast[:data][:attributes][:current_temp]).to    be_truthy
    expect(forecast[:data][:attributes][:weather_summary]).to be_truthy
    expect(forecast[:data][:attributes][:weather_main]).to    be_truthy
    expect(forecast[:data][:attributes][:high]).to            be_truthy
    expect(forecast[:data][:attributes][:low]).to             be_truthy
    expect(forecast[:data][:attributes][:feels_like]).to      be_truthy
    expect(forecast[:data][:attributes][:humidity]).to        be_truthy
    expect(forecast[:data][:attributes][:visibility]).to      be_truthy
    expect(forecast[:data][:attributes][:uv_index]).to        be_truthy
    expect(forecast[:data][:attributes][:sunrise]).to         be_truthy
    expect(forecast[:data][:attributes][:sunset]).to          be_truthy
    expect(forecast[:data][:attributes][:hourly_48]).to       be_truthy
    expect(forecast[:data][:attributes][:daily_8]).to         be_truthy
    expect(forecast[:data][:attributes][:hourly_48].length).to eq(48)
    expect(forecast[:data][:attributes][:daily_8].length).to   eq(8)
  end
end
