class RegistrationsController < Devise::RegistrationsController

  def edit
    @uploader = current_user.avatar
    puts "Uploader=#{@uploader.inspect}"
    @uploader.success_action_redirect = edit_user_registration_path
    super
  end


  private

  def after_inactive_sign_up_path_for(resource)
    puts "after_inactive_sign_up_path_for"
    root_path
  end

  def after_sign_up_path_for(resource)
    puts "after_sign_up_path_for"
    root_path
  end
end
