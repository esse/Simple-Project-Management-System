class CreateWriteboards < ActiveRecord::Migration
  def self.up
    create_table :writeboards do |t|
      t.string :title
      t.text :content
      t.integer :version
      t.integer :user_id, :options => "CONSTRAINT fk_users_id REFERENCES users(id)"
      t.integer :project_id, :options => "CONSTRAINT fk_projects_id REFERENCES projects(id)"
      t.timestamps
    end
  end

  def self.down
    drop_table :writeboards
  end
end
