class UnsplashService
  def background(location)
    response = conn.get("/search/photos?query=#{location}&page=1&per_page=3")
    json     = JSON.parse(response.body, symbolize_names: true)
  end

  private
  def conn
    Faraday.new(url: 'https://api.unsplash.com') do |faraday|
      faraday.params['client_id'] = ENV['UNSPLASH_ACCESS_KEY']
    end
  end
end
