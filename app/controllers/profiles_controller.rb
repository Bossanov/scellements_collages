class ProfilesController < ApplicationController

  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  def new
    @profile = Profile.new
  end

  def show
    @profile = Profile.find(params[:id])

  end

  def index
    @profiles = Profile.all
  end


  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    @profile.statut = "client"
    if @profile.save
      flash[:notice] = 'Votre profil a correctement été créé. Merci.'
      redirect_to root_path
    else
      flash[:notice] = 'Un problème est survenu lors de la création de votre profil.'
      redirect_to new_profile_path
    end
  end

  def edit
   @profile = Profile.find(params[:id])
  end

  def update

    if @profile.update(profile_params)
      flash[:notice] = 'Votre profil a correctement été actualisé. Merci.'
      redirect_to pages_admin_path
    else
      flash[:notice] = 'Un problème est survenu lors de la mise à jour de votre profil.'
      redirect_to pages_admin_path
    end
  end

  def effacer_profile

    @profile = Profile.find(params[:profileid])
    @user = User.where(id: @profile.user_id)
    @profile.destroy
    @user.last.destroy
    redirect_to pages_admin_path

  end


  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:last_name, :first_name, :statut, :address, :post_code, :city, :country,photos: [])
  end
end

