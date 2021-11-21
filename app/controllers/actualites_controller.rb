class ActualitesController < ApplicationController
  before_action :set_actualite, only: [:show, :edit, :update, :destroy]

  # GET /actualites
  def index
    @actualites = Actualite.all
  end

  # GET /actualites/1
  def show
  end

  # GET /actualites/new
  def new
    @actualite = Actualite.new
  end

  # GET /actualites/1/edit
  def edit
  end

  # POST /actualites
  def create
    @actualite = Actualite.new(actualite_params)

    if @actualite.save
      redirect_to pages_admin_path, notice: "La nouvelle actualité a été créée."
    else
      render :new
    end
  end

  # PATCH/PUT /actualites/1
  def update
    if @actualite.update(actualite_params)
      redirect_to pages_admin_path, notice: "L'actualité a été modifiée."
    else
      render :edit
    end
  end

  # DELETE /actualites/1
  def destroy
    @actualite.destroy
    redirect_to actualites_url, notice: 'Actualite was successfully destroyed.'
  end

  def supprimer_actualite
    @actualite = Actualite.where(id: params[:actualiteid])

    @actualite.last.destroy
    flash[:alert] = "L'actualité a été effacée de la base de donnée."
    redirect_to pages_admin_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actualite
      @actualite = Actualite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def actualite_params
      params.require(:actualite).permit(:title, :date, :content, :statut, :lien, photos: [])
    end
end
