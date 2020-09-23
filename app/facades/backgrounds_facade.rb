class BackgroundsFacade
  def background_object(location, weather)
    image_data = UnsplashService.new.image_by_current_location(location, weather)

    Background.new(image_data, location, weather)
  end
end
