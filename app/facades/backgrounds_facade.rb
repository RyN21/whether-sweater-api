class BackgroundsFacade
  def background_object(location, weather)
    search = UnsplashService.new
    image_data = search.image_by_current_location(location, weather)

    Background.new(image_data, location, weather)
  end
end
