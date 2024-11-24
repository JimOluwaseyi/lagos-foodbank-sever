class Partner < ApplicationRecord
    validates :first_name, :last_name, :email, :organ_name, :address, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  end
