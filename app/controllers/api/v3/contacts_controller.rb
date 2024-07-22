class Api::V3::ContactsController < ApplicationController
 def index 
  @contact = Contact.all
    render json: @contact
 end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.new_contact_email(@contact).deliver_later
      render json: { message: 'Contact form submitted successfully' }, status: :ok
    else
      render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
    end 
  end
  def contact_params
params.require(:contact).permit(:first_name, :last_name, :text_content, :email, :phone_number)
  end
end
