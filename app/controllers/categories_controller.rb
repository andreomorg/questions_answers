class CategoriesController < ApplicationController
  def show
    render json: Category.all, status: :ok
  end
end
