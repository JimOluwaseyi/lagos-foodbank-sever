class AuthorSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id , :author_name,  :author_image, :last_name, :about_author, :facebook_url, :twitter_url, :instagram_url
  attribute :author_image
  has_many :blogs

  def author_image
    rails_blob_url(object.author_image, only_path: false) if object.author_image.attached?
  end
end

