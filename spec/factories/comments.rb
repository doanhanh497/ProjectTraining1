FactoryBot.define do
  factory :comment do
    content { "Comment 1" }
    parent_id { nil }
    course_id { nil }
    user_id { nil }
    association :course
    association :user
  end
end
