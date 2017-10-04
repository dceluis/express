class Event < ApplicationRecord
  belongs_to :story, counter_cache: true
  belongs_to :eventable, polymorphic: true

  validates :story, presence: true
  validates :eventable, presence: true

  validate :correct_story_type

  private

  def correct_story_type
    errors.add(:base, 'is not of valid type') unless eventable_type == story.type.titleize.split[0]
  end
end
