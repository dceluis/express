class ConversationChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'conversation_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = current_user.speak( data['content'], Conversation.find( data['uuid'].to_i ) )
    ActionCable.server.broadcast 'conversation_channel', message: ApplicationController.render(partial: 'messages/show', locals: { message: message } )
  end
end
