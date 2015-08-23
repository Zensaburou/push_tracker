require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'create' do
    before :example do
      @user_name = Faker::Company.name.tr(' ', '_')
    end

    it 'calls create_user' do
      expect_any_instance_of(UserService).to receive(:create_user).with(@user_name)
      post :create, name: @user_name
    end

    it 'renders user json' do
      user = FactoryGirl.build :user
      allow_any_instance_of(UserService).to receive(:create_user) { user }
      expected_json = {
        id: user.id,
        name: user.name
      }.to_json
      post :create, name: @user_name
      expect(response.body).to eq expected_json
    end

    context 'validation error' do
      it 'renders json' do
        user = FactoryGirl.build :user
        allow_any_instance_of(UserService).to receive(:create_user) { fail ActiveRecord::RecordInvalid.new(user) }
        expected_json = {
          record: {
            id: user.id,
            name: user.name
          }
        }.to_json
        post :create, name: @user_name
        expect(response.body).to eq expected_json
      end

      it 'returns status' do
        user = FactoryGirl.build :user
        allow_any_instance_of(UserService).to receive(:create_user) { fail ActiveRecord::RecordInvalid.new(user) }
        post :create, name: @user_name
        expect(response).to have_http_status 422
      end
    end
  end
end
