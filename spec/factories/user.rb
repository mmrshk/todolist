FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "username#{n}" }
    password 'password1'
    password_confirmation 'password1'
  end
end
