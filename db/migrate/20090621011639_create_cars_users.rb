class CreateCarsUsers < ActiveRecord::Migration
  def self.up
    create_table :cars_users, :id => false do |t|
      t.integer :car_id, :null => false
      t.integer :user_id, :null => false
    end

    add_index :cars_users, [:car_id, :user_id], :unique => true
  end

  def self.down
    remove_index :cars_users, :column => [:car_id, :user_id]
    drop_table :cars_users
  end
end
