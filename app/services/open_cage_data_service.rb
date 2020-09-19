class OpenCageDataService
  def get_lat_and_lng(placename)
    lat_lng = {}
    response = conn.get("/geocode/v1/json?q=#{placename}&limit=1")
    json = JSON.parse(response.body, symbolize_names: true)
    lat_lng[:lat] = json[:results][0][:geometry][:lat]
    lat_lng[:lng] = json[:results][0][:geometry][:lng]
    lat_lng
  end

  private
  def conn
    Faraday.new(url: 'https://api.opencagedata.com') do |faraday|
      faraday.params['key'] = ENV['OPEN_CAGE_DATA_API']
    end
  end
end
