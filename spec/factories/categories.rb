FactoryGirl.define do
  factory :category do
    name { Faker::Company.bs.tr(' ', '_') }
    user { FactoryGirl.create :user }
  end
end
