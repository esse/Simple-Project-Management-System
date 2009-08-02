class AddWorkflowStateToTables < ActiveRecord::Migration
  def self.up
    add_column :milestones, :workflow_state, :string
    add_column :projects, :workflow_state, :string
    add_column :todo_items, :workflow_state, :string
    add_column :todo_lists, :workflow_state, :string
  end

  def self.down
    remove_column :milestones, :workflow_state
    remove_column :projects, :workflow_state
    remove_column :todo_items, :workflow_state
    remove_column :todo_lists, :workflow_state
  end
end
