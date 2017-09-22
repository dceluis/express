class AppearanceBroadcastJob < ApplicationJob
  queue_as :default

  def perform(online)
    ActionCable.server.broadcast 'appearance_channel', online: online
  end
end
