class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      render json: UserSerializer.new(user)
      response.status = 201
    elsif params[:password] == "" || params[:password_confirmation] == "" || params[:email] == ""
      render json: "Unsuccessful. Missing a field. Please try again."
      response.status = 400
    elsif params[:password] != params[:password_confirmation]
      render json: "Unsuccessful. Passwords do not match. Please try again."
      response.status = 400
    else
      render json: "Unsuccessful. Email already taken."
      response.status = 400
    end
  end

  private
  def user_params
    params[:api_key] = User.generate_api_key
    params.permit(:email, :password, :password_confirmation, :api_key)
  end
end
