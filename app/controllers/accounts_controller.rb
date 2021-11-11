class AccountsController < ApplicationController
    def index
        
        puts session[:user_id]
        @current_user ||= Account.find_by(:id => session[:user_id])
    end
    def new
        @user = Account.new
    end

    def create
        @user = Account.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path 
        else
            reder :new
        end
    end
    
    def show
        @user = Account.find(params[:id])
    end
    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
