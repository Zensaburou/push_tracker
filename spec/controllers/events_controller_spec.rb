require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'create' do
    before :example do
      @user_name = Faker::Company.name.tr(' ', '_')
      @category_name = Faker::Company.bs.tr(' ', '_')
    end

    it 'calls create_events' do
      expect_any_instance_of(EventService).to receive :create_events
      post :create, category_name: @category_name, user_name: @user_name
    end

    it 'renders json' do
      event = FactoryGirl.build :event
      allow_any_instance_of(EventService).to receive(:create_events) { event }
      expected_json = {
        id: event.id,
        category_id: event.category_id,
        message: event.message,
        created_at: event.created_at,
        updated_at: event.updated_at
      }.to_json
      post :create, category_name: @category_name, user_name: @user_name
      expect(response.body).to eq expected_json
    end

    context 'error' do
      it 'renders json' do
        event = FactoryGirl.build :event
        allow_any_instance_of(EventService).to receive(:create_events) { fail ActiveRecord::RecordInvalid.new(event) }
        expected_json = {
          record: {
            id: event.id,
            category_id: event.category_id,
            message: event.message,
            created_at: event.created_at,
            updated_at: event.updated_at
          }
        }.to_json
        post :create, category_name: @category_name, user_name: @user_name
        expect(response.body).to eq expected_json
      end

      it 'returns status' do
        category = FactoryGirl.build :event
        allow_any_instance_of(EventService).to receive(:create_events) { fail ActiveRecord::RecordInvalid.new(category) }
        post :create, category_name: @category_name, user_name: @user_name
        expect(response).to have_http_status 422
      end
    end
  end
end
