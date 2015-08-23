class UsersController < ApplicationController
  def create
    UserService.new.create_unique_user(params[:name])
    render nothing: true
  end
end
