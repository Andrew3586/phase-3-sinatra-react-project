class CategoriesController < ApplicationController

  # GET: /posts -> index
  get "/categories" do
    @categories = Category.all
    json :@categories
  end

  post "/categories" do
  @category = Category.create(name: params[:name])
  if @category.save
  render json: @category
  else
  render json: "error"
  end
  end
end
