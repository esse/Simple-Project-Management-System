class RemoveUserIdFromProject < ActiveRecord::Migration
  def self.up
    remove_column :projects, :user_id
  end

  def self.down
    add_column :projects, :user_id, :integer, :options => "CONSTRAINT fk_users_id REFERENCES users(id)"
  end
end
