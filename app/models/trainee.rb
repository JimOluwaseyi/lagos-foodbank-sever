class Trainee < ApplicationRecord
    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :phone_number, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :gender, presence: true
    validates :address, presence: true
    validates :lga, presence: true
    validates :closest_bustop, presence: true
    validates :highest_quali, presence: true
    validates :first_degree, presence: true
    validates :work_experience, presence: true
    validates :desired_role, presence: true
    validates :proficiency_excel, presence: true
    validates :currently_working, presence: true
    validates :reason_apply, presence: true
    validates :gender, presence: true

end
