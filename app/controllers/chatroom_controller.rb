# frozen_string_literal: true

#= ChatroomController
#
# Controller class used to handle
# chatroom actions (so far root route)
class ChatroomController < ApplicationController
  before_action :require_user, only: %i[index]
  
  def index
    @messages = Message.all
  end
end