FactoryGirl.define do
  factory :gig do
    sequence(:venue) {|n| "Bar #{n}" }
    start_time Time.now
  end
end
