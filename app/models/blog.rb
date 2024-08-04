class Blog < ApplicationRecord
  belongs_to :author
  has_one_attached :blog_image
  validates :title, :content, :author_id, :blog_image,  presence: true

end
