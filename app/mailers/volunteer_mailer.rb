class VolunteerMailer < ApplicationMailer
    def new_volunteer_email(volunteer)
        @volunteer = volunteer
        mail(to: 'jamestone128@gmail.com', subject: 'New Volunteer Form Submission')
      # rescue Net::OpenTimeout => e
      #   Rails.logger.error "Net::OpenTimeout error: #{e.message}"
      #   # Optionally, retry sending email or handle the error accordingly
      end
end
