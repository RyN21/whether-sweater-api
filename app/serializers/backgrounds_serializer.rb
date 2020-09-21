class BackgroundsSerializer
  def self.handroll_image(image)
    {
      "data": {
        "type": "image",
        "id": nil,
        "image": {
          "location": image.location,
          "image_url": image.image_url,
          "credit": {
            "source": image.source,
            "author": image.author,
            "logo": image.logo
          }
        }
      }
    }
  end
end
