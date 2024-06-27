class AddBlogImageToBlogs < ActiveRecord::Migration[7.1]
  def change
    add_column :blogs, :blog_image, :string
  end
end
