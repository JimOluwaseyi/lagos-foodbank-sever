class CreateVolunteers < ActiveRecord::Migration[7.1]
  def change
    create_table :volunteers do |t|
      t.string :last_name
      t.string :first_name
      t.string :email
      t.string :phone_number
      t.string :alt_number
      t.string :address
      t.string :state
      t.string :city
      t.string :country
      t.string :instagram
      t.string :facebook
      t.string :shirt_size
      t.string :occupation
      t.string :birthday

      t.timestamps
    end
  end
end
