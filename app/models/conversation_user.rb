class ConversationUser < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  has_many :messages

  validates :user, presence: true, uniqueness: { scope: :conversation }
  validates :conversation, presence: true
end
