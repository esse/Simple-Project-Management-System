class AddUsersPasswordResetFields < ActiveRecord::Migration
  def self.up
   add_column :users, :perishable_token, :string, :default => "", :null => false 

  end

  def self.down
    remove_column :users, :perishable_token
  end
end
