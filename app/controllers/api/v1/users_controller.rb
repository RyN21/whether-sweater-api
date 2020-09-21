require 'securerandom'

class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      render json: UserSerializer.new(user)
      response.status = 201
    elsif params[:password] == nil || params[:password_confirmation] == nil || params[:email] == nil
      render json: "Unsuccessful. Missing a field. Please try again."
      response.status = 409
    elsif params[:password] != params[:password_confirmation]
      render json: "Unsuccessful. Passwords do not match. Please try again."
      response.status = 409
    else
      render json: "Unsuccessful. Email already taken."
      response.status = 409
    end
  end

  private
  def user_params
    api_key = SecureRandom.hex(21)
    params[:api_key] = api_key
    params.permit(:email, :password, :password_confirmation, :api_key)
  end
end
