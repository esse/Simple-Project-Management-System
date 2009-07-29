class RemoveVersioningFromMilestone  < ActiveRecord::Migration
def self.up
    Milestone.drop_versioned_table
    remove_column :milestones, :version
end

def self.down
    Milestone.create_versioned_table
    add_column :milestones, :version, :integer
end

end
