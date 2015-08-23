require 'rails_helper'

RSpec.describe UserService do
  before :example do
    @service = UserService.new
  end

  describe 'create_unique_user' do
    before :context do
      @name = Faker::Company.name.tr(' ', '_')
    end

    context 'user does not already exist' do
      it 'creates a new user' do
        @service.create_unique_user(@name)
        expected_user = User.where(name: @name)
        expect(expected_user.count).to eq 1
      end

      it 'returns nil' do
        error = @service.create_unique_user(@name)
        expect(error).to be nil
      end
    end
  end
end
