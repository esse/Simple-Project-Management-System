class AddVersionedTableVersions < ActiveRecord::Migration
  def self.up
    add_column :milestones, :version, :integer
    add_column :todo_items, :version, :integer
    add_column :todo_lists, :version, :integer
    Milestone.create_versioned_table
    TodoItem.create_versioned_table
    TodoList.create_versioned_table
  end

  def self.down
    Milestone.drop_versioned_table
    TodoItem.drop_versioned_table
    TodoList.drop_versioned_table
    remove_column :milestones, :versionr
    remove_column :todo_items, :version
    remove_column :todo_lists, :version
  end
end
