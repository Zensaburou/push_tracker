require 'rails_helper'
require 'faker'

RSpec.describe 'routes', type: :routing do
  it 'creates users' do
    user_name = Faker::Company.name.tr(' ', '_')
    expected_route = '/v1/' << user_name
    expect(post(expected_route)).to route_to(
      controller: 'users',
      action: 'create',
      name: user_name
    )
  end

  it 'creates categories' do
    user_name = Faker::Company.name.tr(' ', '_')
    category_name = Faker::Company.bs.tr(' ', '_')
    expected_route = '/v1/' << user_name << '/' << category_name
    expect(post(expected_route)).to route_to(
      controller: 'categories',
      action: 'create',
      user_name: user_name,
      name: category_name
    )
  end

  it 'creates events' do
    user_name = Faker::Company.name.tr(' ', '_')
    category_name = Faker::Company.bs.tr(' ', '_')
    expected_route = '/v1/' << user_name << '/' << category_name << '/create'
    expect(post(expected_route)).to route_to(
      controller: 'events',
      action: 'create',
      user_name: user_name,
      category_name: category_name
    )
  end
end
