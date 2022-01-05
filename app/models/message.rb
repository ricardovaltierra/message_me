# frozen_string_literal: true

#= Message
#
# model class to handle user messaging
class Message < ApplicationRecord
  belongs_to :user, inverse_of: :messages
  validates :body, presence: true

  scope :custom_display, -> { order(:created_at).last(20) }
end