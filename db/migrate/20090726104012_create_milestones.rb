class CreateMilestones < ActiveRecord::Migration
  def self.up
    create_table :milestones do |t|
      t.string :name
      t.text :description
      t.datetime :date
      t.integer :user_id, :options => "CONSTRAINT fk_users_id REFERENCES users(id)"
      t.integer :project_id, :options => "CONSTRAINT fk_projects_id REFERENCES projects(id)"

      t.timestamps
    end
  end

  def self.down
    drop_table :milestones
  end
end
