class UsersController < ApplicationController
  def create
    user = UserService.new.create_user(params[:name])
    render json: user
    rescue ActiveRecord::RecordInvalid => error
      render json: error, status: 422
  end
end
