FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "username#{n}" }
    password { 'password' }
    password_confirmation { 'password' }
  end

  trait :no_existing_user do
    username { 'Dima Bavykin' }
    password { 'justdance' }
    password_confirmation { 'justdance' }
  end

  trait :no_username do
    username { '' }
  end

  trait :no_password do
    password { '' }
  end

  trait :no_password_confirmation do
    password_confirmation { '' }
  end

  trait :short_username do
    username { 'a' }
  end

  trait :long_username do
    username { 'a' * 51 }
  end

  trait :not_correct_password_length do
    password { 'pass' }
    password_confirmation { 'pass' }
  end
end
