FactoryGirl.define do
  factory :category do
    name { Faker::Company.bs }
    user_id { FactoryGirl.create(:user).id }
  end
end
