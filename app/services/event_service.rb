class EventService
  attr_accessor :user
  attr_accessor :category

  def create_events(param_hash)
    self.user = User.find_by(name: param_hash[:user_name])
    self.category = Category.find_by(name: param_hash[:category_name])

    event_array = param_hash[:payload][:events]
    event_array.map { |event_hash| create_event(event_hash) }
  end

  def create_event(event_hash)
  end
end
