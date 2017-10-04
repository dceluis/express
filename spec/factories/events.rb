FactoryGirl.define do
  factory :message_event, class: 'Event' do
    story factory: :message_story
    eventable factory: :message
  end
end
