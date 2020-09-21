class BackgroundsFacade
  def background_object(location)
    search = UnsplashService.new
    image_data = search.image_by_current_location(location)

    Background.new(image_data, location)
  end
end
