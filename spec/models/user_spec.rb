require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of :name }

  describe 'uniqueness' do
    subject { FactoryGirl.build :user }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end
end
