class RegistrationsController < Devise::RegistrationsController

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
