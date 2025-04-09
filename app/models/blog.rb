class Blog < ApplicationRecord
  belongs_to :author
  has_one_attached :blog_image
  validates :title, :content, :excerpt, :author_id, :blog_image,  presence: true
  validates :status, inclusion: { in: %w[draft published] }

  scope :published, -> { where(status: 'published') }
  scope :draft, -> { where(status: 'draft') }

end
