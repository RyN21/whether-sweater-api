class Background
  attr_reader :location,
              :weather,
              :image_url,
              :source,
              :author,
              :logo

  def initialize(background_data, location, weather = "sunny")
    @location  = location
    @weather   = weather
    @image_url = background_data[:results][0][:urls][:raw]
    @source    = 'unsplash.com'
    @author    = background_data[:results][0][:user][:username]
    @logo      = 'https://unsplash.com/apple-touch-icon.png'
  end
end
