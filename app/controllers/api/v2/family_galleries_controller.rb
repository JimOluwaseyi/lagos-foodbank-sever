class Api::V2::FamilyGalleriesController < ApplicationController
  before_action :set_gallery, only: [:show, :destroy]

  # GET /family_galleries
  def index
    @galleries = FamilyGallery.order(created_at: :asc).page(params[:page]).per(16)
    render json: {
      galleries: @galleries.map { |gallery| gallery.as_json.merge(family_images: gallery.family_images.map { |image| url_for(image) }) },
      meta:{
        total_pages: @galleries.total_pages,
        current_page: @galleries.current_page,
        next_page: @galleries.next_page,
        prev_page: @galleries.prev_page,
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

  private

  def set_gallery
    @gallery = FamilyGallery.find(params[:id])
  end

  def gallery_params
    params.require(:family_gallery).permit(family_images: {})
  end
end
