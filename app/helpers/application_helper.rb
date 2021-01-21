module ApplicationHelper

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def menu_bar
        if session[:user_id]
            if current_user.witcher? 
              link_to "Available Contracts", contracts_path + " | "
            else
                link_to "Post New Contract", new_contract_path + " | "
            end
        "#{link_to "Log Out", logout_path} | Currently signed in as: #{link_to current_user.name, user_path(current_user.id)}"
        else
            link_to "Sign In", signin_path
        end
    end


end
