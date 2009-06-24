class AddPhotosTable < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.binary :photo
      t.integer :visit_id
    end
  end

  def self.down
    drop_table :photo
  end
end
