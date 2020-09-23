require 'rails_helper'

describe Background, type: :poro do
  describe "Attributes" do
    before :each do
      VCR.use_cassette('sends_back_a_selected_image_from_API_based_on_current_location') do
        headers  = { "CONTENT_TYPE" => "application/json" }
        location = 'Denver, CO'
        weather  = 'snowy'

        @background = BackgroundsFacade.new.background_object(location, weather)
      end
    end

    it "has attributes" do
      expect(@background.location).to eq("Denver, CO")
      expect(@background.weather).to eq("snowy")
      expect(@background.image_url).to eq("https://images.unsplash.com/photo-1578635073897-3807ceb9a88d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE2Njk4NX0")
      expect(@background.source).to eq("unsplash.com")
      expect(@background.author).to eq("rdehamer")
      expect(@background.logo).to eq("https://unsplash.com/apple-touch-icon.png")
    end
  end
end
