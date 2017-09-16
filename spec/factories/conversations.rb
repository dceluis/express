FactoryGirl.define do
  factory :conversation do
    sender factory: :user
    receiver factory: :user
  end
end
