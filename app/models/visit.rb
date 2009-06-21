class Visit < ActiveRecord::Base
  # every visit belongs to a user, linked through user_id
  belongs_to :user

  after_save :store_photo



  def photo=(file_data)
    unless file_data.blank?  # is this shorthand for unless file_data.blank == true ?
      @file_data = file_data
    end
  end

  def has_photo?
    File.exists? photo_filename
  end

  PHOTO_STORE = File.join RAILS_ROOT, 'public', 'photo_store'

  def photo_filename
    File.join PHOTO_STORE, "#{id}.jpg"
  end

  def photo_path
    "/photo_store/#{id}.jpg"
  end

  private
  
  def store_photo
    if @file_data
      FileUtils.mkdir_p PHOTO_STORE
      File.open(photo_filename, 'wb') do |f|
        f.write(@file_data.read)
      end
      
      @file_data = nil
    end
  end

end

# class project: extend this so that each visit can have multiple photos
