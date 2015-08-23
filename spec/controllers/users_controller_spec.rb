require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'create' do
    it 'calls create_user' do
      user_name = Faker::Company.name.tr(' ', '_')
      expect_any_instance_of(UserService).to receive(:create_unique_user).with(user_name)
      post :create, name: user_name
    end
  end
end
