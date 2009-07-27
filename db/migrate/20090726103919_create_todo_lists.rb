class CreateTodoLists < ActiveRecord::Migration
  def self.up
    create_table :todo_lists do |t|
      t.string :name
      t.text :description
      t.integer :project_id, :options => "CONSTRAINT fk_projects_id REFERENCES projects(id)"
      t.integer :milestone_id, :options => "CONSTRAINT fk_projects_id REFERENCES projects(id)"

      t.timestamps
    end
  end

  def self.down
    drop_table :todo_lists
  end
end
