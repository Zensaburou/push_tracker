FactoryGirl.define do
  factory :event do
    message { Faker::Lorem.sentence }
    user_id { FactoryGirl.create(:user).id }
    category_id { FactoryGirl.create(:category).id }
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
