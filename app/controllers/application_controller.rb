class ApplicationController < ActionController::Base
    before_action :set_current_user
    protected 
    def set_current_user
     
      @current_user ||= Account.find_by(:id => session[:user_id])
    
    end
end
