class PublicitiesController < ApplicationController
  before_action :set_publicity, only: [:show, :edit, :update, :destroy]

  # GET /publicities
  def index
    @publicities = Publicity.all
  end

  # GET /publicities/1
  def show
  end

  # GET /publicities/new
  def new
    @publicity = Publicity.new
  end

  # GET /publicities/1/edit
  def edit
  end

  # POST /publicities
  def create
    @publicity = Publicity.new(publicity_params)

    if @publicity.save
      redirect_to pages_admin_path, notice: 'La publicité a été enregistrée'
    else
      render :new
    end
  end

  # PATCH/PUT /publicities/1
  def update
    if @publicity.update(publicity_params)
      redirect_to pages_admin_path, notice: 'La publicité a été modifiée'
    else
      render :edit
    end
  end

  def supprimer_publicity
    @publicity = Publicity.where(id: params[:publicityid])

    @publicity.last.destroy
    flash[:alert] = "La publicité a été effacée de la base de donnée."
    redirect_to pages_admin_path
  end


  # DELETE /publicities/1
  def destroy
    @publicity.destroy
    redirect_to publicities_url, notice: 'Publicity was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publicity
      @publicity = Publicity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def publicity_params
      params.require(:publicity).permit(:title, :content, :lien, :situation, :taille, :statut, photos: [])
    end
end
