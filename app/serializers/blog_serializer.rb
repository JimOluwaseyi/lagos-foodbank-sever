class BlogSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
belongs_to :author, serializer: AuthorSerializer
  attributes :id, :title, :content, :author_id, :is_important, :created_at
  

  attribute :blog_image
  
  def blog_image
    rails_blob_url(object.blog_image, only_path: false) if object.blog_image.attached?
  end
end

