require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe 'create' do
    before :example do
      @user_name = Faker::Company.name.tr(' ', '_')
      @category_name = Faker::Company.bs.tr(' ', '_')
    end

    it 'calls create_category' do
      expect_any_instance_of(CategoryService).to receive :create_category
      post :create, name: @category_name, user_name: @user_name
    end

    it 'renders json' do
      category = FactoryGirl.build :category
      allow_any_instance_of(CategoryService).to receive(:create_category) { category }
      expected_json = {
        id: category.id,
        name: category.name,
        user_id: category.user_id
      }.to_json
      post :create, name: @category_name, user_name: @user_name
      expect(response.body).to eq expected_json
    end

    context 'error' do
      it 'renders json' do
        category = FactoryGirl.build :category
        allow_any_instance_of(CategoryService).to receive(:create_category) { fail ActiveRecord::RecordInvalid.new(category) }
        expected_json = {
          record: {
            id: category.id,
            name: category.name,
            user_id: category.user_id
          }
        }.to_json
        post :create, name: @category_name, user_name: @user_name
        expect(response.body).to eq expected_json
      end

      it 'returns status' do
        category = FactoryGirl.build :category
        allow_any_instance_of(CategoryService).to receive(:create_category) { fail ActiveRecord::RecordInvalid.new(category) }
        post :create, name: @category_name, user_name: @user_name
        expect(response).to have_http_status 422
      end
    end
  end
end
