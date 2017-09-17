class Conversation < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
  has_many :messages

  validates_uniqueness_of :sender_id, scope: :recipient_id
  validate :is_not_a_duplicate?

  def title
    "#{sender.first_name} - #{recipient.first_name}"
  end

  private

  def is_not_a_duplicate?
    if Conversation.find_by(sender_id: recipient_id, recipient_id: sender_id)
      errors.add(:id,:already_exist, message: 'A conversation already exists between these users')
      false
    else
      true
    end
  end
end
