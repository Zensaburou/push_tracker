require 'rails_helper'

RSpec.describe EventService do
  describe 'instance methods' do
    before :context do
      @user = FactoryGirl.create :user
      @category = FactoryGirl.create(:category, user_id: @user.id)
      @message = Faker::Lorem.sentence
      @second_message = Faker::Lorem.sentence
      @param_hash = {
        category_name: @category.name,
        user_name: @user.name,
        payload: {
          events: [
            { message: @message },
            { message: @second_message }
          ]
        }
      }
    end

    before :example do
      @service = EventService.new
    end

    describe 'create_events' do
      it 'sets param_hash' do
        @service.create_events(@param_hash)
        instance_var = @service.instance_variable_get(:@param_hash)
        expect(instance_var).to eq @param_hash
      end

      it 'calls create_event' do
        event_number = @param_hash[:payload][:events].count
        expect_any_instance_of(EventService).to receive(:create_event).exactly(event_number).times
        @service.create_events(@param_hash)
      end

      it 'returns array of events' do
        expected_array = @service.create_events(@param_hash)
        expect(expected_array).to be_an Array
        expect(expected_array[0]). to be_an Event
      end
    end

    describe 'create_event' do
      before :example do
        @event_hash = { message: @message }
        @service.instance_variable_set(:@param_hash, @param_hash)
      end

      it 'creates event' do
        @service.create_event(@event_hash)
        events = Event.where(
          user_id: @user.id,
          category_id: @category.id,
          message: @message
        )
        expect(events.count).to eq 1
      end
    end

    describe 'parse_user' do
      before :example do
        @service.instance_variable_set(:@param_hash, @param_hash)
      end

      it 'returns the user' do
        expect(@service.parse_user).to eq @user
      end
    end

    describe 'parse_category' do
      before :example do
        @service.instance_variable_set(:@param_hash, @param_hash)
      end

      it 'returns the category' do
        expect(@service.parse_category).to eq @category
      end
    end
  end
end
