require 'rails_helper'

RSpec.describe Event, type: :model do
  it { is_expected.to belong_to :category }
  it { is_expected.to have_one(:user).through(:category) }
end
