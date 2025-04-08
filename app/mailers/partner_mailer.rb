class PartnerMailer < ApplicationMailer

    def new_partner_email(partner)
        @partner = partner
        mail(to: 'contactus@lagosfoodbank.org', subject: 'New Partner Application Form Submission')
      # rescue Net::OpenTimeout => e
      #   Rails.logger.error "Net::OpenTimeout error: #{e.message}"
      #   # Optionally, retry sending email or handle the error accordingly
      end
end
