class AvatarController < ApplicationController
  before_action :require_login, :except => :index

  def index
    @avatars = Avatar.all
    if current_user
      @uploader = Avatar.new.image
      @uploader.success_action_redirect = new_avatar_url
    end
  end

  def show
    @avatar = Avatar.find(params[:id])
  end

  def new
    @avatar = Avatar.new(key: params[:key])
  end

  def create
    permitted = params.require(:avatar).permit(:name, :key)
    @avatar = Avatar.new(permitted)
    if @avatar.save
      redirect_to avatar_url(@avatar), notice: "Avatar was successfully created."
    else
      render :new
    end
  end

  def edit
    @avatar = Avatar.find(params[:id])
  end

  def update
    @avatar = Avatar.find(params[:id])
    if @avatar.update_attributes(params[:avatar])
      redirect_to avatar_url, notice: "Avatar was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @avatar = Avatar.find(params[:id])
    @avatar.destroy
    redirect_to avatar_index_url, notice: "Avatar was successfully destroyed."
  end


  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path
    end
  end

end
