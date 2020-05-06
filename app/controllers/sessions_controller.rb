class SessionsController < ApplicationController

    def home

    end

    def destroy
        session.clear 
        # session.delete :user_id 
        redirect_to '/'
    end
end