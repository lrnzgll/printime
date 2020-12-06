FactoryBot.define do
  factory :period do
    job
    user
    start_time { Time.zone.now - 1.hour }

    trait :ended_period do
      end_time { Time.zone.now }
    end
  end
end
