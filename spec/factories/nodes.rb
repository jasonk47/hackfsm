# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :node do
    name "MyString"
    description "MyString"
    date "2014-04-12"
    value 1.5
  end
end
