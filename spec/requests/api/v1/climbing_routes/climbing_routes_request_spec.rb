require 'rails_helper'

describe "Climbing routes request" do
  it "sends climbing routes based on location" do
    headers  = { "CONTENT_TYPE" => "application/json" }
    location = 'erwin,tn'

    get "/api/v1/climbing_routes?location=#{location}"
    expect(response).to be_successful

    routes = JSON.parse(response.body, symbolize_names: true)

    expected_body = "{\"data\":{\"id\":null,\"type\":\"climbing route\",\"attributes\":{\"location\":\"erwin,tn\",\"forecast\":{\"summary\":\"clear sky\",\"temperature\":\"65.34\"},\"routes\":[{\"name\":\"Crescent\",\"type\":\"Trad, Ice, Snow, Alpine\",\"rating\":\"WI3- Mod. Snow\",\"location\":[\"North Carolina\",\"Northern Mountains Region\",\"Black Mountain Range Alpine\"],\"distance_to_destination\":61.562},{\"name\":\"Tiny Roof Crack\",\"type\":\"Boulder\",\"rating\":\"V4+\",\"location\":[\"Tennessee\",\"Blue Hole Falls\",\"Highball Area\",\"Shaky Knees Boulder\"],\"distance_to_destination\":34.793},{\"name\":\"La Cascada\",\"type\":\"Boulder\",\"rating\":\"V5\",\"location\":[\"Tennessee\",\"Blue Hole Falls\",\"Lower Blue Hole\",\"Levitation Boulder\"],\"distance_to_destination\":319.81},{\"name\":\"Left Wishbone\",\"type\":\"Trad, Ice, Alpine\",\"rating\":\"WI3-\",\"location\":[\"North Carolina\",\"Northern Mountains Region\",\"Black Mountain Range Alpine\"],\"distance_to_destination\":61.562},{\"name\":\"High Bo Diddle\",\"type\":\"TR, Boulder\",\"rating\":\"5.10a V0\",\"location\":[\"North Carolina\",\"Northern Mountains Region\",\"Bailey Mountain\"],\"distance_to_destination\":36.102},{\"name\":\"Left Wishbone (Rock Scramble)\",\"type\":\"Trad, Alpine\",\"rating\":\"Easy 5th\",\"location\":[\"North Carolina\",\"Northern Mountains Region\",\"Black Mountain Range Alpine\"],\"distance_to_destination\":61.562},{\"name\":\"Browns Creek Falls\",\"type\":\"Trad, Ice, Alpine\",\"rating\":\"WI4\",\"location\":[\"North Carolina\",\"Northern Mountains Region\",\"Black Mountain Range Alpine\"],\"distance_to_destination\":61.562},{\"name\":\"Foot work\",\"type\":\"TR\",\"rating\":\"5.9\",\"location\":[\"Tennessee\",\"Blue Hole Falls\",\"Highball Area\",\"Back Crag\"],\"distance_to_destination\":35.984},{\"name\":\"Royal Air\",\"type\":\"Trad, Boulder, Ice, Snow, Alpine\",\"rating\":\"V-easy WI4-5 Mod. Snow R\",\"location\":[\"North Carolina\",\"Northern Mountains Region\",\"Black Mountain Range Alpine\"],\"distance_to_destination\":61.562},{\"name\":\"Sloth Grip Roll\",\"type\":\"Boulder\",\"rating\":\"V3\",\"location\":[\"Tennessee\",\"Tweetsie Trail - Railroad Cuts\",\"Rail cut #3 - Tweetsie Trail\"],\"distance_to_destination\":14.601},{\"name\":\"Easter Island Arête\",\"type\":\"Boulder\",\"rating\":\"V3\",\"location\":[\"North Carolina\",\"Northern Mountains Region\",\"Bailey Mountain\"],\"distance_to_destination\":36.102},{\"name\":\"Little Chicago\",\"type\":\"Boulder\",\"rating\":\"V3\",\"location\":[\"Tennessee\",\"Tweetsie Trail - Railroad Cuts\",\"Rail cut #3 - Tweetsie Trail\"],\"distance_to_destination\":14.601},{\"name\":\"Feeding the Spyders\",\"type\":\"TR\",\"rating\":\"5.9 R\",\"location\":[\"Tennessee\",\"Blue Hole Falls\",\"Highball Area\",\"Great Roof\"],\"distance_to_destination\":34.793},{\"name\":\"Puddle Arete\",\"type\":\"Boulder\",\"rating\":\"V3-4\",\"location\":[\"Tennessee\",\"Blue Hole Falls\",\"Upper Blue Hole\",\"Shady Blues Area\",\"Puddle Boulder\"],\"distance_to_destination\":858.35},{\"name\":\"No One Likes You Tiger Woods\",\"type\":\"Boulder\",\"rating\":\"V3-4\",\"location\":[\"Virginia\",\"Southwest Virginia (Appalachia)\",\"High Knob Landform\",\"HKL West\",\"Camp Rock  Ridge\",\"Golf Course Boulder\"],\"distance_to_destination\":295.536}]}}}"

    expected_json = JSON.parse(expected_body, symbolize_names: true)

    expect(response.body).to eq(expected_body)
    expect(results).to eq(expected_json)
  end
end
