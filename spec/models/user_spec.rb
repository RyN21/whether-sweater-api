require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:api_key) }

    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:api_key) }
  end

  describe "class methods" do
    it ".generate_api_key" do
      api_key = User.generate_api_key
      expect(api_key.length).to eq(42)
    end
  end
end
