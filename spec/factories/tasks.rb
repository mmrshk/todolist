FactoryBot.define do
  factory :task do
    sequence(:name) { |n| "Task #{n}" }
    completed { false }
    project
  end
end
