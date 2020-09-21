class Background
  attr_reader :location,
              :image_url,
              :source,
              :author,
              :logo

  def initialize(background_data, location)
    @location  = location
    @image_url = background_data[:results][0][:urls][:raw]
    @source    = 'unsplash.com'
    @author    = background_data[:results][0][:user][:username]
    @logo      = 'https://unsplash.com/apple-touch-icon.png'
  end

  # def credit
  #   @credit[:source] = @source
  #   @credit[:author] = @author
  #   @credit[:logo]   = @logo
  # end
  #
  # def image
  #   @image[:location]  = @location
  #   @image[:image_url] = @image_url
  #   @image[:credit]    = @credit
  # end
end
