class User < ActiveRecord::Base
  # a user can visit many places
  has_many :visits, :dependent => :destroy

  has_and_belongs_to_many :cars

  def full_name
    first_name + " " + last_name
  end

  def has_car?(car)
    self.cars.include?(car)
  end

  def unowned_cars
    Car.find(:all) - self.cars
  end
    
end
