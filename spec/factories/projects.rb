FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    user
  end

  trait :edited do
    name { 'edited name' }
  end
end
