class LawArticlesController < ApplicationController
  before_action :set_law_article, only: [:show, :update, :destroy]

  # GET /law_articles
  def index
    @law_articles = LawArticle.all

    render json: @law_articles
  end

  # GET /law_articles/1
  def show
    render json: @law_article
  end

  # POST /law_articles
  def create
    law_article_service = LawArticleService.new(LawArticle.new(law_article_params))
    @law_article = law_article_service.make_descriptive
    if @law_article.article.save
      render json: @law_article, status: :created, location: @law_article
    else
      puts @law_article.errors.to_json
      render json: @law_article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /law_articles/1
  def update
    if @law_article.update(law_article_params)
      render json: @law_article
    else
      render json: @law_article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /law_articles/1
  def destroy
    @law_article.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_law_article
      @law_article = LawArticle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def law_article_params
      params.require(:law_article).permit(:law, article_attributes: [:id, :subject, :author_id])
    end
end
