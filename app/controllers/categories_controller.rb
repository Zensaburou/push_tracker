class CategoriesController < ApplicationController
  def create
    category = CategoryService.new.create_category(params)
    render json: category
  end
end
