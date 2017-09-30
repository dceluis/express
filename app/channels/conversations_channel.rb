class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversations_#{current_user.id}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def fetch
    ActionCable.server.broadcast "conversations_#{current_user.id}_channel", current_user.conversations.pluck(:id)
  end
end
