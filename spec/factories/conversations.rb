FactoryGirl.define do
  factory :conversation do
    transient do
      users_count 2
    end
    users { create_list(:user, users_count) }
  end
end
