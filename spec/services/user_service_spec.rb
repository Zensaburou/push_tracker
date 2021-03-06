require 'rails_helper'

RSpec.describe UserService do
  before :example do
    @service = UserService.new
  end

  describe 'create_user' do
    before :context do
      @name = Faker::Company.name.tr(' ', '_')
    end

    it 'creates a new user' do
      @service.create_user(@name)
      expected_user = User.where(name: @name)
      expect(expected_user.count).to eq 1
    end

    it 'returns user' do
      user = @service.create_user(@name)
      expect(user).to be_a User
    end
  end
end
