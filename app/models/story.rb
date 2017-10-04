class Story < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :notifications

  # Programmatic setting of the type attribute is still allowed so make sure it's a valid type with inclusion validator.
  validates :type, presence: true, inclusion: { in: %w(MessageStory) } 

  private
  # Type should be never assigned explicitly but rather set by instantiating a Story descendant
  # This forces correct validations ( prevents Story.new(type: 'MessageStory').save only running Story validations )
  attr_writer :type
end
