class AddBlobColumn < ActiveRecord::Migration
  def self.up
    add_column :visits, :photo, :binary
  end

  def self.down
    remove_column :visits, :photo
  end
end
