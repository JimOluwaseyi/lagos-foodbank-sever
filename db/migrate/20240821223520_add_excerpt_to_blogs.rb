class AddExcerptToBlogs < ActiveRecord::Migration[7.1]
  def change
    add_column :blogs, :excerpt, :text
  end
end
