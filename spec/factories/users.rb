FactoryGirl.define do
  factory :user do
    name { Faker::Company.name }
  end
end
