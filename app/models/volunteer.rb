class Volunteer < ApplicationRecord
    validates :last_name, :first_name, :email, :phone_number, :alt_number, :address, :state, :city, :country, :instagram, :facebook, :shirt_size, :occupation, :birthday, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }

    validates :why_volunteer, :comfort, :program_type, :skills, :experience, :travel, presence: true

end
