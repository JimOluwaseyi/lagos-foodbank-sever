class CreateFamilyGalleries < ActiveRecord::Migration[7.1]
  def change
    create_table :family_galleries do |t|

      t.timestamps
    end
  end
end
