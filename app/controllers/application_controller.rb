class ApplicationController < ActionController::API
  include ActionController::Helpers
  helper_method :current_user

  def current_user
    require "pry"; binding.pry
    User.find(session[:user_id]) if session[:user_id]
  end
end
