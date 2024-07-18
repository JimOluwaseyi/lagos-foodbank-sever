class Api::V3::VolunteersController < ApplicationController
    def index 
        @volunteer = Volunteer.all
          render json: @volunteer
       end
      
    def create
        @volunteer = Volunteer.new(volunteer_params)
        if @volunteer.save
        VolunteerMailer.new_volunteer_email(@volunteer).deliver_later
        render json: { message: 'Volunteer form submitted successfully' }, status: :ok
        else
        render json: { errors: @volunteer.errors.full_messages }, status: :unprocessable_entity
        end 
    end

    def volunteer_params
        params.require(:volunteer).permit(:last_name, :first_name, :email, :phone_number, :alt_number, :address, :state, :city, :country, :instagram, :facebook, :shirt_size, :occupation, :birthday)
    end
end
