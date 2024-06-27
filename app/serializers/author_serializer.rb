class AuthorSerializer < ActiveModel::Serializer
  attributes :id , :author_name , :author_image, :about_author, :facebook_url, :twitter_url, :instagram_url
  attribute :author_image
  has_many :blogs

  def author_image
    object.author_image.attached? ? Rails.application.routes.url_helpers.rails_blob_url(object.author_image, only_path: true) : nil
  end
end
