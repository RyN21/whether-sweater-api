class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.new(user)
    elsif user == nil
      render json: "User not found. Check if you entered the correct email or Sign up"
      response.status = 401
    elsif !user.authenticate(params[:password])
      render json: "Password does not match. Please try again."
      response.status = 401
    end
  end

  private
  def login_params
    params.permit(:email, :api_key, :password)
  end
end
