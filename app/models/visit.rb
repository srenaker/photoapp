class Visit < ActiveRecord::Base
  # every visit belongs to a user, linked through user_id
  belongs_to :user

  def photo1=(file_data)
    unless file_data.blank?  
      self[:photo1] = file_data.read
    end
  end

  def photo2=(file_data)
    unless file_data.blank?  
      self[:photo2] = file_data.read
    end
  end

  def photo3=(file_data)
    unless file_data.blank?  
      self[:photo3] = file_data.read
    end
  end

  def photo4=(file_data)
    unless file_data.blank?  
      self[:photo4] = file_data.read
    end
  end

  def photo5=(file_data)
    unless file_data.blank?  
      self[:photo5] = file_data.read
    end
  end


  def has_photo1?
    photo1
  end

  def has_photo2?
    photo2
  end

  def has_photo3?
    photo3
  end

  def has_photo4?
    photo4
  end

  def has_photo5?
    photo5
  end

#  PHOTO_STORE = File.join RAILS_ROOT, 'public', 'photo_store'

#  def photo_filename
#    File.join PHOTO_STORE, "#{id}.jpg"
#  end

  def photo_path1
    "/visits/#{id}/photo1"
  end

  def photo_path2
    "/visits/#{id}/photo2"
  end

  def photo_path3
    "/visits/#{id}/photo3"
  end

  def photo_path4
    "/visits/#{id}/photo4"
  end

  def photo_path5
    "/visits/#{id}/photo5"
  end


end

# class project: extend this so that each visit can have multiple photos
