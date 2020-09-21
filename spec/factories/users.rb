require 'securerandom'

FactoryBot.define do
  factory :user do
    email    { "MyString" }
    api_key  { SecureRandom.hex(21) }
    password { "test_password" }
  end
end
