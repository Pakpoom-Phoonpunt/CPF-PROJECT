module ApplicationHelper
    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= Account.find_by(:id => session[:user_id]) if !!session[:user_id]
    end
end
