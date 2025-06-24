class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :desc
      t.string :date
      t.string :time

      t.timestamps
    end
  end
end
