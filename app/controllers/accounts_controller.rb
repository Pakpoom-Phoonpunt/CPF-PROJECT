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
            render :new
        end
    end
    
    def show
        
    end
    
    def dashboard
        task_list
        @factory = @current_user.factory
        @department = @factory.departments.all
    end

    def task_list
        if params[:department]
            @tasks = Department.get_tasklist(params[:department])
        else
            @tasks = []
        end
    end 
    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end