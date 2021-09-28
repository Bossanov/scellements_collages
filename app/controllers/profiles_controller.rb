class ProfilesController < ApplicationController
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
    @profile.statut = "no"
    if @profile.save
      flash[:notice] = 'Votre profil a correctement été créé. Merci.'
      redirect_to root_path
    else
      flash[:notice] = 'Un problème est survenu lors de la création de votre profil.'
      redirect_to new_profile_path
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      flash[:notice] = 'Votre profil a correctement été actualisé. Merci.'
      redirect_to profile_path(@profile)
    else
      flash[:notice] = 'Un problème est survenu lors de la mise à jour de votre profil.'
      redirect_to profile_path(@profile)
    end
  end

  private

  def profile_params
  params.require(:profile).permit(:last_name, :first_name, :statut, :address, :post_code, :city, :country)
  end
end

