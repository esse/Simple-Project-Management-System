class RemoveVersioningFromTodolistsAndItems < ActiveRecord::Migration
  def self.up
    TodoItem.drop_versioned_table
    TodoList.drop_versioned_table  
    remove_column :todo_items, :version
    remove_column :todo_lists, :version
  end

  def self.down
    add_column :todo_items, :version, :integer
    add_column :todo_lists, :version, :integer
    TodoItem.create_versioned_table
    TodoList.create_versioned_table
  end
end
