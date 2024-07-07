class FamilyGallery < ApplicationRecord
    has_many_attached :family_images,  service: :cloudflare_gallery

end
