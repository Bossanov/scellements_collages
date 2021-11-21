class ThemesController < ApplicationController
  before_action :set_theme, only: [:show, :edit, :update, :destroy]

  # GET /themes
  def index
    @themes = Theme.all
  end

  # GET /themes/1
  def show
  end

  # GET /themes/new
  def new
    @theme = Theme.new
  end

  # GET /themes/1/edit
  def edit
  end

  # POST /themes
  def create
    @theme = Theme.new(theme_params)

    if @theme.save
      redirect_to pages_admin_path, notice: 'Le thème a été créé.'
    else
      render :new
    end
  end

  # PATCH/PUT /themes/1
  def update
    if @theme.update(theme_params)
      redirect_to pages_admin_path, notice: 'Le thème a été modifié.'
    else
      render :edit
    end
  end

  # DELETE /themes/1
  def destroy
    @theme.destroy
    redirect_to themes_url, notice: 'Theme was successfully destroyed.'
  end

  def supprimer_theme
    @theme = Theme.where(id: params[:themeid])

    @theme.last.destroy
    flash[:alert] = "Le thème a été effacé de la base de donnée."
    redirect_to pages_admin_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theme
      @theme = Theme.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def theme_params
      params.require(:theme).permit(:title, :nom)
    end
end
