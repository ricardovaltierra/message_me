# frozen_string_literal: true

#= User
#
#
class User < ApplicationRecord
  has_many :messages, inverse_of: :user
  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { 
              minimum: 3,
              maximum: 15 
            }
  has_secure_password
end
