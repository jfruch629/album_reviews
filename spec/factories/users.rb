FactoryBot.define do
  factory :user do
    first_name 'Jake'
    last_name 'Fruci'
    sequence(:email) { |n| 'email#{n}@example.com' }
    password 'password'
  end
end
