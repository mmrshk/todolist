FactoryBot.define do
  factory :task do
    sequence(:name) { |n| "Task #{n}" }
    completed { false }
    project
  end

  trait :edited_task do
    name { 'Edited task' }
  end
end
