class CreateAgricGalleries < ActiveRecord::Migration[7.1]
  def change
    create_table :agric_galleries do |t|

      t.timestamps
    end
  end
end
