class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates :conversation, presence: true
  validates :user, presence: true
  validates :content, presence: true, length: { within: 1..2000 }
end
