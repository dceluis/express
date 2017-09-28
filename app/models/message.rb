class Message < ApplicationRecord
  belongs_to :conversation_user
  has_one :conversation, through: :conversation_user
  has_one :user, through: :conversation_user

  validates :conversation, presence: true
  validates :user, presence: true
  validates :content, presence: true, length: { within: 1..2000 }

  after_create :broadcast_self

  private

  def broadcast_self
    MessageBroadcastJob.perform_now self
  end
end
