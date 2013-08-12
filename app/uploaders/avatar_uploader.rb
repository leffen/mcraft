# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWaveDirect::Uploader

  include CarrierWave::MimeTypes
  process :set_content_type

  #def store_dir
  #  "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  #end

  def extension_white_list
    %w(jpg png gif)
  end


end
