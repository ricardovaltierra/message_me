# frozen_string_literal: true

#= MessagesController
#
# controller class to handle Message resource
class MessagesController < ApplicationController
  before_action :require_user

  def create
    @message = current_user.messages.build(body: message_params)
    if @message.save
      ActionCable.server.broadcast 'chatroom_channel', 
                                    mod_message: message_render(@message)
    end
  end

  private

  def message_params
    params.require(:message).require(:body)
  end

  def message_render(message)
    render(partial: 'message', locals: { message: message })
  end
end