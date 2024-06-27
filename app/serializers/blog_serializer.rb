class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :author_id, :is_important

  attribute :blog_image

  def blog_image
    object.blog_image.attached? ? Rails.application.routes.url_helpers.rails_blob_url(object.blog_image, only_path: true) : nil
  end
end
