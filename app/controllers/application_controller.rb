class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/categories" do
    @categories = Category.all
    {category: @categories}.to_json
  end
  post "/categories" do
    @category = Category.create(name: params[:name])
    if @category.save
      {category: @category}.to_json
    else
      {category: "error"}.to_json
    end
  end
patch "/categories/:id" do
  category = Category.find_by_id(params[:id])
  @category = category.update(name: params[:name])
  if @category
    {category: @category}.to_json
  else
    {category: "error"}.to_json
  end
end


  get "/todos" do
    @todos = Todo.all
    {todos: @todos}.to_json
  end
  post "/todos" do
    category = Category.where(name: params[:category_name]).first
    unless category
      category = Category.create(name: params[:category_name])
    end
    category_id = category ? category.id : nil

    @todos = Todo.create(name: params[:name], description: params[:description], marked: params[:marked],
    category_id: category_id)
    if @todos.save
      {todos: @todos}.to_json
    else
      {todos: "error"}.to_json
    end
  end
  patch "/todos/:id" do
    todo = Todo.find_by_id(params[:id])
    category = Category.where(name: params[:category_name]).first
    category_id = category ? category.id : todo.category_id
    @todos = todo.update(description: params[:description], marked: params[:marked],
    category_id: category_id)
    if @todos
      {todos: @todos}.to_json
    else
      {todos: "error"}.to_json
    end
  end
  delete "/todos/:id" do
    @todo = Todo.find_by_id(params[:id])
    @todo.destroy
    {deleted: true}.to_json
  end
  delete "/categories/:id" do
    @todo = Category.find_by_id(params[:id])
    @todo.destroy
    {deleted: true}.to_json
  end
end
