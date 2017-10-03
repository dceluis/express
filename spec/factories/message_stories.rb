FactoryGirl.define do
  factory :message_story do
    after(:create) { |story| create_list(:message_event, 2, story: story) }
  end
end
