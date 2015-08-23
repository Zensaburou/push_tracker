require 'rails_helper'
require 'faker'

RSpec.describe 'routes', type: :routing do
  it 'creates users' do
    user_name = Faker::Company.name
    expected_route = '/users/' << user_name
    expect(post(expected_route)).to route_to(
      controller: 'users',
      action: 'create',
      name: user_name
    )
  end
end
