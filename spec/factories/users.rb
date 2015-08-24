FactoryGirl.define do
  factory :user do
    name { Faker::Company.name.tr(' ', '_') }
  end
end
