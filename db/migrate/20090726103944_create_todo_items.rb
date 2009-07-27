class CreateTodoItems < ActiveRecord::Migration
  def self.up
    create_table :todo_items do |t|
      t.string :name
      t.text :description
      t.integer :todo_list_id, :options => "CONSTRAINT fk_todo_lists_id REFERENCES todo_lists(id)"
      t.integer :user_id, :options => "CONSTRAINT fk_users_id REFERENCES users(id)"

      t.timestamps
    end
  end

  def self.down
    drop_table :todo_items
  end
end
