class CategoriesController < ApplicationController

#read
get '/categories' do
  categories = Category.all #select * from categories.
  {categories:categories}.to_json
end

#create
post "/categories" do
  category = Category.create(name:params[:category_name]) # create{category_name} on category;
  if category.save
    {message: "category created successfully."}.to_json
  else
    {message: "category creation failed"}.to_json
  end
end

#update
put "/categories/:id/edit" do
  category = Category.find(params[:id]) #select * from categories where id = params[:id];
  if category.update(name:params[:category_name])
    {message:"category update successfull."}.to_json

  else
    {message: "category update failed."}.to_json
  end
end

delete "/categories/:id" do
  category = Category.find(params[:id]) #select * from categories where id = params[:id];
  if category.delete # delete from category where id = category.id;
    {message: "category deleted"}.to_json
  else
    {message: "category not deleted."}.to_json
  end
end


end
