class AddNotNullConstraintToIsImportant < ActiveRecord::Migration[7.1]
  def change
    Blog.where(is_important: nil).update_all(is_important: false)
    
    change_column_null :blogs, :is_important, false
  end
end
