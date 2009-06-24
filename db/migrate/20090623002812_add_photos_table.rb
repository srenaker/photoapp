class AddPhotosTable < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.binary :photo_data
      t.integer :visit_id
    end

  remove_column :visits, :photo1
  remove_column :visits, :photo2
  remove_column :visits, :photo3
  remove_column :visits, :photo4
  remove_column :visits, :photo5

  end

  def self.down
    drop_table :photo
    
  end
end
