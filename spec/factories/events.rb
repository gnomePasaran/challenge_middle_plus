FactoryBot.define do
  factory :event do
    event_type { create :event_type }
    user { create :user }
    title { FFaker::Lorem.word }
    date { Date.tomorrow }
    start_at { Time.current }
    finish_at { Time.current }
    description { FFaker::Lorem.sentence }
  end
end
