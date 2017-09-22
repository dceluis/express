class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "appearance_channel"
    appear
  end

  def unsubscribed
    disappear
  end

  def appear
    current_user.appear
  end

  def disappear
    current_user.disappear
  end

  private

  def generate_connection_token
    SecureRandom.hex(36)
  end
end
