require 'rails_helper'

RSpec.describe Category, type: :model do
  it { is_expected.to validate_presence_of :name }

  describe 'uniqueness' do
    subject { FactoryGirl.build :category }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive.scoped_to(:user_id) }
  end

  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :events }
end
