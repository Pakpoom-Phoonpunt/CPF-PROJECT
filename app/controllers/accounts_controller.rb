class AccountsController < ApplicationController
    def index
        puts session[:user_id]
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
        
    end
    private
    def user_params
        params.require(:user).permit(:username, :password)
    end

    def dashboard
        @factory = @current_user.factory
        @department = @factory.department
    end
end
