require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  before :example do
    @user_name = Faker::Company.name.tr(' ', '_')
    @category_name = Faker::Company.bs.tr(' ', '_')
  end

  describe 'create' do
    it 'calls create_events' do
      expect_any_instance_of(EventService).to receive :create_events
      post :create, category_name: @category_name, user_name: @user_name
    end
  end
end
