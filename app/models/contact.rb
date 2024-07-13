class Contact < ApplicationRecord
   validates :text_content, :first_name, :last_name, :phone_number, :email, presence: true
   validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }

end
