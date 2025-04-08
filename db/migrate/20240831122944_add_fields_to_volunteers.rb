class AddFieldsToVolunteers < ActiveRecord::Migration[7.1]
  def change
    add_column :volunteers, :why_volunteer, :text
    add_column :volunteers, :comfort, :string
    add_column :volunteers, :program_type, :string
    add_column :volunteers, :skills, :text
    add_column :volunteers, :experience, :string
    add_column :volunteers, :travel, :string
  end
end
