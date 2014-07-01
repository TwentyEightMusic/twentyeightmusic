# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :track do
    bootleg nil
    name "MyString"
    filepicker_url "MyString"
  end
end
