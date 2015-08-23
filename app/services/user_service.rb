class UserService
  def create_unique_user(name)
    User.create!(name: name)
    nil
  end
end
