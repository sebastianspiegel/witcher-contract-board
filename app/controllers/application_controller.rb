class ApplicationController < ActionController::Base

    include ApplicationHelper

    private

    def redirect_if_not_logged_in
        flash[:message] = "You must be logged in to view that."
        redirect_to signin_path if !logged_in?
    end


   

end
