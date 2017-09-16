class Conversation < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  def title
    "#{sender.first_name} - #{receiver.first_name}"
  end
end
