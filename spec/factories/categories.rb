FactoryGirl.define do
  factory :category do
    name { Faker::Company.bs }
    user { FactoryGirl.create :user }
  end
end
