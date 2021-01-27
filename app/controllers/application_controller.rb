class ApplicationController < ActionController::Base

    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

    include ApplicationHelper

    def handle_record_not_found
        flash[:message] = "Sorry, that page does not exist."
        redirect_to root_path 
      end

    private

    def redirect_if_not_logged_in
        redirect_to signin_path if !logged_in?
        # flash[:message] = "You must be logged in to view that."
    end


   

end
