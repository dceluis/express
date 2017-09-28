class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "conversation_#{message.conversation.id}_channel", partial: ApplicationController.render(partial: 'messages/show', locals: { message: message } )
  end
end
