class AuthorSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id , :author_name,  :author_image, :last_name, :about_author, :facebook_url, :twitter_url, :instagram_url
  attribute :author_image
  has_many :blogs

  def author_image
    rails_blob_url(object.author_image, only_path: false) if object.author_image.attached?
  end
end


# class AuthorSerializer < ActiveModel::Serializer
#   include Rails.application.routes.url_helpers
#   attributes :id, :author_name, :about_author, :facebook_url, :twitter_url, :instagram_url
#   has_many :blogs

#   # Renamed to _url for clarity and using updated URL generation
#   attribute :author_image_url

#   def author_image_url
#     if object.author_image.attached?
#       polymorphic_url(object.author_image) # New recommended approach
#       # Or alternatively:
#       # rails_blob_url(object.author_image, disposition: "attachment")
#     end
#   end
# end