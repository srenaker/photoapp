class Visit < ActiveRecord::Base
  # every visit belongs to a user, linked through user_id
  belongs_to :user





  def photo=(file_data)
    unless file_data.blank?  
      self[:photo] = file_data.read
    end
  end


  def has_photo?
    photo
  end

  PHOTO_STORE = File.join RAILS_ROOT, 'public', 'photo_store'

  def photo_filename
    File.join PHOTO_STORE, "#{id}.jpg"
  end

  def photo_path
    "/visits/#{id}/photo"
  end


end

# class project: extend this so that each visit can have multiple photos
