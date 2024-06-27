class CreateAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :authors do |t|
      t.string :author_name
      t.string :author_image
      t.text :about_author
      t.string :facebook_url
      t.string :twitter_url
      t.string :instagram_url

      t.timestamps
    end
  end
end
