class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
    @profile = current_user.build_profile
  end

  def show
    @profile = current_user.profile
  end

  def edit
    if current_user.profile.present?
      @profile = current_user.profile
    else
      @profile = current_user.build_profile
    end
  end
  
  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
        redirect_to root_path, notice: 'プロフィールを作成できました'
    else
        flash.now[:eoor] = '更新に失敗しました'
        render :new
    end
  end

  def update
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to profile_path, notice: 'プロフィールを更新'
    else
      flash.now[:eoor] = '更新できませんでした'
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:nickname, :gender, :birthday, :introduction, :avatar)
  end
end