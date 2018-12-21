FactoryBot.define do
  factory :cart_item do
    association :user
    association :course
  end
end
