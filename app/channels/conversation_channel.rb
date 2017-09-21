class ConversationChannel < ApplicationCable::Channel
  def subscribed
    @conversation = Conversation.find(params['uuid'].to_i)
    stream_from "conversation_#{params['uuid']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = current_user.speak( data['content'], @conversation )
    ActionCable.server.broadcast "conversation_#{@conversation.id}_channel", message: ApplicationController.render(partial: 'messages/show', locals: { message: message } )
  end
end
