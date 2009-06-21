class AddBlobColumn < ActiveRecord::Migration
  def self.up
    add_column :visits, :photo, :binary, :limit => 1.megabyte 
  end

  def self.down
    remove_column :visits, :photo
  end
end
