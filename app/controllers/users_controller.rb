class UsersController < ApplicationController
  def create
    UserService.new.create_unique_user
    render nothing: true
  end
end
