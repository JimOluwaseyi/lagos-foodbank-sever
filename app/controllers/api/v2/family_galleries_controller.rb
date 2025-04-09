class Api::V2::FamilyGalleriesController < ApplicationController
  before_action :set_gallery, only: [:show, :destroy]
  # before_action :authenticate_admin!, only: [:create, :update, :destroy]


  # GET /family_galleries
  # def index
  #   per_page = params[:per_page] || 16 
  #   @galleries = FamilyGallery.order(created_at: :asc).page(params[:page]).per(per_page)
  #   render json: {
  #     galleries: @galleries.map { |gallery| gallery.as_json.merge(family_images: gallery.family_images.map { |image| url_for(image) }) },
  #     meta:{
  #       total_pages: @galleries.total_pages,
  #       current_page: @galleries.current_page,
  #       next_page: @galleries.next_page,
  #       prev_page: @galleries.prev_page,
  # }
  #   }
  # end


  def index
    per_page = params[:per_page] || 16
  
    # Collect all images across galleries
    all_images = FamilyGallery.order(created_at: :desc).flat_map do |gallery|
      if gallery.family_images.attached?
        gallery.family_images.map { |image| { id: gallery.id, image_url: url_for(image) } }
      else
        [] # Return empty array if no images attached
      end
    end
  
    # Debugging: Log the total number of images found
    Rails.logger.info "Total images found: #{all_images.size}"
  
    # Paginate the images instead of galleries
    paginated_images = Kaminari.paginate_array(all_images).page(params[:page]).per(per_page)
  
    render json: {
      galleries: paginated_images,
      meta: {
        total_pages: paginated_images.total_pages,
        current_page: paginated_images.current_page,
        next_page: paginated_images.next_page,
        prev_page: paginated_images.prev_page,
      }
    }
  end
  
  # GET /family_galleries/:id
  def show
    render json: @gallery.as_json.merge(family_images: @gallery.family_images.map { |image| url_for(image) })
  end

  # POST /family_galleries
  def create
    @gallery = FamilyGallery.new

    Rails.logger.info "Parameters: #{params.inspect}"

    if gallery_params[:family_images]
      gallery_params[:family_images].values.each do |image|
        @gallery.family_images.attach(image)
      end
    end

    if @gallery.save
      render json: @gallery.as_json.merge(family_images: @gallery.family_images.map { |image| url_for(image) }), status: :created
    else
      render json: @gallery.errors, status: :unprocessable_entity
    end
  end

  # DELETE /family_galleries/:id
  def destroy
    @gallery.family_images.each(&:purge)
    @gallery.destroy
    head :no_content
  end


  # def count
  #   @gallery_count = FamilyGallery.count
  #   render json: { count: @gallery_count }
  # end


  def count
    # This will sum up the number of images in each AgricGallery
    @gallery_count = FamilyGallery.sum { |gallery| gallery.family_images.count }
  
    render json: { count: @gallery_count }
  end
  

  private

  def set_gallery
    @gallery = FamilyGallery.find(params[:id])
  end

  def gallery_params
    params.require(:family_gallery).permit(family_images: {})
  end
end
