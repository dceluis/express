class Conversation < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
  has_many :messages

  validates_uniqueness_of :sender_id, scope: :recipient_id

  def title
    "#{sender.first_name} - #{recipient.first_name}"
  end
end
