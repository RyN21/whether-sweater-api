class Api::V1::BackgroundsController < ApplicationController
  def index
    background = BackgroundsFacade.new.background_object(params[:location])
    json = render json: BackgroundsSerializer.handroll_image(background)
  end
end
