class CreateTodos < ActiveRecord::Migration[6.1]
  def change

    create_table :categories do |t|
      t.string :name
      # the id column is generated automatically for every table! no need to specify it here.
    end
    create_table :todos do |t|
      t.string :name
      t.string :description
      t.boolean :marked
      t.integer :category_id
      # the id column is generated automatically for every table! no need to specify it here.
    end
  end

end
