class AddStatusToBlogs < ActiveRecord::Migration[7.1]
  def change
    add_column :blogs, :status, :string
  end
end
