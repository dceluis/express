class ConversationChannel < ApplicationCable::Channel
  def subscribed
    @conversation = Conversation.joins(:users).where(id: params['uuid'].to_i, users: { id: [current_user.id] }).first
    reject unless @conversation
    stream_from "conversation_#{@conversation.id}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    current_user.speak( data['content'], @conversation )
  end
end
