require 'rails_helper'

describe "User registeration request" do
  it "can create a user" do
    headers     = { "CONTENT_TYPE" => "application/json" }
    user_params = {email: "test@email.com",
                   password: "password",
                   password_confirmation: "password"}

    post "/api/v1/users", params: JSON.generate(user_params), headers: headers
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

describe "Unsuccessful Requests" do
  it "tests for unsuccessful requests: Passwords do not match" do
    headers     = { "CONTENT_TYPE" => "application/json" }
    user_params = {email: "test@email.com",
                   password: "password",
                   password_confirmation: "passwordDoesntMatch"}

    post "/api/v1/users", params: JSON.generate(user_params), headers: headers

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(response.body).to eq("Unsuccessful. Passwords do not match. Please try again.")
  end

  it "tests for unsuccessful requests: Email already taken" do
    user1       = create(:user, email: "test@email.com")
    headers     = { "CONTENT_TYPE" => "application/json" }
    user_params = {email: "test@email.com",
                   password: "password",
                   password_confirmation: "password"}

    post "/api/v1/users", params: JSON.generate(user_params), headers: headers

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(response.body).to eq("Unsuccessful. Email already taken.")
  end

  it "tests for unsuccessful requests: Missing fields" do
    headers     = { "CONTENT_TYPE" => "application/json" }
    user_params = {email: "test@email.com",
                   password: "",
                   password_confirmation: "password"}

    post "/api/v1/users", params: JSON.generate(user_params), headers: headers

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(response.body).to eq("Unsuccessful. Missing fields. Please try again.")
  end
end
