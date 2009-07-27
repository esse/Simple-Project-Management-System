class CreateUserReports < ActiveRecord::Migration
  def self.up
    create_table :user_reports do |t|
      t.integer :user_id, :options => "CONSTRAINT fk_users_id REFERENCES users(id)"
      t.text :content
      t.integer :project_id, :options => "CONSTRAINT fk_projects_id REFERENCES projects(id)"

      t.timestamps
    end
  end

  def self.down
    drop_table :user_reports
  end
end
