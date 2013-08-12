class AvatarController < ApplicationController
  def new
    if params[:bucket]



    end


    @uploader = current_user.avatar
    @uploader.success_action_redirect = request.url
  end

end
