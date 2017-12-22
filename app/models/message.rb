class Message < ApplicationRecord
  paginates_per 15

  belongs_to :conversation_user
  has_one :conversation, through: :conversation_user
  has_one :user, through: :conversation_user

  has_many :events, as: :eventable

  validates :conversation, presence: true
  validates :user, presence: true
  validates :content, presence: true, length: { within: 1..2000 }

  def broadcast
    MessageBroadcastJob.perform_now self
  end
end
