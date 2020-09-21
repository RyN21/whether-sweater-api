require 'rails_helper'

describe "Climbing routes request" do
  it "sends climbing routes based on location", :vcr do
    headers  = { "CONTENT_TYPE" => "application/json" }
    location = 'erwin,tn'

    get "/api/v1/climbing_routes?location=#{location}"
    expect(response).to be_successful

    routes = JSON.parse(response.body, symbolize_names: true)

    # body = {
    #           "data": {
    #             "id": "null",
    #             "type": "climbing route",
    #             "attributes": {
    #               "location": "erwin,tn",
    #               "forecast": {
    #                 "summary": "Raining cats and dogs",
    #                 "temperature": "65"
    #               },
    #               "routes": [
    #                 {
    #                   "name": "Dopey Duck",
    #                   "type": "Trad",
    #                   "rating": "5.9",
    #                   "location": [
    #                     "North Carolina",
    #                     "2. Northern Mountains Region",
    #                     "Linville Gorge",
    #                     "Shortoff Mountain"
    #                   ]
    #                   "distance_to_route": "76.876"
    #                 },
    #                 {
    #                   "name": "Straight and Narrow",
    #                   "type": "Trad"
    #                   "rating": "5.10a"
    #                   "location": [
    #                     "North Carolina",
    #                     "2. Northern Mountains Region",
    #                     "Linville Gorge",
    #                     "Shortoff Mountain"
    #                   ]
    #                   "distance_to_route": "76.876"
    #                 },
    #               ]
    #             }
    #           }
    #         }

    expect(response.body). to eq(body)
  end
end
