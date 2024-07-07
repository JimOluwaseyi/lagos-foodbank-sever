class FamilyGallerySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :created_at, :updated_at, :family_images

  def family_images
    object.family_images.map do |image|
      Rails.application.routes.url_helpers.rails_blob_url(family_images, only_path: false)
    end
  end

end
