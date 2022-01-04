# frozen_string_literal: true

#= Message
#
# model class to handle user messaging
class Message < ApplicationRecord
  belongs_to :user, inverse_of: :messages
  validates :body, presence: true
end