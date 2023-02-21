class EnrolsController < ApplicationController
    def new
        
    end

    def create
        
    end

    def create_enrol
        @enrol = Enrol.new(user_id: session[:user_id],
            event_id: params[:event_id]
        )
        if @enrol.save 
            redirect_to users_path
        else
            redirect_to users_path, status: :unprocessable_entity
        end
    end


end
