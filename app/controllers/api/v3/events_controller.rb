class Api::V3::EventsController < ApplicationController
    def index 
        event = Event.all
        render json: event

    end

    def show 
        event = Event.find(params[:id])
        render json: event
    end

    def create
        event = Event.new(event_params)
        
        if params[:event][:image].present?
          event.image.attach(params[:event][:image])
        end
      
        if event.save
          render json: { message: 'Event created successfully', event: event }, status: :created
        else
          render json: { errors: event.errors.full_messages }, status: :unprocessable_entity
        end
      end


    def update 
        event = Event.find(params[:id])
        if event.update(event_params)
            render json: { message: 'Event updated successfully' }, status: :ok
        else
            render json: event.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        event = Event.find(params[:id])
        event.destroy!

    end

    private

    def event_params
        params.require(:event).permit(:title, :desc, :date, :time, :image)

    end

end
