require 'securerandom'

class User < ApplicationRecord
  validates :password, presence: true, confirmation: true, on: :create
  validates :email, presence: true, uniqueness: true
  validates :api_key, presence: true, uniqueness: true
  has_secure_password

  def self.generate_api_key
    SecureRandom.hex(21)
  end
end
