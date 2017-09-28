class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :conversation_users
  has_many :conversations, through: :conversation_users

  has_many :messages, through: :conversation_users

  validates :first_name, :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: {
                      with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
                      message: 'Must be a valid e-mail format.'
                    }

  def full_name
    "#{first_name} #{last_name}"
  end

  def appear
    $redis.sadd("online", id)
    AppearanceBroadcastJob.perform_later User.online
  end

  def disappear
    $redis.srem("online", id)
    AppearanceBroadcastJob.perform_later User.online
  end

  def self.online
    $redis.smembers("online")
  end

  def online?
    !!(User.online.index id.to_s)
  end

  def speak(content, conversation)
    conversation_user = ConversationUser.joins(:user, :conversation).where( user: self, conversation: conversation ).group('id').first
    conversation_user.messages.create!(content: content)
  end
end
