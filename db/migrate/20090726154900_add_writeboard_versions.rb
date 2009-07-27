class AddWriteboardVersions < ActiveRecord::Migration
  def self.up
    Writeboard.create_versioned_table

  end

  def self.down
    Writeboard.drop_versioned_table
  end
end
