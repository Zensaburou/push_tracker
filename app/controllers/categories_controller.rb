class CategoriesController < ApplicationController
  def create
    category = CategoryService.new.create_category(params)
    render json: category
    rescue StandardError => error
      render json: error, status: 422
  end
end
