FactoryBot.define do
  factory :course do
    sequence(:name) { |n| "Course #{n}" }
    description { nil }
    rate_average { nil }
    thumbnail { nil }
    price { 100000 }
    percent_sale { 10 }
    association :user
    association :category
  end
end
