require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of :name }

  describe 'uniqueness' do
    subject { FactoryGirl.build :user }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end

  it { is_expected.to have_many :categories }
  it { is_expected.to have_many(:events).through(:categories) }
end
