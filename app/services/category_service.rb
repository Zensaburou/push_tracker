class CategoryService
  def create_category(param_hash)
    user = User.find_by(name: param_hash[:user_name])
    Category.create!(
      name: param_hash[:name],
      user_id: user.id
    )
  end
end
