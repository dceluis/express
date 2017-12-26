class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    conversation = message.conversation

    ActionCable.server.broadcast("conversation_#{conversation.id}_channel",
                                 message.to_json(only: [:content]))
  end
end
