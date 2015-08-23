class UserService
  def create_user(name)
    User.create!(name: name)
  end
end
