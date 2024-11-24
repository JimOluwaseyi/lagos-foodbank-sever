class Api::V3::PartnersController < ApplicationController
  def index 
    @partner = Partner.all
    render json: @partner
  end
 
   def create
     @partner = Partner.new(partner_params)
     if @partner.save
       PartnerMailer.new_partner_email(@partner).deliver_later
       render json: { message: 'Partner form submitted successfully' }, status: :ok
     else
       render json: { errors: @partner.errors.full_messages }, status: :unprocessable_entity
     end 
   end
   def partner_params
      params.require(:partner).permit(:first_name, :last_name, :organ_name, :email, :address)
   end
 end
 