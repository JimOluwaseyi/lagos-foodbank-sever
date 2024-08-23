class  Api::V1::BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :update, :destroy]

  # GET /blogs
  # def index

  #   per_page = params[:per_page] || 9 # Default to 9 if `per_page` is not provided
  #   blogs = Blog.includes(:author).order(created_at: :desc).page(params[:page]).per(per_page)

    
  #   render json: {
  #     blogs: ActiveModelSerializers::SerializableResource.new(blogs, each_serializer: BlogSerializer),
  #     meta: {
  #       current_page: blogs.current_page,
  #       total_pages: blogs.total_pages,
  #       total_entries: blogs.total_count
  #     }
  #   }
  # end


  def index
    per_page = params[:per_page] || 9 # Default to 9 if `per_page` is not provided
  
    # Filter blogs by status if provided, otherwise retrieve all blogs
    if params[:status].present?
      blogs = Blog.where(status: params[:status]).includes(:author).order(created_at: :desc).page(params[:page]).per(per_page)
    else
      blogs = Blog.includes(:author).order(created_at: :desc).page(params[:page]).per(per_page)
    end
    
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
    @blog = Blog.find(params[:id])
    render json: @blog, serializer: BlogSerializer
  end

  # POST /blogs
  def create
    @blog = Blog.new(blog_params)
    @blog.is_important = params[:blog][:is_important].present? ? params[:blog][:is_important] : false
    if params[:blog][:blog_image].present?
      blog_image = params[:blog][:blog_image]
      @blog.blog_image.attach(blog_image)
    end
    @blog.status = params[:blog][:status] || 'draft'

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

  def destroy
    @blog = Blog.find_by(id: params[:id], author_id: params[:author_id])
  
    if @blog
      @blog.destroy!
      render json: { message: 'Blog deleted successfully' }, status: :ok
    else
      render json: { error: 'Blog not found' }, status: :not_found
    end
  end

  private


  def set_blog
    @blog = Blog.find_by(id: params[:id])
    render json: { error: 'Blog not found' }, status: :not_found unless @blog
  end


    # Only allow a list of trusted parameters through.
   
    def blog_params
      params.require(:blog).permit(:title, :content, :excerpt, :blog_image, :is_important, :author_id, :status)
    end
end
