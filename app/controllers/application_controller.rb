class ApplicationController < ActionController::Base

    include ApplicationHelper

    private

    def redirect_if_not_logged_in
        redirect_to signin_path if !logged_in?
    end


   

end
