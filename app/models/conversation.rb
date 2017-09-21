class Conversation < ApplicationRecord
  has_many :conversation_users, dependent: :destroy
  has_many :users, through: :conversation_users

  has_many :messages, through: :conversation_users, dependent: :destroy

  validates :conversation_users, presence: true, length: { is: 2, message: 'should be exactly 2' }
  validate :not_a_duplicate?

  def self.exactly_between(*users)
    ids = users.pluck(:id).map(&:to_i)
    Conversation.
      joins(:users).
      group('id').
      where(users: { id: ids }).
      having('count(*) = ?', users.length)
  end

  def title
    users.map(&:full_name).join(' - ')
  end

  private

  def not_a_duplicate?
    if Conversation.exactly_between(*users).any?
      errors.add(:base, :already_exist, message: 'A conversation already exists between these users')
      false
    else
      true
    end
  end
end
