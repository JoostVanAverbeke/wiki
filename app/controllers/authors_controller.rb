class AuthorsController < ApplicationController
  include Swagger::Docs::Methods
  before_action :set_author, only: [:show, :update, :destroy]
  swagger_controller :authors, "Authors Management"

  # GET /authors
  swagger_api :index do
    summary "Queries the authors"
    notes "Queries the authors"
    param :query, :surname, :string, :optional, "Queries authors on surname field that starts with"
    param :query, :page, :integer, :optional, "Page number"
    param :query, :limit, :integer, :optional, "Maximum retrieved authors, default 10"
    param :query, :sort_column, :string, :optional, "Column to sort on, default surname"
    param :query, :sort_direction, :string, :optional, "Sorts direction of column, default ascending"
    response :success
    response :unprocessable_entity
    response 500, "Internal Error"
  end

  def index
    @authors = AuthorsDatatable.new(params).items
    render json: @authors
  end

  # GET /authors/1
  def show
    render json: @author
  end

  # POST /authors
  swagger_api :create do
    summary "To create an author"
    notes "Implementation notes, such as required params, example queries for apis are written here."
    param :form, "author[surname]", :string, :required, "Surname of author"
    param :form, "author[firstname]", :integer, :optional, "First name of author"
    # param_list :form, "author[status]", :string, :required, "Status of author, can be active or inactive"
    response :success
    response :unprocessable_entity
    response 500, "Internal Error"
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      render json: @author, status: :created, location: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /authors/1
  def update
    if @author.update(author_params)
      render json: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # DELETE /authors/1
  def destroy
    @author.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def author_params
      params.require(:author).permit(:surname, :firstname, :birthdate, :sex, :title)
    end
end
