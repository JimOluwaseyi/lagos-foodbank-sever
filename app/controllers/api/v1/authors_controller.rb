class Api::V1::AuthorsController < ApplicationController
  before_action :set_author, only: %i[ show update destroy ]

  # GET /authors
  def index
    @authors = Author.all

    render json: @authors
  end

  # GET /authors/1
  def show
    render json: @author
  end

  # POST /authors
  def create
    @author = Author.new(author_params)
    if params[:author][:author_image].present?
      author_image = params[:author][:author_image]
      @author.author_image.attach(author_image)
    end

    if @author.save
      render json: @author, status: :created
    else
    puts author.errors.full_messages # Log the validation errors
    render json: author.errors, status: :unprocessable_entity
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
    @author.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def author_params
      params.require(:author).permit(:author_name, :last_name, :author_image, :about_author, :facebook_url, :twitter_url, :instagram_url)
    end
end




