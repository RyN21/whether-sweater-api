require 'rails_helper'

describe "User Logs in request" do
  it "can log in" do
    user = create(:user, email: "test21@email.com")
    headers  = { "CONTENT_TYPE" => "application/json" }
    login_params = {email: user.email,
                    password: user.password}

    post "/api/v1/sessions", params: JSON.generate(login_params), headers: headers
    expect(response).to be_successful

    user_parse = JSON.parse(response.body, symbolize_names: true)

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

    expect(response.status).to eq(200)
    expect(user_parse).to eq(body)
    expect(user.email).to eq(login_params[:email])
    expect(user_parse).to eq(body)
  end
end

describe "Unsuccessful Requests" do
  it "tests for unsuccessful requests: Incorrect email" do
    user = create(:user, email: "test21@email.com")
    headers  = { "CONTENT_TYPE" => "application/json" }
    login_params = {email: "wrongEmail@email.com",
      password: user.password}

      post "/api/v1/sessions", params: JSON.generate(login_params), headers: headers

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
      expect(response.body).to eq("Unsuccessful. User not found. Check if you entered the correct email or Sign up")
    end

    it "tests for unsuccessful requests: Incorrect password" do
      user = create(:user, email: "test21@email.com")
      headers  = { "CONTENT_TYPE" => "application/json" }
      login_params = {email: user.email,
        password: "wrongPassword"}

        post "/api/v1/sessions", params: JSON.generate(login_params), headers: headers

        expect(response).to_not be_successful
        expect(response.status).to eq(401)
        expect(response.body).to eq("Unsuccessful. Password does not match. Please try again.")
      end
end
