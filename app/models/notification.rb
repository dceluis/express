class Notification < ApplicationRecord
  include AASM
  belongs_to :user
  
  aasm column: 'state' do
    state :active, :initial => true
    state :dismissed

    event :dismiss do
      transitions :from => :active, :to => :dismissed
    end
  end
end
