class  Api::V1::BlogsController < ApplicationController
  # before_action :set_blog, only: %i[ show update destroy ]

  # GET /blogs
  def index
    blogs = Blog.includes(:author).order(created_at: :desc).page(params[:page]).per(9)
    
    render json: {
      blogs: ActiveModelSerializers::SerializableResource.new(blogs, each_serializer: BlogSerializer),
      meta: {
        current_page: blogs.current_page,
        total_pages: blogs.total_pages,
        total_entries: blogs.total_count
      }
    }
  end

  # GET /blogs/1
  def show
    render json: @blog
  end

  # POST /blogs
  def create
    @blog = Blog.new(blog_params)
    @blog.is_important = params[:blog][:is_important].present? ? params[:blog][:is_important] : false
    if params[:blog][:blog_image].present?
      blog_image = params[:blog][:blog_image]
      @blog.blog_image.attach(blog_image)
    end
    if @blog.save
      render json: @blog, status: :created
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blogs/1
  def update
    if @blog.update(blog_params)
      render json: @blog
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  # DELETE /blogs/1
  def destroy
    @blog.destroy!
  end

  private

  
    # def set_blog
    #   # @blog = @author.blogs.find(params[:id])

    # end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :content, :blog_image, :is_important, :author_id, :created_at)
    end
end
