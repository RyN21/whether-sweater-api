class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by_email(login_params[:email])
    if user && user.authenticate(login_params[:password])
      render json: UserSerializer.new(user)
    elsif user == nil
      render json: "Unsuccessful. User not found. Check if you entered the correct email or Sign up"
      response.status = 400
    elsif !user.authenticate(login_params[:password])
      render json: "Unsuccessful. Password does not match. Please try again."
      response.status = 401
    end
  end

  private
  def login_params
    params.permit(:email, :api_key, :password)
  end
end
