require 'rails_helper'

describe "User registeration request" do
  headers  = { "CONTENT_TYPE" => "application/json" }
  user_params = {email: "test@email.com",
                 password: "password",
                 password_confirmation: "password"}

  post "/api/v1/users", params: JSON.generate(user_params), headers: headers

  user = User.last
  body =  {
            "data": {
              "type": "users",
              "id": user.id,
              "attributes": {
                "email": "test@email.com",
                "api_key": "jgn983hy48thw9begh98h4539h4"
              }
            }
          }

  expect(response).to be_successful
  expect(response.status).to eq(201)
  expect(response.body).to eq(body)
end
