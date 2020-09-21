class UnsplashService
  def image_by_current_location(location)
    response = conn.get("/search/photos?query=#{location} outdoors&page=1&per_page=1&orientation=landscape&filter=high")
    json     = JSON.parse(response.body, symbolize_names: true)
  end

  private
  def conn
    Faraday.new(url: 'https://api.unsplash.com') do |faraday|
      faraday.params['client_id'] = ENV['UNSPLASH_ACCESS_KEY']
    end
  end
end
