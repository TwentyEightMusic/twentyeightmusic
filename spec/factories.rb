FactoryGirl.define do
  factory :gig do
    sequence(:venue) {|n| "Bar #{n}" }
    start_time Time.now
  end

  factory :api_key do
    token SecureRandom.hex(18)
  end
end
