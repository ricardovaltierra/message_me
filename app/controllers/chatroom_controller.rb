# frozen_string_literal: true

#= ChatroomController
#
# Controller class used to handle
# chatroom actions (so far root route)
class ChatroomController < ApplicationController
  def index
    @messages = Message.all
  end
end