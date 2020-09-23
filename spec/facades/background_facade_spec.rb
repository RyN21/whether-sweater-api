require 'rails_helper'

describe "Background Facade" do
  it "facade produces a background object" do
    VCR.use_cassette('sends_back_a_selected_image_from_API_based_on_current_location') do
      headers  = { "CONTENT_TYPE" => "application/json" }
      location = 'Denver, CO'
      weather  = 'snowy'

      background = BackgroundsFacade.new.background_object(location, weather)

      expect(background.class).to eq(Background)
    end
  end
end
