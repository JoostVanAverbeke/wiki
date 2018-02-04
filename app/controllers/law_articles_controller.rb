class LawArticlesController < ApplicationController
  include Swagger::Docs::Methods
  
  before_action :set_law_article, only: [:show, :update, :destroy]

  swagger_controller :authors, "Law Articles Management"

  # GET /law_articles
  swagger_api :index do
    summary "Fetches Law Articles"
    notes "This returns a list of law articles matching the specified query options"
    param :query, :law, :string, :optional, "Queries law articles with a law field that starts with"
    param :query, :page, :integer, :optional, "Page number"
    param :query, :limit, :integer, :optional, "Maximum number of returned resources"
    param :query, :sort_column, :string, :optional, "Sort column"
    param_list :query, :sort_direction, :string, :optional, "Sort direction of the sort column", [ "asc", "desc"]
    response :success
    response :unprocessable_entity
    response 500, "Internal Error"
  end


  def index
    @law_articles = LawArticlesDatatable.new(params).items
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
