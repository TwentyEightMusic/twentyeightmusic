FactoryBot.define do
  factory :user do
    email { "kenyonj@gmail.com" }
    password_digest { "password123" }
    name { "Justin Kenyon" }
  end
end
