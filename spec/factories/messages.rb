FactoryGirl.define do
  factory :message do
    conversation_user factory: :conversation_user
    content { Faker::Hipster.sentence }
  end
end
