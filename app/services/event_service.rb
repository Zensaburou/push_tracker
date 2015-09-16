class EventService
  def create_events(param_hash)
    @param_hash = param_hash
    event_array = parse_event_array
    event_array.map { |event_hash| create_event(event_hash) }
  end

  def parse_event_array
    payload = parse_json_payload
    payload['events']
  end

  def create_event(event_hash)
    Event.create!(
      user_id: parse_user.id,
      category_id: parse_category.id,
      message: event_hash['message']
    )
  end

  def parse_user
    User.find_by(name: @param_hash[:user_name])
  end

  def parse_category
    Category.find_by(
      user_id: parse_user.id,
      name: @param_hash[:category_name]
    )
  end

  private

  def parse_json_payload
    json = @param_hash[:payload]
    JSON.parse(json)
  end
end
