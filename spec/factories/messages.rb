FactoryGirl.define do
  factory :message do
    conversation factory: :conversation
    user factory: :user
    content { Faker::Hipster.sentence }
  end
end
