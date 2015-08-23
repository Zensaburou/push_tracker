class UserService
  def create_unique_user(name)
    User.create!(name: name)
    rescue ActiveRecord::RecordInvalid => error
      error
  end
end
