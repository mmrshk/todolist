FactoryBot.define do
  factory :comment do
    sequence(:text) { |n| "Comment text #{n}" }
    task
  end

  trait :with_file do
    file { File.open(File.join(Rails.root, 'public/uploads/comment/1.jpg')) }
  end

  trait :edited_comment do
    text { 'Edited comment' }
  end
end
