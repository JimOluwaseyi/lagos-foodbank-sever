class AddLastNameToAuthors < ActiveRecord::Migration[7.1]
  def change
    add_column :authors, :last_name, :string
  end
end
