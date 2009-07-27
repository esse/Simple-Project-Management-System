class CreateUploadedFiles < ActiveRecord::Migration
  def self.up
    create_table :uploaded_files do |t|
      t.integer :container_id
      t.string :container_type
      t.string :content_type
      t.integer :size
      t.string :filename
      t.timestamps
    end
  end

  def self.down
    drop_table :uploaded_files
  end
end
