class TodosController < ApplicationController

  get'/todos' do
    todos =Todo.all
    {todos:todos}.to_json
  end

  get '/categories/:category_id/todos' do
    todos =Todo.where(category_id: params[:category_id])# select* from todo where category_id =PARAMS[:category_id]
category =Category.find(params[:category_id])
    {todos: todos, category:category}.to_json
  end

  post "/categories/:category_id/todos" do
      todo = Todo.create(category_id:params[:category_id],name:params[:name])
      if todo.save
        {message: "Task is created"}.to_json
      else
        {message:"Task is not created"}.to_json
        end
  end

  put "/categories/:category_id/todos/:id/edit" do
    puts params
    todo = Todo.find(params[:id])
    if todo.update(name:params[:name])
      {message:"Name updated successfully."}.to_json

    else
      {message: "Name update failed."}.to_json
    end
  end
  delete "/categories/:category_id/todos/:id/delete" do
    todo = Todo.find(params[:id]) #select * from categories where id = params[:id];
    if todo.destroy # delete from category where id = category.id;
      {message: "Task deleted"}.to_json
    else
      {message: "Task not deleted"}.to_json
    end
end
end


