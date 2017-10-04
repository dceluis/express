FactoryGirl.define do
  factory :conversation_user do
    user factory: :user
    conversation { create(:conversation) }
  end
end
