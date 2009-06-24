class Visit < ActiveRecord::Base
  # every visit belongs to a user, linked through user_id
  belongs_to :user
  has_many :photos

  def has_photo?
    self.photos.length > 0
  end



end

# class project: extend this so that each visit can have multiple photos
