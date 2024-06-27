class Author < ApplicationRecord
    has_many :blogs
    has_one_attached :author_image

    validates :author_name, presence: true
    validates :author_image, presence: true
    validates :about_author, presence: true
  
    validates :facebook_url, presence: true
    validates :twitter_url, presence: true
    validates :instagram_url, presence: true
  end
  
