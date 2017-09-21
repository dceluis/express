class Message < ApplicationRecord
  belongs_to :conversation_user
  has_one :conversation, through: :conversation_user
  has_one :user, through: :conversation_user

  validates :conversation, presence: true
  validates :user, presence: true
  validates :content, presence: true, length: { within: 1..2000 }
end
