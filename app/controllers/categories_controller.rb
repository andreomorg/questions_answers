class CategoriesController < ApplicationController
  def index
    render json: Category.all, status: :ok
    #each_serializer
  end
end
