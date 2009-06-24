class Photo < ActiveRecord::Base
  belongs_to :visit

  def photo_path
    "/users/#{visit.user.id}/visits/#{visit.id}/photos/#{id}"
  end

end
