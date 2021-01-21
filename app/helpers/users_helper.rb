module UsersHelper

    def claimed_or_unclaimed(contract)
        if !contract.contract_is_claimed?
            "Unclaimed"
        else
            "Claimed by: #{link_to User.find(contract.claimed_by.id).name, user_path(contract.claimed_by.id)}".html_safe
        end
        
    end

    def show_school
        if @user.witcher? 
            content_tag(:h3, "#{@user.school.name}") 
        end
    end

    def claimed_or_posted_by
        if @user.witcher? && @user == current_user
            content_tag(:h4, "Claimed contracts:")
        elsif !@user.witcher?
            content_tag(:h4, "Posted contracts:")
        end
    end

    def coins_in_the_bank
        if @user.witcher? && @user == current_user
            "Total number of coins earned: #{@user.total_rewards}"
            #byebug
        end
    end
    
end
 