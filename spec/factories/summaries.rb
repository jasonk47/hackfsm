# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :summary do
    date "2014-04-12"
    summary "MyText"
    source_url "MyString"
  end
end
