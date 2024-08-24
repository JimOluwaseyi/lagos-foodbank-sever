class ContactMailer < ApplicationMailer
  def new_contact_email(contact)
    @contact = contact
    mail(to: 'heyjim128@gmail.com', subject: 'New Contact Form Submission')
  # rescue Net::OpenTimeout => e
  #   Rails.logger.error "Net::OpenTimeout error: #{e.message}"
  #   # Optionally, retry sending email or handle the error accordingly
  end
end
