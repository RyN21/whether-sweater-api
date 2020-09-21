require 'rails_helper'

describe "User Logs in request" do
  it "can log in" do
    user = create(:user, email: "test@email.com", password: "password")
    headers  = { "CONTENT_TYPE" => "application/json" }
    login_params = {email: user.email,
                   password: user.password}

    post "/api/v1/sessions", params: JSON.generate(login_params), headers: headers
    expect(response).to be_successful

    user_parse = JSON.parse(response.body, symbolize_names: true)

    user = User.last
    body =  {
      "data": {
        "type": "user",
        "id": user.id.to_s,
        "attributes": {
          "email": user.email,
          "api_key": user.api_key
        }
      }
    }

    expect(response.status).to eq(201)
    expect(user_parse).to eq(body)
    expect(user.email).to eq(user_params[:email])
    expect(user_parse).to eq(body)
  end
end
