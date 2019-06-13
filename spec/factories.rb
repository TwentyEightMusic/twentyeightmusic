FactoryBot.define do
  factory :gig do
    sequence(:venue) { |n| "Bar #{n}" }
    start_time { 1.day.from_now }

    trait :past do
      start_time { 1.day.ago }
    end
  end

  factory :api_key do
    token { "#{SecureRandom.hex(18)}" }
  end
end
