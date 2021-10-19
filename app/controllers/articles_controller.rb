class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/1
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    @article.statut = "no"

    if @article.save
      redirect_to pages_admin_path, notice: 'L article a été créé avec succès.'
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to pages_admin_path, notice: 'L article a été modifié avec succès.'
    else
      render :edit
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'L article a été effacé avec succès.'
  end

  def article_upgrade
    @article = Article.find(params[:id])
    @article.statut = "yes"
    @article.save
    redirect_to pages_admin_path
  end

  def article_downgrade
    @article = Article.find(params[:id])
    @article.statut = "no"
    @article.save
    redirect_to pages_admin_path
  end

  def searcharticle(query)

    @results = ArticleIndex.search(query).records
    redirect_to search_path

  end

  def supprimer_article
    @article = Article.where(id: params[:articleid])

    @article.last.destroy
    flash[:alert] = "L'article a été effacé de la base de donnée."
    redirect_to pages_admin_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body,:statut, :theme, photos: [])
    end
end
