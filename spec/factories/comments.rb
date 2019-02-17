FactoryBot.define do
  factory :comment do
    sequence(:text) { |n| "Comment text #{n}" }
    task
  end
end
