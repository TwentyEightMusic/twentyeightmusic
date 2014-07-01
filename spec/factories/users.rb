# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "kenyonj@gmail.com"
    password_digest "password123"
    name "Justin Kenyon"
  end
end
