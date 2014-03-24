# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :school do
    name "MyString"
    address "MyString"
    city "MyString"
    zip "MyString"
    phone_number "MyString"
    url "MyString"
    county "MyString"
    school_type "MyString"
    grade_level "MyString"
    rating "MyString"
    is_religious false
  end
end
