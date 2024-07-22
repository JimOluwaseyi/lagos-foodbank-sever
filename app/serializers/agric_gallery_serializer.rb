class AgricGallerySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :created_at, :updated_at, :images

  def images
    object.images.map do |image|
      Rails.application.routes.url_helpers.rails_blob_url(image, only_path: false)
    end
  end
end


