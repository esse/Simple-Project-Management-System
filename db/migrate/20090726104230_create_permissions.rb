class CreatePermissions < ActiveRecord::Migration
  def self.up
    create_table :permissions do |t|
      t.integer :user_id, :options => "CONSTRAINT fk_users_id REFERENCES users(id)"
      t.integer :project_id, :options => "CONSTRAINT fk_projects_id REFERENCES projects(id)"
      t.integer :level

      t.timestamps
    end
  end

  def self.down
    drop_table :permissions
  end
end
