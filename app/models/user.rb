class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :conversations
  has_many :sent_conversations, -> { where(sender: self) }, class_name: 'Conversation', foreign_key: 'sender_id'
  has_many :received_conversations, -> { where(recipient: self) }, class_name: 'Conversation', foreign_key: 'recipient_id'

  validates :first_name, :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: {
                      with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
                      message: 'Must be a valid e-mail format.'
                    }
end
