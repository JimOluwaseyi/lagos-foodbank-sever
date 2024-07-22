class AgricGallery < ApplicationRecord
    has_many_attached :images,  service: :cloudflare_gallery

end
