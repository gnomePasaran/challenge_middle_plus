FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "example-#{n}@site.com" }
    full_name { FFaker::Name.first_name }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
