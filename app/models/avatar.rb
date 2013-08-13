class Avatar < ActiveRecord::Base
  mount_uploader :image, AvatarUploader

  def image_name
    File.basename(image.path || image.filename) if image
  end

end
