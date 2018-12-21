FactoryBot.define do
  factory :rating do
    rating { nil }
    association :user
    association :course
  end
end
