class Api::V3::TraineesController < ApplicationController
    def index 
      @trainee = Trainee.all
      render json: @trainee
    end
   
     def create
       @trainee = Trainee.new(trainee_params)
       if @trainee.save
         TraineeMailer.new_trainee_email(@trainee).deliver_later
         render json: { message: 'Trainee form submitted successfully' }, status: :ok
       else
         render json: { errors: @trainee.errors.full_messages }, status: :unprocessable_entity
       end 
     end
     def trainee_params
    params.require(:trainee).permit(
      :last_name,
      :first_name,
      :phone_number,
      :email,
      :gender,
      :address,
      :lga,
      :closest_bustop,
      :highest_quali,
      :additional_quali,
      :first_degree,
      :work_experience,
      :desired_role,
      :proficiency_excel,
      :currently_working,
      :reason_apply
    )
     end
   end
   