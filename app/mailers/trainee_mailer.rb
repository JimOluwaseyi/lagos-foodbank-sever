class TraineeMailer < ApplicationMailer

    def new_trainee_email(trainee)
        @trainee = trainee
        mail(to: 'contactus@lagosfoodbank.org', subject: 'New Trainee Application Form Submission')
      # rescue Net::OpenTimeout => e
      #   Rails.logger.error "Net::OpenTimeout error: #{e.message}"
      #   # Optionally, retry sending email or handle the error accordingly
      end
end
