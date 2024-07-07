class Api::V2::AgricGalleriesController < ApplicationController
  before_action :set_gallery, only: [:show, :destroy]

  # GET /agric_galleries
  def index
    @galleries = AgricGallery.order(created_at: :asc).page(params[:page]).per(16)
    render json: {
      galleries: @galleries.map { |gallery| gallery.as_json.merge(images: gallery.images.map { |image| url_for(image) }) },
      meta: {
        total_pages: @galleries.total_pages,
        current_page: @galleries.current_page,
        next_page: @galleries.next_page,
        prev_page: @galleries.prev_page,
      }

    }
  end

  # GET /agric_galleries/:id
  def show
    render json: @gallery.as_json.merge(images: @gallery.images.map { |image| url_for(image) })
  end

  # POST /agric_galleries
  def create
    @gallery = AgricGallery.new

    Rails.logger.info "Parameters: #{params.inspect}"

    if gallery_params[:images]
      gallery_params[:images].values.each do |image|
        @gallery.images.attach(image)
      end
    end

    if @gallery.save
      render json: @gallery.as_json.merge(images: @gallery.images.map { |image| url_for(image) }), status: :created
    else
      render json: @gallery.errors, status: :unprocessable_entity
    end
  end 

  # DELETE /agric_galleries/:id
  def destroy
    @gallery.images.each(&:purge)
    @gallery.destroy
    head :no_content
  end

  private

  def set_gallery
    @gallery = AgricGallery.find(params[:id])
  end

  def gallery_params
    params.require(:agric_gallery).permit(images: {})
  end
end
