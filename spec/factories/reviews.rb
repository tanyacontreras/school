# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    text "MyString"
    rating 1
    user nil
    school nil
  end
end
