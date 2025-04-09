class CreatePartners < ActiveRecord::Migration[7.1]
  def change
    create_table :partners do |t|
      t.string :first_name
      t.string :last_name
      t.string :organ_name
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
