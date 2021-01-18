module UsersHelper

    def witcher?
        #is user a witcher?
        User.find(session[:user.id]).school_id != 1
    end
    
end
