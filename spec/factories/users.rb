# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "MyString"
    salt "MyString"
    hashed_password "MyString"
  end
end
