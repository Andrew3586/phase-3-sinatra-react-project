class RemoveDesFromTodos < ActiveRecord::Migration[6.1]
  def change
    remove_column :todos, :description

  end
end
