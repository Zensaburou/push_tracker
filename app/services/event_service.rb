class EventService
  def create_events(param_hash)
    @user = User.find_by(name: param_hash[:user_name])
    @category = Category.find_by(name: param_hash[:category_name])

    event_array = param_hash[:payload][:events]
    event_array.map { |event_hash| create_event(event_hash) }
  end

  def create_event(event_hash)
    Event.create!(
      user_id: @user.id,
      category_id: @category.id,
      message: event_hash[:message]
    )
  end
end
