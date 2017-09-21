FactoryGirl.define do
  factory :conversation_user do
    user factory: :user
    conversation do
      create(:conversation, users: [] )
    end
  end
end
