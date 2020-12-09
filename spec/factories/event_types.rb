FactoryBot.define do
  factory :event_type do
    sequence(:title) { |n| "Event title-#{n}" }
  end
end
