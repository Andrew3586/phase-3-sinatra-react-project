class TodosController < ApplicationController

  get'/todos' do
    todos =Todo.all
    {todos:todos}.to_json
  end

  get '/categories/:category_id/todos' do
    todos =Todo.where(category_id: params[:category_id])# select* from todo where category_id =PARAMS[:category_id]
    {todos: todos}.to_json
  end

  post "/categories/:category_id/todos" do
      todo = Todo.create(category_id:params[:category_id],name:params[:name])
      if todo.save
        {message: "To do is created"}.to_json
      else
        {message:"To do is not created"}.to_json
        end
  end

  put "/categories/:category_id/todos/:id/edit" do
    todo = Todo.find(params[:id])
    if todo.update(name:params[:todo_name])
      {message:"Name update successfull."}.to_json

    else
      {message: "Name update failed."}.to_json
    end
  end
  delete "/categories/:category_id/todos/:id/delete" do
    todo = Todo.find(params[:id]) #select * from categories where id = params[:id];
    if todo.delete # delete from category where id = category.id;
      {message: "To do deleted"}.to_json
    else
      {message: "To do not deleted."}.to_json
    end
end
end


