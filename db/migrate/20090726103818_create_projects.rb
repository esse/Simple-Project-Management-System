class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :user_id, :options => "CONSTRAINT fk_users_id REFERENCES users(id)"

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
