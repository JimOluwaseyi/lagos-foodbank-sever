class CreateTrainees < ActiveRecord::Migration[7.2]
  def change
    create_table :trainees do |t|
      t.string :last_name
      t.string :first_name
      t.string :phone_number
      t.string :email
      t.string :gender
      t.string :address
      t.string :lga
      t.string :closest_bustop
      t.string :highest_quali
      t.string :additional_quali
      t.string :first_degree
      t.string :work_experience
      t.string :desired_role
      t.string :proficiency_excel
      t.string :currently_working
      t.text :reason_apply

      t.timestamps
    end
  end
end
