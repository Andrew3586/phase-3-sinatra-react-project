class AddDefaultToMarked < ActiveRecord::Migration[6.1]
  def change
    change_column :todos, :marked, :boolean, default: false
  end
end
