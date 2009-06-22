class AddBlobColumns < ActiveRecord::Migration
  def self.up
      add_column :visits, :photo1, :binary
      add_column :visits, :photo2, :binary
      add_column :visits, :photo3, :binary
      add_column :visits, :photo4, :binary
      add_column :visits, :photo5, :binary

  end

  def self.down
    drop_column :visits, :photo1
    drop_column :visits, :photo2
    drop_column :visits, :photo3
    drop_column :visits, :photo4
    drop_column :visits, :photo5
  end
end
