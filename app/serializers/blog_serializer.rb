# 



class BlogSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  belongs_to :author, serializer: AuthorSerializer
  attributes :id, :title, :content, :author_id, :is_important, :created_at

  attribute :blog_image_url

  def blog_image_url
    polymorphic_url(object.blog_image) if object.blog_image.attached?
  end
  
  
end