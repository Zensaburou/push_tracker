require 'rails_helper'

RSpec.describe CategoryService do
  before :example do
    @service = CategoryService.new
  end

  describe 'create_category' do
    before :context do
      @user = FactoryGirl.create :user
      @param_hash = {
        name: Faker::Company.bs.tr(' ', '_'),
        user_name: @user.name
      }
    end

    it 'creates category' do
      @service.create_category(@param_hash)
      expected_category = Category.where(
        name: @param_hash[:name],
        user_id: @user.id
      )
      expect(expected_category.count).to eq 1
    end

    it 'returns category' do
      category = @service.create_category(@param_hash)
      expect(category).to be_a Category
    end
  end
end
